var context = '';

function getContext(){
	return this.context;
}

function setContext(context){
	this.context = context;
}

function init(context){
	var bt_bom = document.querySelector('#bom');
	var bt_dom = document.querySelector('#dom');
	var bt_kaup = document.querySelector('#kaup');
	
	console.log('CONTEXT : ' + context);
	this.setContext(context);
	console.log('CONTEXT : ' + this.getContext());
	
	bt_bom.addEventListener('click', bom_go, false);
	bt_dom.addEventListener('click', dom_go, false);
	bt_kaup.addEventListener('click', kaup_go, false);
	
}

function bom_go(){
	location.href = getContext() + '/douglas.do?page=bom';
}

function dom_go(){
	location.href = getContext() + '/douglas.do?page=dom';
}

/*kaup*/
function kaup_init(){
	var kaup_calc = document.querySelector('#kaup_calc');
	kaup_calc.addEventListener('click', kaup_calc, false);
}

function kaup_go(){
	location.href = getContext() + '/douglas.do?page=kaup';
}

function kaup_calc(){
	var name = document.querySelector('#name').value;
	var height = document.getElementById('height').value;
	var weight = document.getElementById('weight').value;
	console.log('name : ' + name);
	console.log('height : ' + height);
	console.log('weight : ' + weight);
	var result = '';
	var kaup = weight / (height / 100) / (height / 100);

	if (kaup < 18.5) {
		result = "저체중"; 
	} else if (kaup > 18.5 && kaup < 23) {
		result = "정상체중"; 
	} else if (kaup > 23 && kaup < 25) {
		result = "위험체중"; 
	} else if (kaup > 25 && kaup < 30) {
		result = "비만 1단계"; 
	} else if (kaup > 30 && kaup < 40) {
		result = "비만 2단계"; 
	} else if (kaup >= 40) {
		result = "비만 3단계";
	}
	document.getElementById('result').innerHTML = name + '의 카우프 결과 : ' + result;
	/*return name + "의 BMI지수는 " + Double.parseDouble(String.format("%.2f", kaup)) + "이고, " + result + "이다";*/
}