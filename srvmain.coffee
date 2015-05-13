###########################################
# Minday 0.010 Tokyo
# srvmain.coffee
# Сервер для Minday
###########################################


http = require 'http'
fs = require 'fs'
path = require 'path'
url = require 'url'
faye = require 'c:/03/node_modules/faye'

STORAGE_DIR = 'c:/05/storage'
body = {}
shares = []

# Создаем comet-сервер для канала dirty
comet = new faye.NodeAdapter({mount: '/faye', timeout: 45})

server = http.createServer (request, response) ->
	if request.headers['x-requested-with'] is 'XMLHttpRequest'

		# Сохранение файла
		if request.method is 'POST'
			if request.url.substr(0,6) is "/save="
				body = ""
				request.on 'data', (data) ->
					body += data
				request.on 'end', ->
					fs.writeFile STORAGE_DIR+"/"+request.url.substr(6),body,(err) ->
						if err then console.log "Ошибка: файл не сохранен"
						else console.log "Ок: файл сохранен"
			else if request.url is "/share"
				body = ""
				request.on 'data', (data) ->
					body += data
				request.on 'end', ->
					b = JSON.parse body
					shares.push b
					console.log "Пользователь "+b.username+" разрешил доступ к файлу "+b.filename

		# Загрузка файла
		if request.method is 'GET'
			if request.url is "/dir"
				filesInDir = fs.readdirSync(STORAGE_DIR)
				data = JSON.stringify filesInDir
				response.writeHead 200, 'content-type':'text/json'
				response.end data.toString()
				console.log data.toString()
				console.log "ок: каталог передан"
			else if request.url.substr(0,6) is '/open='
				fs.readFile STORAGE_DIR+"/"+request.url.substr(6),(err,data) ->
					if err 
						console.log "Ошибка: не могу загрузить файл"
					else 
						response.writeHead 200, 'content-type':'text/json'
						response.end data.toString()
						console.log data.toString()
						console.log "ок: файл передан"
			else if request.url is "/sharedir"
				data = JSON.stringify shares
				response.writeHead 200, 'content-type':'text/json'
				response.end data.toString()
				console.log data.toString()
				console.log "ок: каталог открытых файлов передан"



		
	else
		filePath = 'c:/05/' + request.url
		if request.url is '' then filePath = 'index.html'
		extname = path.extname(filePath)
		contentType = switch extname
			when '.js' then'text/javascript'
			when '.css' then 'text/css'
			when '.png' then 'image/png'
			when '.jpg' then 'image/jpeg'
			when '.mp3' then 'audio/mp3'
#			when '.eot' then 'application/vnd.ms-fontobject'
#			when '.svg' then 'image/svg+xml'
			else 'text/html'
		 
		path.exists filePath,(exists) ->
			if exists
				fs.readFile filePath,(error, content) -> 
					if error
						response.writeHead 500 
						response.end()
					else 
						response.writeHead 200, 'Content-Type': contentType 
						response.end content,'utf-8'
			else
				response.writeHead(404)
				response.end()

 
comet.attach server 

comet.bind 'handshake', (clientId) ->
  console.log "handshake",clientId

comet.bind 'subscribe', (clientId,channel) ->
  console.log "subscribe: ",clientId

comet.bind 'publish', (clientId,channel,data) ->
  console.log "publish: ",channel,data

server.listen(8000)


console.log 'Minday server running'
