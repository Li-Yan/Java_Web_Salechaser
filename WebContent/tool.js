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