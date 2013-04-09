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

function marker_htmlMaker(store_detail) {
	var htmlString = "";
	htmlString = htmlString + "<div align='left' class='info'>";
	htmlString = htmlString + "<img src='" + store_detail[3] + "' width='64' height='64' /><br />";
	htmlString = htmlString + "<a class='normal_font'>Store Name</a><br />";
	htmlString = htmlString + "<a class='result_title_font'>" + unescape(store_detail[0]) + "</a><br />";
	htmlString = htmlString + "<a class='normal_font' href='" + store_detail[2] + "' class='result_title_font'>Sale Title & Link</a><br />";
	htmlString = htmlString + "<a class='result_title_font'>" + unescape(store_detail[1]) + "</a><br />";
	htmlString = htmlString + "<a class='normal_font'>Expire Date</a><br />";
	htmlString = htmlString + "<a class='result_title_font'>" + unescape(store_detail[5]) + "</a><br />";
	htmlString = htmlString + "<a class='normal_font'>Address</a><br />";
	htmlString = htmlString + "<a class='result_title_font'>" + unescape(store_detail[6]) + "</a><br />";
	htmlString = htmlString + "<a class='normal_font'>Phone</a><br />";
	htmlString = htmlString + "<a class='result_title_font'>" + unescape(store_detail[7]) + "</a><br />";
	htmlString = htmlString + "</div>";
	
	return htmlString;
}