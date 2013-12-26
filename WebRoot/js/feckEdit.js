var oRequest;
if (window.ActiveXObject) {
	oRequest = new ActiveXObject("Microsoft.XMLHTTP");
} else {
	oRequest = new XMLHttpRequest();
}
//ie中不支持trim()方法，加入下面的trim()方法定义便可
 String.prototype.trim=function(){return this.replace(/(^\s*)|(\s*$)/g,"");}
 
function validateUser(){
	var username = document.getElementById("username").value;
	var password = document.getElementById("password").value;
	var rand = document.getElementById("rand").value;
	var message = document.getElementById("message");
	if(username == ""){
		message.innerHTML="用户名不能为空";
		return null;
	}
	if(password == ""){
		message.innerHTML="密码不能为空";
		return null;
	}
	if(rand == ""){
		message.innerHTML="验证码不能为空";
		return null;
	}
	//要提交的处理页面时哪个
	var url = "head/loginJson?username=" + username + "&password=" + password
			+ "&rand=" + rand;
	oRequest.open("POST", url, true);
	oRequest.onreadystatechange = function() {
		if (oRequest.readyState == 4) {
			var login = eval('(' + oRequest.responseText + ')');
			if ("验证码错误" != login.result.trim() && "用户名或密码错误" != login.result.trim()) {
			document.getElementById('login').style.display = "none";
			document.location="/e_shop/head/index.action";
		}
			message.innerHTML=login.result;
		}
	};
	oRequest.send();
}

function add() {
	var merName = document.getElementById('merName').value;
	var num = document.getElementById('num').value;
	if(num == "" ){
		alert("请选择件数");
		return null;
	}
	if(num < 1){
		alert("请至少选择一件");
		return null;
	}
	var price = document.getElementById('price').value;
	var id = document.getElementById('id').value;
	var url = "/e_shop/head/cartJson!add?price=" + price + "&id=" + id
			+ "&num=" + num;

	oRequest.open("POST", url, true);
	oRequest.onreadystatechange = function() {
		if (oRequest.readyState == 4) {
			var cartmer = eval('(' + oRequest.responseText + ')');
			if(cartmer.result != "添加成功!")
				alert(cartmer.result);
			var d2 = document.getElementById('showmer');
			var cart = document.getElementById('cart');
			var mer = " ";
			for ( var i = 0; i < cartmer.carts.length; i++) {
				mer += "名称: " + cartmer.carts[i].merchantable.merName + "<br/>"
						+ "数目:" + cartmer.carts[i].cartNum + "<br/>";
				if (cartmer.carts[i].merchantable.merDiscount != null) {
					mer += "单价: " + cartmer.carts[i].merchantable.merPrice
							* cartmer.carts[i].merchantable.merDiscount * 0.1
							+ "元<br/>" + "合计: "
							+ cartmer.carts[i].merchantable.merPrice
							* cartmer.carts[i].merchantable.merDiscount * 0.1
							* cartmer.carts[i].cartNum + "元<br/><br/>"
				} else {
					mer += "单价: " + cartmer.carts[i].merchantable.merPrice
							+ "元<br/>" + "合计: "
							+ cartmer.carts[i].merchantable.merPrice
							* cartmer.carts[i].cartNum + "元<br/><br/>";
				}
			}
			cart.innerHTML = mer;
			alert(cartmer.result);
			
		}
	};
	oRequest.send();
}
function evaluation() {
	var merId = document.getElementById('id').value;
	var eva = document.getElementById('eva');
	var url = "/e_shop/head/evalJson.action?merId=" + merId;
	oRequest.open("POST", url, true);
	oRequest.onreadystatechange = function() {
		if (oRequest.readyState == 4) {
			var evaluate = eval('(' + oRequest.responseText + ')');
			var temp = " ";
			for ( var i = 0; i < evaluate.evals.length; i++) {
				temp += "用户: " + evaluate.evals[i].member.memName
						+ "&nbsp;&nbsp;时间:" + evaluate.evals[i].evalDate
						+ "<br/><br/>评价内容: " + evaluate.evals[i].evalContent
						+ "<br/><br/>";
			}
			eva.innerHTML = temp;
		}
	}
	oRequest.send();
}

//fckedit设置

function addEval() {
	document.getElementById('addeval').style.display = "block";
}
//添加评论
function addData(editValue) {
	var merId = document.getElementById('id').value;
	var url = "/e_shop/head/addEvalJson.action?merId=" + merId + "&content="
			+ editValue;
	oRequest.open("POST", url, true);
	oRequest.onreadystatechange = function() {
		if (oRequest.readyState == 4) {
			var evaluate = eval('(' + oRequest.responseText + ')');
			if(evaluate.result != null){
				alert(evaluate.result);
			}else{
				evaluation();
			}
		}
	}
	oRequest.send();
}