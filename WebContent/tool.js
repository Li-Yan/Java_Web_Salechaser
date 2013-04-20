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

function marker_htmlMaker(store) {
	var htmlString = "";
	htmlString = htmlString + "<div align='left' class='info'>";
	htmlString = htmlString + "<img src='" + store.showImage + "' width='64' height='64' /><br />";
	htmlString = htmlString + "<a class='normal_font'>Store Name</a><br />";
	htmlString = htmlString + "<a class='result_title_font'>" + unescape(store.name) + "</a><br />";
	htmlString = htmlString + "<a class='normal_font' href='#' onClick=\"window.open(\'" + store.URL + "\')\">Sale Title & Link</a><br />";
	htmlString = htmlString + "<a class='result_title_font'>" + unescape(store.dealTitle) + "</a><br />";
	htmlString = htmlString + "<a class='normal_font'>Expire Date</a><br />";
	htmlString = htmlString + "<a class='result_title_font'>" + unescape(store.expirationDate) + "</a><br />";
	htmlString = htmlString + "<a class='normal_font'>Address</a><br />";
	htmlString = htmlString + "<a class='result_title_font'>" + unescape(store.address) + "</a><br />";
	htmlString = htmlString + "<a class='normal_font'>Phone</a><br />";
	htmlString = htmlString + "<a class='result_title_font'>" + unescape(store.phone) + "</a><br />";
	htmlString = htmlString + "</div>";
	
	return htmlString;
}