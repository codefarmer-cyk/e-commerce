/**
 * 
 */

(function() {
	countSum();
})();

function setCookie(c_name, value, expiredays) {
	var exdate = new Date();
	exdate.setDate(exdate.getDate() + expiredays * 24 * 3600 * 1000);
	document.cookie = c_name + "=" + escape(value)
			+ ((expiredays == null) ? "" : ";expires=" + exdate.toGMTString());
}

function getCookie(c_name) {
	if (document.cookie.length > 0) {
		c_start = document.cookie.indexOf(c_name + "=");
		if (c_start != -1) {
			c_start = c_start + c_name.length + 1
			c_end = document.cookie.indexOf(";", c_start);
			if (c_end == -1)
				c_end = document.cookie.length
			return unescape(document.cookie.substring(c_start, c_end));
		}
	}
	return "";
}

function delCookie(name)// 删除cookie
{
	var exp = new Date();
	exp.setTime(exp.getTime() - 1);
	var cval = getCookie(name);
	if (cval != null)
		document.cookie = name + "=" + cval + ";expires=" + exp.toGMTString();
}

function addCart(itemId, amount) {
	var temp = getCookie("item_" + itemId);
	var total = parseInt(temp == "" ? "0" : temp) + amount;
	setCookie("item_" + itemId, total, 1);

	countSum();
}

function countSum() {
	var aCookie = document.cookie.split(";");
	var re = /^item_*/;
	var sum = 0;
	for (var i = 0; i < aCookie.length; i++) {
		var aCrumb = aCookie[i].split("=");
		if (!re.test(aCrumb[0].toString().trim())) {
			continue;
		}
		sum += parseInt(aCrumb[1].toString().trim());
	}
	$('#cart_sum').html(sum);
}

$(function() {
	var offset = $("#cart_sum").offset();
	$(".addcar").click(function(event) {
		var addcar = $(this);
		var img = $('#itemImg').attr('src');
		var flyer = $('<img class="u-flyer" src="' + img + '">');
		// alert(offset);
		flyer.fly({
			start : {
				left : event.pageX - 400, // 开始位置（必填）#fly元素会被设置成position:
				// fixed
				top : event.pageY - 800
			// 开始位置（必填）
			},
			end : {
				left : offset.left, // 结束位置（必填）
				top : offset.top, // 结束位置（必填）
				width : 0, // 结束时宽度
				height : 0
			// 结束时高度
			},
			onEnd : function() { // 结束回调
				// $("#msg").show().animate({
				// width : '250px'
				// }, 200).fadeOut(1000); // 提示信息
				// addcar.css("cursor", "default").removeClass('orange')
				// .unbind('click');
				// this.destory(); // 移除dom
			}
		});
	});
});

function removeCart(item_id) {
	delCookie(item_id);
	window.location.reload();
}

function buy() {
	window.location.href = "./order";
}

function getTotalCost() {
	var sum = 0.0;
	$('.item').each(function() {
		var price = $(this).find('.price').first().html();
		var amount = $(this).find('.amount').first().val();
		var subSum = (parseFloat(price) * parseFloat(amount)).toFixed(2);
		$(this).find('.subSum').first().html(subSum);
		sum += subSum;
	});
	$('#sum').html(sum);
}

function onAmountInput(event, item_id, max) {
	var amount = event.target.value;
	var amountReg = /^[1-9]\d*$/;
	if (!amount || parseInt(amount) == 0) {
		event.target.value = 1;
	} else if (amountReg.test(amount)) {
		amount = amount > max ? max : amount;
		event.target.value = amount;
		setCookie('item_' + item_id, amount, 1);
		getTotalCost();
	} else {
		event.target.value = getCookie('item_' + item_id);
	}
}

function onAmountPropChanged(event, item_id, max) {
	if (event.propertyName.toLowerCase() == "value") {
		var amount = event.target.value;
		var amountReg = /^[1-9]\d*$/;
		if (!amount || parseInt(amount) == 0) {
			event.target.value = 1;
			setCookie('item_' + item_id, amount, 1);
			getTotalCost();
		} else if (amountReg.test(amount)) {
			amount = amount > max ? max : amount;
			setCookie('item_' + item_id, amount, 1);
			getTotalCost();
		} else {
			event.target.value = getCookie('item_' + item_id);
		}
	}
}