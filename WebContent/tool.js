var show_result = false;
var stores = [];
var checked = [];

function valid_zipCode(ZipCode) {
	var s = "" + ZipCode;
	length = s.length;
	if (length != 5) {
		return false;
	}
	for (var i = 0; i < length; i++) {
		var ch = s.charAt(i);
		if ((ch < '0') || (ch >'9')) {
			return false;
		}
	}
	return true;
}

function valid_mileRadius(MileRadius) {
	var s = "" + MileRadius;
	length = s.length;
	for (var i = 0; i < length; i++) {
		var ch = s.charAt(i);
		if ((ch < '0') || (ch >'9')) {
			return false;
		}
	}
	return true;
}

function url_Parameters(url) {
	if ((url == "") || (url == "?")) return;
	var parameters = url.substr(url.indexOf('?') + 1).split('&');
	for (var i = 0; i < parameters.length; i++) {
		var parameter = parameters[i].split('=');
		if (parameter[0] == "show_result") {
			show_result = (parameter[1] == "1");
		}
		else if (parameter[0] == "stores") {
			stores = parameter[1].split("@;@");
		}
		else if (parameter[0] == "checked") {
			checked = parameter[1].split("");
		}
	}
}