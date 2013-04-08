<%@page import="salechaser.SaleStore" %>
<%@page import="salechaser.SharedMemory" %>
<%@page import="salechaser.SearchServlet" %>
<%@page contentType="text/html; charset=UTF-8" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>Salechaser</title>
<script src="./plugin/jquery-1.9.1.min.js"></script>
<link rel="Stylesheet" type="text/css" href="./plugin/wTooltip.css" />
<script type="text/javascript" src="./plugin/wTooltip.js"></script>
<script type="text/javascript" src="./tool.js"></script>

<!-- Google Maps API v3 -->
<script type="text/javascript"
src="http://maps.googleapis.com/maps/api/js?key=AIzaSyD-8-qkY0t5gIYFUS3N0OIJHbXMRDT3jNw&sensor=true">
</script>
<script type="text/javascript">
	function map_initialize() {
		var mapOptions = {
			center : new google.maps.LatLng(40.806858, -73.961163),
			zoom : 13,
			mapTypeId : google.maps.MapTypeId.ROADMAP
		};
		var map = new google.maps.Map(document.getElementById("map_canvas"),
				mapOptions);
	}
</script>
<!-- End: Google Maps API v3 -->

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
	opacity: 0.88;
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
.result_checkbox {
	position: absolute;
	left: 20%;
}
.result_title_font {
	font-family: "Goudy Old Style";
	font-size: 11px;
	color: #555;
}
</style>
</head>

<body onload="map_initialize()">
<img src="images/logo.png" alt="logo" width="245" height="88" class="logo" /> 
<div align="right">
<img src="images/transparent.png" width="10" height="8" alt="transparent" /><br />
<!-- Buttons for multiple jobs -->
<img id="login_image" src="images/login.png" width="30" height="30" alt="login icon" />
<img src="images/transparent.png" width="15" height="10" alt="transparent" />
<img id="search_image" src="images/search.png" width="30" height="30" alt="search icon" />
<img src="images/transparent.png" width="15" height="10" alt="transparent" />
<img id="result_image" src="images/result.png" width="30" height="30" alt="result icon" />
<!-- End: Buttons for multiple jobs -->
</div>
<br />

<script language="javascript">
var login_active = 0;
var search_active = 0;
var result_active = 0;
</script>
<!-- subpage for login -->
<div id="subpage_login" align="center" class="non_display_subpage">
<img src="images/separator.png" width="800" height="10" alt="separator" /><br />
<label class="title_label">Login</label> <br />

<form id="login_form">
<img src="images/user.png" width="15" height="15" alt="user" />&nbsp;&nbsp;
<font class="normal_font">User:</font>
<img src="images/transparent.png" width="34" height="10" alt="transperant" />
<input name="user_textField" class="input_font" type="text" size="19" onclick="this.select();"/><br />
<img src="images/transparent.png" width="5" height="3" alt="transperant" /><br />

<img src="images/password.png" width="15" height="15" alt="password" />&nbsp;&nbsp;
<font class="normal_font">Password:</font>
<img src="images/transparent.png" width="5" height="10" alt="transperant" />
<input name="password_textField" class="input_font" type="password" size="19" onclick="this.select();"/><br />
<img src="images/transparent.png" width="5" height="5" alt="transperant" /><br />

<button id="login_button" class="normal_button" >Login</button>
<img src="images/transparent.png" width="15" height="3" alt="transperant" />
<button id="register_button" class="normal_button" >Register</button><br />
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
<input id="zipcode_textField" name="zipcode_textField" class="input_font" type="text" size="19" value="Empty is valid" onclick="this.select();"/><br />
<img src="images/transparent.png" width="5" height="3" alt="transperant" /><br />

<img src="images/mileradius.png" width="15" height="15" alt="mileradius" />&nbsp;&nbsp;
<font class="normal_font">Mile Radius:</font>
<img src="images/transparent.png" width="15" height="10" alt="transperant" />
<input id="mileradius_textField" name="mileradius_textField" class="input_font" type="text" size="19" value="Empty is valid" onclick="this.select();"/><br />
<img src="images/transparent.png" width="5" height="3" alt="transperant" /><br />

<img src="images/category.png" width="15" height="15" alt="category" />&nbsp;&nbsp;
<font class="normal_font">Category:</font>
<img src="images/transparent.png" width="34" height="10" alt="transperant" />
<select id="category_select" name="category_select" class="input_font" >
<option value="any">- Any -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</option>
<option value="Restaurants">Restaurants</option>
<option value="Entertainment">Entertainment</option>
<option value="Beauty & Spa">Beauty & Spa</option>
<option value="Services">Services</option>
<option value="Shopping">Shopping</option>
<option value="Travel">Travel</option>
</select><br />
<img src="images/transparent.png" width="5" height="3" alt="transperant" /><br />

<img src="images/keyword.png" width="15" height="15" alt="keyword" />&nbsp;&nbsp;
<font class="normal_font">Keyword:</font>
<img src="images/transparent.png" width="34" height="10" alt="transperant" />
<input id="keyword_textField" name="keyword_textField" class="input_font" type="text" size="19" value="Empty is valid" onclick="this.select();"/><br />
<img src="images/transparent.png" width="5" height="5" alt="transperant" /><br />

<button id="search_button" class="normal_button" >Search</button><br />
</form>
<img src="images/transparent.png" width="5" height="5" alt="transperant" /><br />
<img src="images/separator.png" width="800" height="10" alt="separator" /><br />
</div>
<!-- End: subpage for search -->

<!-- subpage for result -->
<div id="subpage_result" align="center" class="non_display_subpage">
<% if (SharedMemory.show_result) { %>
<script language="javascript">
$("#subpage_result").slideToggle(700);
document.getElementById("result_image").src = "images/result_active.png";
result_active = 1;
</script>
<% 	SharedMemory.show_result = false; 
} %>
<img src="images/separator.png" width="800" height="10" alt="separator" /><br />
<label class="title_label">Result</label><br />
<img src="images/transparent.png" width="5" height="5" alt="transperant" /><br />

<font class="normal_font">Select Stores</font><br />
<img src="images/transparent.png" width="5" height="3" alt="transperant" /><br />

<form>
<% int count = 0;
for (SaleStore store : SharedMemory.stores) { 
	if ((count++) == 10) break;
	String s = store.dealTitle;
	int l = s.length();
	int Max_Length = 70;
	if (l > Max_Length) s = s.substring(0, Max_Length);
%>
	<div class="result_checkbox">
	<input type="checkbox" value="<%out.print(store.ID); %>">
    <img src="<%out.print(store.showImage); %>" width="27" height="27" />
    <font class="normal_font">&nbsp;<%out.print(store.name); %>: </font>
    <font class="result_title_font"><%out.print(s); %></font><br />
    </input>
    </div><br />
    <img src="images/transparent.png" width="5" height="10" alt="transperant" /><br />
<%} %>
<br />


<button id="choose_button" class="normal_button" >Choose</button>
</form>

<img src="images/transparent.png" width="5" height="5" alt="transperant" /><br />
<img src="images/separator.png" width="800" height="10" alt="separator" /><br />
</div>
<!-- End: subpage for result -->

<div id="map_canvas" class="map" align="center">
<!-- <iframe class="map" src="https://maps.google.com/?ie=UTF8&amp;ll=40.806858,-73.961163&amp;spn=0.035342,0.061111&amp;t=m&amp;z=14&amp;output=embed"></iframe><br />
-->
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
$(document).ready(function(){
	//login_image
	$("#login_image").click(function() {
		$("#subpage_login").fadeToggle("slow");
		$("#subpage_search").hide();
		$("#subpage_result").hide();
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
		$("#subpage_login").hide();
		$("#subpage_search").fadeToggle("slow");
		$("#subpage_result").hide();
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
		$("#subpage_login").hide();
		$("#subpage_search").hide();
		$("#subpage_result").fadeToggle("slow");
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
	
	//Button click
	$("#login_button").mousedown(function() {
		alert("Code for login is coming!");
	});
	$("#register_button").mousedown(function() {
		alert("Code for register is coming!");
	});
	$("#search_button").mousedown(function() {
		zipcode_textField = document.getElementById("zipcode_textField");
		zipcode = zipcode_textField.value;
		if (zipcode == "Empty is valid") {
			zipcode = "";
		}
		else if (!valid_zipCode(zipcode) && (zipcode != "")) {
			alert("Error: Zip Code should be 5 digits.");
			return;
		}
		
		mileradius_textField = document.getElementById("mileradius_textField");
		mileradius = mileradius_textField.value;
		if (mileradius == "Empty is valid") {
			mileradius = "";
		}
		else if (!valid_mileRadius(mileradius) && (mileradius != "")) {
			alert("Error: Mile Radius should an integer.");
			return;
		}
		
		form = document.getElementById("search_form");
		form.action = "salechaser/SearchServlet";
		form.method = "get";
		form.submit();
	});
	$("#choose_button").mousedown(function() {
		alert("Code for choose is coming!");
	});
});
</script>
<!-- End: jQuery -->

</body>
</html>