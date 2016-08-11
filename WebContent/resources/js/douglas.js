var context = {
	name : '',
	setContext : function(context){
		this.name = context;
	},
	init : function(context) {
		var bt_bom = document.querySelector('#bt_bom');
		var bt_dom = document.querySelector('#bt_dom');
		var bt_kaup = document.querySelector('#bt_kaup');
		var bt_account = document.querySelector('#bt_account');
		
		console.log('CONTEXT : ' + context);
		this.setContext(context);
		console.log('CONTEXT : ' + this.name);
		
		bt_bom.addEventListener('click', function() {
			location.href = context + '/douglas.do?page=bom';	
		}, false);  //콜백 함수
		bt_dom.addEventListener('click', function() {
			location.href = context + '/douglas.do?page=dom';			
		}, false);
		bt_kaup.addEventListener('click', function() {
			location.href = context + '/douglas.do?page=kaup';
		}, false);
		bt_account.addEventListener('click', function() {
			location.href = context + '/douglas.do?page=account';
		}, false);
	}
};


var create = {
	creator_init : function() {
		document.querySelector('#bt_spec_show').addEventListener('click', member_spec, false);
		document.querySelector('#bt_make_account').addEventListener('click', account_spec, false);
		document.querySelector('#bt_deposit').addEventListener('click', account_deposit, false);
		document.querySelector('#bt_withdraw').addEventListener('click', account_withdraw, false);
	}
};

function account_spec(){  //JSON 표기법 (객체 리터럴)
	var account = {
		account_no : 0,
		money : 0
	}
	account.account_no = Math.floor(Math.random() * 899999) + 100000;
	document.querySelector('#result_account').innerHTML = account.account_no;
	document.querySelector('#rest_money').innerHTML = account.money;
}

function member_spec(){
	var member = new Object();
	member.name = document.querySelector('#name').value;
	var ssn = document.querySelector('#ssn').value;
	var ssn_sec = parseInt(ssn.substring(7, 8));
	member.age = 0;
	member.gender = '';
	var date = new Date().getFullYear();
	var ssn_sub = ssn.substring(0, 6) / 10000;
	
	switch(ssn_sec){
    	case 1: case 5: 
		    member.gender = "남"; 
		    member.age = parseInt((date - 1900 - ssn_sub) + 2);
	    	break;
	    	
	    case 3: case 7:
		    member.gender = "남"; 
		    member.age = parseInt((date - 2000 - ssn_sub) + 2);
		    break;
		    
	    case 2: case 6:
		    member.gender = "여";
		    member.age = parseInt((date - 1900 - ssn_sub) + 2);
		    break;
		    
	    case 4: case 8:
		    member.gender = "여";
		    member.age = parseInt((date - 2000 - ssn_sub) + 2);
		    break;
		    
		default :
			member.gender = "default 값을 입력했습니다.";
		    break;
	}
	document.querySelector('#result_name').innerHTML = member.name;
	document.querySelector('#result_age').innerHTML = member.age;
	document.querySelector('#result_gender').innerHTML = member.gender;
}

function account_deposit(){
	var money = document.querySelector('#money').value;
    document.querySelector('#rest_money').innerHTML = money;    
}

function account_withdraw(){
	var money = document.querySelector('#money').value;
	document.querySelector('#rest_money').innerHTML = -money;
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