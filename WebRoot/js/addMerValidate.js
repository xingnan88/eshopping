
function validate(){
	var merName = document.getElementById('merName').value;
	var merPrice = document.getElementById('merPrice').value;
	var merDiscount = document.getElementById('merDiscount').value;
	var upload = document.getElementById('upload').value;
	var merPlace = document.getElementById('merPlace').value;
	var merProducter = document.getElementById('merProducter').value;
	var merLeaveDate = document.getElementById('merLeaveDate').value;
	var merDesc = document.getElementById('merDesc').value;
	var merNameMessage = document.getElementById('merNameMessage');
	var merPriceMessage = document.getElementById('merPriceMessage');
	var merDiscountMessage = document.getElementById('merDiscountMessage');
	var merUploadMessage = document.getElementById('merUploadMessage');
	var merPlaceMessage = document.getElementById('merPlaceMessage');
	var merProducterMessage = document.getElementById('merProducterMessage');
	var merLeaveDateMessage = document.getElementById('merLeaveDateMessage');
	var merDescMessage = document.getElementById('merDescMessage');
	if(merName == "" || merName == null){
		merNameMessage.innerHTML = "商品名不能为空";
		return false;
	}
	if(merPrice == "" || merPrice == null){
		merPriceMessage.innerHTML = "商品价格不能为空";
		return false;
	}
	if(!isMoney(merPrice)){
		merPriceMessage.innerHTML = "价格应为数字";
		return false;
	}
	if(merDiscount != ""){
		if(!isMoney(merDiscount))
		{
			merDiscountMessage.innerHTML = "折扣应为数字";
			return false;
		}
	}
	if(upload == "" || upload == null){
		merUploadMessage.innerHTML = "请选择图片";
		return false;
	}
	if(merPlace == "" || merPlace == null){
		merPlaceMessage.innerHTML = "请填写出产地";
		return false;
	}
	if(merProducter == "" || merProducter == null){
		merProducterMessage.innerHTML = "请填写出产厂家";
		return false;
	}
	if(merLeaveDate == "" || merLeaveDate == null){
		merLeaveDateMessage.innerHTML = "出厂时间";
		return false;
	}
	return true;
}

function isMoney(s)
			{
				var patrn=/^([0-9]+|[0-9]{1,3}(,[0-9]{3})*)(.[0-9]{1,2})?$/;
				if (!patrn.exec(s)) 
					return false
				return true
			}