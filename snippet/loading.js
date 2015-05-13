Значок загрузки

		setTimeout(animate, 500);

		var animationString="LOADING",
			animationCharIndex=0,
			animationStop=false;

		function animate(){
			text = animationString.slice(0, Math.max(0, animationCharIndex)) +'<span style="color: #ccc">' + animationString.charAt(animationCharIndex) + '</span>' + animationString.slice(animationCharIndex+ 1);
			$('.loading').html(text);
			animationCharIndex++;
			if (animationCharIndex > animationString.length){
				animationCharIndex = 0;
			}
			if (!animationStop){
				setTimeout(animate, 500);
			}
		}

		function iamReady(){
			animationStop = true;
			$('#realtimeboardApp').attr('ready', 'ok');
			$('#realtimeboardApp').css('visibility', 'visible');
			$('.loading').hide();
