<%@ page contentType="text/html; charset=UTF-8" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>Shopping</title>
<script src="./plugin/jquery-1.9.1.min.js"></script>
<link rel="Stylesheet" type="text/css" href="./plugin/wTooltip.css" />
<script type="text/javascript" src="./plugin/wTooltip.js"></script>
<style type="text/css">
body {
	background-image: url(images/main_back.jpg);
	background-repeat: repeat;
}
</style>
<style>
.hoverBox {
	display: inline-block;
	margin: 10px;
	padding: 10px 30px;
	border: solid #CACACA 1px;
	cursor: pointer;
	}
.non_display_subpage {
	display: none;
	opacity: 0.78;
	background-image: url(images/subpage_back.jpg);
	background-repeat: no-repeat;
	background-position: center;
}
.logo {
	position: absolute;
	top: 0px;
	right: auto;
}
.map {
	position: absolute;
	height: 500px;
	width: 97%;
	right: 1.5%;
	z-index: -1;
	top: 100px;
}
.title_label {
	font-family: "Palatino Linotype", "Book Antiqua", Palatino, serif;
	font-size: 24px;
	font-style: normal;
	font-weight: bold;
	color: #666;
}
.normal_font {
	font-family: "Goudy Old Style";
	font-size: 16px;
	font-weight: bold;
}
.input_font {
	font-family: "Goudy Old Style";
	font-size: 16px;
	font-weight: normal;
	border-top-width: thin;
	border-right-width: thin;
	border-bottom-width: thin;
	border-left-width: thin;
	border-top-style: inset;
	border-right-style: inset;
	border-bottom-style: inset;
	border-left-style: inset;
	color: #777;
}
.normal_button {
	font-family: "Palatino Linotype", "Book Antiqua", Palatino, serif;
	font-size: 16px;
	color: #444;
	background-color: #CCC;
	border: thin outset #CCC;
}
</style>
</head>

<body>
<img src="images/logo_title.png" alt="logo" width="237" height="100" class="logo" /> 
<div align="right">
<img src="images/transparent.png" width="10" height="8" alt="transparent" /><br />
<img src="images/transparent.png" width="500" height="10" alt="transparent" />
<!-- Buttons for multiple jobs -->
<img id="login_image" src="images/login.png" width="30" height="30" alt="login icon" />
<img src="images/transparent.png" width="15" height="10" alt="transparent" />
<img id="search_image" src="images/search.png" width="30" height="30" alt="search icon" />
<img src="images/transparent.png" width="15" height="10" alt="transparent" />
<img id="result_image" src="images/result.png" width="30" height="30" alt="result icon" />
<!-- End: Buttons for multiple jobs -->
</div>
<br />

<!-- subpage for login -->
<div id="subpage_login" align="center" class="non_display_subpage">
<img src="images/separator.png" width="800" height="10" alt="separator" /><br />
<label class="title_label">Login</label> <br />

<form id="login_form">
<img src="images/user.png" width="15" height="15" alt="user" />&nbsp;&nbsp;
<font class="normal_font">User:</font>
<img src="images/transparent.png" width="34" height="10" alt="transperant" />
<input name="user_textField" class="input_font" type="text" size="19" /><br />
<img src="images/transparent.png" width="5" height="3" alt="transperant" /><br />

<img src="images/password.png" width="15" height="15" alt="password" />&nbsp;&nbsp;
<font class="normal_font">Password:</font>
<img src="images/transparent.png" width="5" height="10" alt="transperant" />
<input name="password_textField" class="input_font" type="password" size="19" /><br />
<img src="images/transparent.png" width="5" height="5" alt="transperant" /><br />

<script language="javascript">
//Add function for "login" and "register" button
function login() {
	alert("Code for login is coming!");
}
function register() {
	alert("Code for register is coming!");
}
</script>
<button id="login_button" class="normal_button" onclick="login()">Login</button>
<img src="images/transparent.png" width="15" height="3" alt="transperant" />
<button id="register_button" class="normal_button" onclick="register()">Register</button><br />
</form>
<img src="images/transparent.png" width="5" height="5" alt="transperant" /><br />
<img src="images/separator.png" width="800" height="10" alt="separator" /><br />
</div>
<!-- End: subpage for login -->

<!-- subpage for search -->
<div id="subpage_search" align="center" class="non_display_subpage">
<img src="images/separator.png" width="800" height="10" alt="separator" /><br />
<label class="title_label">Search</label><br />
<img src="images/8coupons_logo.png" width="51" height="12" alt="8coupon logo" /><br />
<img src="images/transparent.png" width="5" height="5" alt="transperant" /><br />

<form id="search_form">
<img src="images/zipcode.png" width="15" height="15" alt="zipcode" />&nbsp;&nbsp;
<font class="normal_font">Zip Code:</font>
<img src="images/transparent.png" width="34" height="10" alt="transperant" />
<input name="zipcode_textField" class="input_font" type="text" size="19" value="Empty is valid"/><br />
<img src="images/transparent.png" width="5" height="3" alt="transperant" /><br />

<img src="images/mileradius.png" width="15" height="15" alt="mileradius" />&nbsp;&nbsp;
<font class="normal_font">Mile Radius:</font>
<img src="images/transparent.png" width="15" height="10" alt="transperant" />
<input name="mileradius_textField" class="input_font" type="text" size="19" value="Empty is valid"/><br />
<img src="images/transparent.png" width="5" height="3" alt="transperant" /><br />

<img src="images/category.png" width="15" height="15" alt="mileradius" />&nbsp;&nbsp;
<font class="normal_font">Category:</font>
<img src="images/transparent.png" width="34" height="10" alt="transperant" />
<select name="category_select" class="input_font" >
<option value="any">- Any -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</option>
<option value="restaurants">Restaurants</option>
<option value="entertainment">Entertainment</option>
<option value="beauty & spa">Beauty & Spa</option>
<option value="services">Services</option>
<option value="shopping">Shopping</option>
</select><br />
<img src="images/transparent.png" width="5" height="3" alt="transperant" /><br />

<img src="images/keyword.png" width="15" height="15" alt="keyword" />&nbsp;&nbsp;
<font class="normal_font">Keyword:</font>
<img src="images/transparent.png" width="34" height="10" alt="transperant" />
<input name="keyword_textField" class="input_font" type="text" size="19" value="Empty is valid"/><br />
<img src="images/transparent.png" width="5" height="5" alt="transperant" /><br />

<script language="javascript">
//Add function for "search" button
function search() {
	alert("Code for search is coming!");
}
</script>
<button id="search_button" class="normal_button" onclick="search()">Search</button><br />
</form>
<img src="images/transparent.png" width="5" height="5" alt="transperant" /><br />
<img src="images/separator.png" width="800" height="10" alt="separator" /><br />
</div>
<!-- End: subpage for search -->

<!-- subpage for result -->
<div id="subpage_result" align="center" class="non_display_subpage">
<img src="images/separator.png" width="800" height="10" alt="separator" /><br />
<label class="title_label">Result</label><br />
<img src="images/transparent.png" width="5" height="5" alt="transperant" /><br />

<font class="normal_font">Select Stores (multiple choices):</font><br />
<img src="images/transparent.png" width="5" height="3" alt="transperant" /><br />
<select id="store_select" name="store_select" size="13" multiple="multiple" class="input_font" style="width:500px">
<option value="">To be continue;</option>
<option value="">To be continue;</option>
</select><br />
<img src="images/transparent.png" width="5" height="5" alt="transperant" /><br />

<script language="javascript">
//Add function for "search" button
function choose() {
	alert("Code for choose is coming!");
}
</script>
<button id="choose_button" class="normal_button" onclick="choose()">Choose</button><br />
</form>
<img src="images/transparent.png" width="5" height="5" alt="transperant" /><br />
<img src="images/separator.png" width="800" height="10" alt="separator" /><br />
</div>
<!-- End: subpage for result -->
<br />

<div align="center">
<iframe class="map" src="https://maps.google.com/?ie=UTF8&amp;ll=40.806858,-73.961163&amp;spn=0.035342,0.061111&amp;t=m&amp;z=14&amp;output=embed"></iframe><br />
</div>

<!-- Mouse over notification -->
<script type="text/javascript">
$('.mooTest').wTooltip();
console.log($('.mooTest').wTooltip('opacity'));
$('.mooTest :first').wTooltip('opacity', 0.2);
console.log($('.mooTest').wTooltip('opacity'));

$("#login_image").wTooltip({
	title: "Login/Logout",
	theme: "black"
});
$("#search_image").wTooltip({
	title: "Search",
	theme: "black"
});
$("#result_image").wTooltip({
	title: "Result",
	theme: "black"
});
</script>
<!-- End: Mouse over notification -->

<!-- jQuery -->
<script type="text/javascript">
var image_id = "";
var login_active = 0;
var search_active = 0;
var result_active = 0;
$(document).ready(function(){
	//login_image
	$("#login_image").click(function() {
		$("#subpage_search").slideUp(700);
		$("#subpage_login").slideToggle(700);
		$("#subpage_result").slideUp(700);
	});
	$("#login_image").mousedown(function() {
		document.getElementById("login_image").src = "images/login_down.png";
	});
	$("#login_image").mouseup(function() {
		if (login_active) {
			document.getElementById("login_image").src = "images/login.png";
			document.getElementById("search_image").src = "images/search.png";
			document.getElementById("result_image").src = "images/result.png";
			login_active = 0;
			search_active = 0;
			result_active = 0;
		}
		else {
			document.getElementById("login_image").src = "images/login_active.png";
			document.getElementById("search_image").src = "images/search.png";
			document.getElementById("result_image").src = "images/result.png";
			login_active = 1;
			search_active = 0;
			result_active = 0;
		}
	});
	//search_image
	$("#search_image").click(function() {
		$("#subpage_login").slideUp(700);
		$("#subpage_search").slideToggle(700);
		$("#subpage_result").slideUp(700);
	});
	$("#search_image").mousedown(function() {
		document.getElementById("search_image").src = "images/search_down.png";
	});
	$("#search_image").mouseup(function() {
		if (search_active) {
			document.getElementById("login_image").src = "images/login.png";
			document.getElementById("search_image").src = "images/search.png";
			document.getElementById("result_image").src = "images/result.png";
			login_active = 0;
			search_active = 0;
			result_active = 0;
		}
		else {
			document.getElementById("login_image").src = "images/login.png";
			document.getElementById("search_image").src = "images/search_active.png";
			document.getElementById("result_image").src = "images/result.png";
			login_active = 0;
			search_active = 1;
			result_active = 0;
		}
	});
	//result_image
	$("#result_image").click(function() {
		$("#subpage_login").slideUp(700);
		$("#subpage_search").slideUp(700);
		$("#subpage_result").slideToggle(700);
	});
	$("#result_image").mousedown(function() {
		document.getElementById("result_image").src = "images/result_down.png";
	});
	$("#result_image").mouseup(function() {
		if (result_active) {
			document.getElementById("login_image").src = "images/login.png";
			document.getElementById("search_image").src = "images/search.png";
			document.getElementById("result_image").src = "images/result.png";
			login_active = 0;
			search_active = 0;
			result_active = 0;
		}
		else {
			document.getElementById("login_image").src = "images/login.png";
			document.getElementById("search_image").src = "images/search.png";
			document.getElementById("result_image").src = "images/result_active.png";
			login_active = 0;
			search_active = 0;
			result_active = 1;
		}
	});
});
</script>
<!-- End: jQuery -->

</body>
</html>