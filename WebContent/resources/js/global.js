function init(context){
	var bt = document.getElementById('bt');
	bt.onclick = move(context);
}

function move(context) {
	alert('Douglas 가기 직전.....');
	location.href = context + "/douglas.do?";
}
