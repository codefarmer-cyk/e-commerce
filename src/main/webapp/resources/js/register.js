/**
 * 
 */

// Firefox, Google Chrome, Opera, Safari, Internet Explorer from version 9
var input1 = false, input2 = false, input3 = false, input4 = false;
function onUsernameInput(event) {
	var username = event.target.value;
	var usernameReg = /^[a-zA-Z][a-zA-Z0-9_]{3,14}$/;
	if (usernameReg.test(username)) {
		$("#username_input_warn").attr("hidden", "hidden");
		input1 = true;
	} else {
		$("#username_input_warn").removeAttr("hidden");
		input1 = false;
	}
	isOK();
}

function onEmailInput(event) {
	var email = event.target.value;
	var emailReg = /^[a-zA-Z0-9_-]+@[a-zA-Z0-9_-]+(\.[a-zA-Z0-9_-]+)+$/;
	if (emailReg.test(email)) {
		// alert();
		$("#email_input_warn").attr("hidden", "hidden");
		input2 = true;
	} else {
		$("#email_input_warn").removeAttr("hidden");
		input2 = false;
		// alert("fuck");
	}
	isOK();
}

function onPasswordInput(event) {
	var password = event.target.value;
	var passwordReg = /[a-zA-Z0-9]{5,14}$/;
	if (passwordReg.test(password)) {
		$("#password_input_warn").attr("hidden", "hidden");
		input3 = true;
	} else {
		$("#password_input_warn").removeAttr("hidden");
		input3 = false;
	}
	isOK();
}

function onPasswordConfirmInput(event) {
	var password2 = event.target.value;
	var password = document.getElementById("password").value;
	if (password2 == password) {
		$("#password_confirm_input_warn").attr("hidden", "hidden");
		input4 = true;
	} else {
		$("#password_confirm_input_warn").removeAttr("hidden");
		input4 = false;
	}
	isOK();
}
// Internet Explorer
function onUsernamePropChanged(event) {
	if (event.propertyName.toLowerCase() == "value") {
		var username = event.srcElement.value;
		var usernameReg = /^[a-zA-Z][a-zA-Z0-9_]{5,14}$/;
		if (usernameReg.test(username)) {
			$("#username_input_warn").attr("hidden", "hidden");
			input1 = true;
		} else {
			$("#username_input_warn").removeAttr("hidden");
			input1 = false;
		}
	}
	isOK();
}

function onEmailPropChanged(event) {
	if (event.propertyName.toLowerCase() == "value") {
		var email = event.target.value;
		var emailReg = /^[a-zA-Z0-9_-]+@[a-zA-Z0-9_-]+(\.[a-zA-Z0-9_-]+)+$/;
		if (emailReg.test(email)) {
			$("#eamil_input_warn").attr("hidden", "hidden");
			input2 = true;
		} else {
			$("#email_input_warn").removeAttr("hidden");
			input2 = false;
		}
	}
	isOK();
}

function onPasswordPropChanged(event) {
	if (event.propertyName.toLowerCase() == "value") {
		var password = event.target.value;
		var passwordReg = /^[a-zA-Z][a-zA-Z0-9]{5,14}$/;
		if (passwordReg.test(password)) {
			$("#password_input_warn").attr("hidden", "hidden");
			input3 = true;
		} else {
			$("#password_input_warn").removeAttr("hidden");
			input3 = false;
		}
	}
	isOK();
}

function onPasswordConfirmPropChanged(event) {
	var password2 = event.target.value;
	var password = $("#password").value;
	if (password2 == password) {
		$("#password_confirm_input_warn").attr("hidden", "hidden");
		input4 = true;
	} else {
		$("#password_confirm_input_warn").removeAttr("hidden");
		input4 = false;
	}
	isOK();
}

function isOK() {
	if (input1 && input2 && input3 && input4) {
		$("#submuit_btn").removeAttr("disabled");
	} else {
		$("#submuit_btn").attr("disabled", "disabled");
	}
}
