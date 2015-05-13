################################################
# MINDAY 0.009Tu
# file.coffee
# Файловые утилиты
################################################

# Текущее имя файла
filename = "minday"

# Устанавливаем ссылки на меню
setMenuFile = ->
	$("#brand").click fileStart
	$(".file_new").click fileNew
	$(".file_open").click fileOpen
	$(".file_collaborative").click fileCollaborative
	$(".file_save").click fileSave
	$(".file_save_as").click fileSaveAs
	$(".file_import").click fileImport
	$(".file_export").click fileExport
	$(".file_exportodt").click fileExportODT
	$(".file_exportodp").click fileExportODP # Пока отключен, так как styles.xml слишком большой
	$(".file_exit").click fileExit
	$(".file_saveasserver").click fileSaveAs


fileStart =->
	selectModel("start",true)

# Новый файл
fileNew = ->
	if confirm "Удалить существующие данные и создать новую модель?"
		deleteIdea()
		filename = "minday"
		md = add "Новая модель",frame:yes
		md.fhtml()

cloneIdea = (source) ->
	ia = idea[-source.id]
	if source.data?
		for ik,i in source.data
			ia[i] = idea[Math.abs(ik)]
	for key of source
		if source.hasOwnProperty(key) and key isnt "data"
			ik = source[key]
			if key isnt "id" and key isnt "list" and key isnt "kind" and key isnt "ix" and key isnt "length"
				if typeof ik is "number" then ik = idea[Math.abs(ik)]
			ia[key] = ik
	ia

fileOpen = ->
	filename = prompt "Введите имя файла:",filename
	deleteIdea()
	ms = localStorage[filename]
	b = JSON.parse(ms)
	initIdea(b.length)
	for io in b.idea
		cloneIdea(io)
	idea[-b.sideaid].upperFrame().fhtml()

fileCollaborative = ->
	alert "Эта функция программы будет реализована в следующих версиях"

Idea::toJSON = ->
	ret = 
		id: @id
		txt: @txt
	if @length > 0
		ret.data = (ia.id for ia in @data)
	for key of @
		if @hasOwnProperty(key) and typeof key is "string" and key isnt "begetObject"
			val = @[key]
			if isNaN(key)
				if typeof val is "string"
					ret[key] = val
				if typeof val is "number"
					ret[key] = val
				else if typeof val is "boolean"
					ret[key] = val				
				else if typeof val is "object" and val instanceof Array
					ret[key] = "["+ (ia.id for ia in val).join(",")+"]"
				else if typeof val is "object" and val instanceof Idea
					ret[key] = val.id					
	ret

fileSave = ->
	str = JSON.stringify
		length:idea.length
		idea:idea
		sideaid: sidea.id
	localStorage[filename] = str
	alert "Файл сохранен в локальное хранилище"

# Сохранить файл
fileSaveAs = ->
	filename = prompt "Введите имя файла:",filename
	str = JSON.stringify
		length:idea.length
		idea:idea
		sideaid: sidea.id
	localStorage[filename] = str
	alert "Файл сохранен в локальное хранилище"
	# location.href="data:application/json;base64,"+Base64.encode(str)

# Функция загрузки файла
importFile = (evt) ->
	files = evt.target.files
	reader = new FileReader()
	reader.onloadend = (e) ->
		console.log "read"
		console.log e.target
		$('#file').html ""
	reader.readAsText(files[0])

# Меню для загрузки файла
# TODO: Надо переделать в диалог
fileImport = ->
	$("#file").html 'Выберите файл для загрузки: <input type="file" id="files" name="files[]" multiple />'
	$("#file").bind "change",importFile
# TODO - сделать импорт
	alert "Эта функция программы будет реализована в следующих версиях"

fileExport = ->
	data =
		length:idea.length
		idea:idea
		sideaid:sidea.id
	str = JSON.stringify(data)
	zip = new JSZip()  # Надо будет поставить "DEFLATE", когда будет найден jszip_load.js
	zip.file "main",str
	location.href="data:application/zip;base64,"+zip.generate()

fileExit = ->
	alert "Эта функция программы будет реализована в следующих версиях"

fileExportODT = ->
	zip = new JSZip()
	zip.folder "META-INF"
	str = '<?xml version="1.0" encoding="UTF-8" standalone="yes"?><manifest:manifest xmlns:manifest="urn:oasis:names:tc:opendocument:xmlns:manifest:1.0"><manifest:file-entry manifest:full-path="/" manifest:media-type="application/vnd.oasis.opendocument.text"/><manifest:file-entry manifest:full-path="mimetype" manifest:media-type="text/plain"/><manifest:file-entry manifest:full-path="content.xml" manifest:media-type="text/xml"/><manifest:file-entry manifest:full-path="settings.xml" manifest:media-type="text/xml"/><manifest:file-entry manifest:full-path="styles.xml" manifest:media-type="text/xml"/><manifest:file-entry manifest:full-path="META-INF/manifest.xml" manifest:media-type="text/xml"/><manifest:file-entry manifest:full-path="meta.xml" manifest:media-type="text/xml"/></manifest:manifest>'
	zip.file "META-INF/manifest.xml",str
	str = 'application/vnd.oasis.opendocument.text'
	zip.file "mimetype",str
	str = '<?xml version="1.0" encoding="UTF-8" standalone="yes"?><office:document-meta xmlns:office="urn:oasis:names:tc:opendocument:xmlns:office:1.0" xmlns:meta="urn:oasis:names:tc:opendocument:xmlns:meta:1.0" xmlns:dc="http://purl.org/dc/elements/1.1/" xmlns:xlink="http://www.w3.org/1999/xlink" office:version="1.1"><office:meta><meta:generator>MicrosoftOffice/14.0 MicrosoftWord</meta:generator><meta:initial-creator>Andrey Gershun</meta:initial-creator><dc:creator>Andrey Gershun</dc:creator><meta:creation-date>2012-07-24T04:16:00Z</meta:creation-date><dc:date>2012-07-24T04:17:00Z</dc:date><meta:template xlink:href="Normal" xlink:type="simple"/><meta:editing-cycles>1</meta:editing-cycles><meta:editing-duration>PT60S</meta:editing-duration><meta:document-statistic meta:page-count="1" meta:paragraph-count="1" meta:word-count="3" meta:character-count="21" meta:row-count="1" meta:non-whitespace-character-count="19"/></office:meta></office:document-meta>'
	zip.file "meta",str
	str = '<?xml version="1.0" encoding="UTF-8" standalone="yes"?><office:document-settings office:version="1.1" xmlns:anim="urn:oasis:names:tc:opendocument:xmlns:animation:1.0" xmlns:chart="urn:oasis:names:tc:opendocument:xmlns:chart:1.0" xmlns:config="urn:oasis:names:tc:opendocument:xmlns:config:1.0" xmlns:dc="http://purl.org/dc/elements/1.1/" xmlns:dr3d="urn:oasis:names:tc:opendocument:xmlns:dr3d:1.0" xmlns:draw="urn:oasis:names:tc:opendocument:xmlns:drawing:1.0" xmlns:fo="urn:oasis:names:tc:opendocument:xmlns:xsl-fo-compatible:1.0" xmlns:form="urn:oasis:names:tc:opendocument:xmlns:form:1.0" xmlns:math="http://www.w3.org/1998/Math/MathML" xmlns:meta="urn:oasis:names:tc:opendocument:xmlns:meta:1.0" xmlns:number="urn:oasis:names:tc:opendocument:xmlns:datastyle:1.0" xmlns:office="urn:oasis:names:tc:opendocument:xmlns:office:1.0" xmlns:presentation="urn:oasis:names:tc:opendocument:xmlns:presentation:1.0" xmlns:script="urn:oasis:names:tc:opendocument:xmlns:script:1.0" xmlns:smil="urn:oasis:names:tc:opendocument:xmlns:smil-compatible:1.0" xmlns:style="urn:oasis:names:tc:opendocument:xmlns:style:1.0" xmlns:svg="urn:oasis:names:tc:opendocument:xmlns:svg-compatible:1.0" xmlns:table="urn:oasis:names:tc:opendocument:xmlns:table:1.0" xmlns:text="urn:oasis:names:tc:opendocument:xmlns:text:1.0" xmlns:xforms="http://www.w3.org/2002/xforms" xmlns:xlink="http://www.w3.org/1999/xlink"/>'
	zip.file "settings.xml",str
	str = '<?xml version="1.0" encoding="UTF-8" standalone="yes"?><office:document-styles xmlns:anim="urn:oasis:names:tc:opendocument:xmlns:animation:1.0" xmlns:chart="urn:oasis:names:tc:opendocument:xmlns:chart:1.0" xmlns:config="urn:oasis:names:tc:opendocument:xmlns:config:1.0" xmlns:dc="http://purl.org/dc/elements/1.1/" xmlns:dr3d="urn:oasis:names:tc:opendocument:xmlns:dr3d:1.0" xmlns:draw="urn:oasis:names:tc:opendocument:xmlns:drawing:1.0" xmlns:fo="urn:oasis:names:tc:opendocument:xmlns:xsl-fo-compatible:1.0" xmlns:form="urn:oasis:names:tc:opendocument:xmlns:form:1.0" xmlns:math="http://www.w3.org/1998/Math/MathML" xmlns:meta="urn:oasis:names:tc:opendocument:xmlns:meta:1.0" xmlns:number="urn:oasis:names:tc:opendocument:xmlns:datastyle:1.0" xmlns:office="urn:oasis:names:tc:opendocument:xmlns:office:1.0" xmlns:presentation="urn:oasis:names:tc:opendocument:xmlns:presentation:1.0" xmlns:script="urn:oasis:names:tc:opendocument:xmlns:script:1.0" xmlns:smil="urn:oasis:names:tc:opendocument:xmlns:smil-compatible:1.0" xmlns:style="urn:oasis:names:tc:opendocument:xmlns:style:1.0" xmlns:svg="urn:oasis:names:tc:opendocument:xmlns:svg-compatible:1.0" xmlns:table="urn:oasis:names:tc:opendocument:xmlns:table:1.0" xmlns:text="urn:oasis:names:tc:opendocument:xmlns:text:1.0" xmlns:xforms="http://www.w3.org/2002/xforms" xmlns:xlink="http://www.w3.org/1999/xlink"><office:font-face-decls><style:font-face style:name="Calibri" svg:font-family="Calibri" style:font-family-generic="swiss" style:font-pitch="variable" svg:panose-1="2 15 5 2 2 2 4 3 2 4"/><style:font-face style:name="Times New Roman" svg:font-family="Times New Roman" style:font-family-generic="roman" style:font-pitch="variable" svg:panose-1="2 2 6 3 5 4 5 2 3 4"/><style:font-face style:name="Cambria" svg:font-family="Cambria" style:font-family-generic="roman" style:font-pitch="variable" svg:panose-1="2 4 5 3 5 4 6 3 2 4"/></office:font-face-decls><office:styles><style:default-style style:family="table"><style:table-properties fo:margin-left="0in" table:border-model="collapsing" style:writing-mode="lr-tb" table:align="left"/></style:default-style><style:default-style style:family="table-column"><style:table-column-properties style:use-optimal-column-width="true"/></style:default-style><style:default-style style:family="table-row"><style:table-row-properties style:min-row-height="0in" style:use-optimal-row-height="true" fo:keep-together="auto"/></style:default-style><style:default-style style:family="table-cell"><style:table-cell-properties fo:background-color="transparent" style:glyph-orientation-vertical="auto" style:vertical-align="top" fo:wrap-option="wrap"/></style:default-style><style:default-style style:family="paragraph"><style:paragraph-properties fo:keep-with-next="auto" fo:keep-together="auto" fo:widows="2" fo:orphans="2" fo:break-before="auto" text:number-lines="true" fo:border="none" fo:padding="0in" style:shadow="none" style:line-break="strict" style:punctuation-wrap="hanging" style:text-autospace="ideograph-alpha" style:snap-to-layout-grid="true" fo:text-align="start" style:writing-mode="lr-tb" fo:margin-bottom="0.1388in" fo:line-height="115%" fo:background-color="transparent" style:tab-stop-distance="0.4916in"/><style:text-properties style:font-name="Calibri" style:font-name-asian="Calibri" style:font-name-complex="Times New Roman" fo:font-weight="normal" style:font-weight-asian="normal" style:font-weight-complex="normal" fo:font-style="normal" style:font-style-asian="normal" style:font-style-complex="normal" fo:text-transform="none" fo:font-variant="normal" style:text-line-through-type="none" style:text-outline="false" style:font-relief="none" style:use-window-font-color="true" fo:letter-spacing="normal" style:text-scale="100%" style:letter-kerning="false" style:text-position="0% 100%" fo:font-size="11pt" style:font-size-asian="11pt" style:font-size-complex="11pt" fo:background-color="transparent" style:text-underline-type="none" style:text-underline-color="font-color" style:text-emphasize="none" fo:language="ru" fo:country="RU" style:language-asian="en" style:country-asian="US" style:language-complex="ar" style:country-complex="SA" style:text-combine="none" fo:hyphenate="true"/></style:default-style><style:style style:name="Обычный" style:display-name="Обычный" style:family="paragraph"><style:text-properties fo:hyphenate="false"/></style:style><style:style style:name="Основнойшрифтабзаца" style:display-name="Основной шрифт абзаца" style:family="text"/><text:notes-configuration text:note-class="footnote" text:start-value="0" style:num-format="1" text:start-numbering-at="document" text:footnotes-position="page"/><text:notes-configuration text:note-class="endnote" text:start-value="0" style:num-format="i" text:start-numbering-at="document" text:footnotes-position="document"/><style:default-style style:family="graphic"><style:graphic-properties draw:fill="solid" draw:fill-color="#4f81bd" draw:opacity="100%" draw:stroke="solid" svg:stroke-width="0.02778in" svg:stroke-color="#385d8a" svg:stroke-opacity="100%"/></style:default-style></office:styles><office:automatic-styles><style:page-layout style:name="PL0"><style:page-layout-properties fo:page-width="8.268in" fo:page-height="11.693in" style:print-orientation="portrait" fo:margin-top="0.7875in" fo:margin-left="1.1812in" fo:margin-bottom="0.7875in" fo:margin-right="0.5902in" style:num-format="1" style:writing-mode="lr-tb"><style:footnote-sep style:width="0.007in" style:rel-width="33%" style:color="#000000" style:line-style="solid" style:adjustment="left"/></style:page-layout-properties></style:page-layout></office:automatic-styles><office:master-styles><style:master-page style:name="MP0" style:page-layout-name="PL0"/></office:master-styles></office:document-styles>'
	zip.file "styles.xml",str

	str = '<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
		<office:document-content xmlns:anim="urn:oasis:names:tc:opendocument:xmlns:animation:1.0" xmlns:chart="urn:oasis:names:tc:opendocument:xmlns:chart:1.0" xmlns:config="urn:oasis:names:tc:opendocument:xmlns:config:1.0" xmlns:dc="http://purl.org/dc/elements/1.1/" xmlns:dr3d="urn:oasis:names:tc:opendocument:xmlns:dr3d:1.0" xmlns:draw="urn:oasis:names:tc:opendocument:xmlns:drawing:1.0" xmlns:fo="urn:oasis:names:tc:opendocument:xmlns:xsl-fo-compatible:1.0" xmlns:form="urn:oasis:names:tc:opendocument:xmlns:form:1.0" xmlns:math="http://www.w3.org/1998/Math/MathML" xmlns:meta="urn:oasis:names:tc:opendocument:xmlns:meta:1.0" xmlns:number="urn:oasis:names:tc:opendocument:xmlns:datastyle:1.0" xmlns:office="urn:oasis:names:tc:opendocument:xmlns:office:1.0" xmlns:presentation="urn:oasis:names:tc:opendocument:xmlns:presentation:1.0" xmlns:script="urn:oasis:names:tc:opendocument:xmlns:script:1.0" xmlns:smil="urn:oasis:names:tc:opendocument:xmlns:smil-compatible:1.0" xmlns:style="urn:oasis:names:tc:opendocument:xmlns:style:1.0" xmlns:svg="urn:oasis:names:tc:opendocument:xmlns:svg-compatible:1.0" xmlns:table="urn:oasis:names:tc:opendocument:xmlns:table:1.0" xmlns:text="urn:oasis:names:tc:opendocument:xmlns:text:1.0" xmlns:xforms="http://www.w3.org/2002/xforms" xmlns:xlink="http://www.w3.org/1999/xlink"><office:font-face-decls><style:font-face style:name="Calibri" svg:font-family="Calibri" style:font-family-generic="swiss" style:font-pitch="variable" svg:panose-1="2 15 5 2 2 2 4 3 2 4"/><style:font-face style:name="Times New Roman" svg:font-family="Times New Roman" style:font-family-generic="roman" style:font-pitch="variable" svg:panose-1="2 2 6 3 5 4 5 2 3 4"/><style:font-face style:name="Cambria" svg:font-family="Cambria" style:font-family-generic="roman" style:font-pitch="variable" svg:panose-1="2 4 5 3 5 4 6 3 2 4"/></office:font-face-decls><office:automatic-styles><style:style style:name="P1" style:parent-style-name="Обычный" style:master-page-name="MP0" style:family="paragraph"><style:paragraph-properties fo:break-before="page"/></style:style></office:automatic-styles>
		<office:body><office:text text:use-soft-page-breaks="true">'
	str += '<text:p text:style-name="P1">'+fidea.txt+'</text:p>'
	for ia in fidea
		str += '<text:p text:style-name="Обычный">'+ia.txt+'</text:p>'
	str += '</office:text></office:body></office:document-content>'
	zip.file "content.xml",str
	location.href="data:application/vnd.oasis.opendocument.text;base64,"+zip.generate()

fileExportODP = ->
	alert "Функция экспорта в PowerPoint временно отключена, из-за большого формата файла"