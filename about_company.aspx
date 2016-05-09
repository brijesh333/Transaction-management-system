<%@ Page Language="C#" AutoEventWireup="true" CodeFile="about_company.aspx.cs" Inherits="about_company" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
<meta name="description" content="" />
<meta name="keywords" content="" />
<title>Money Management System</title>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<link rel="stylesheet" type="text/css" href="~/design/style.css" />
<script type="text/javascript" src="Scripts/jquery-1.7.1.min.js"></script>
<script type="text/javascript" src="Scripts/jquery.dropotron-1.0.js"></script>
<script type="text/javascript" src="Scripts/jquery.slidertron-1.1.js"></script>
<script type="text/javascript">
    $(function () {
        $('#menu > ul').dropotron({
            mode: 'fade',
            globalOffsetY: 11,
            offsetY: -15
        });
        $('#slider').slidertron({
            viewerSelector: '.viewer',
            indicatorSelector: '.indicator span',
            reelSelector: '.reel',
            slidesSelector: '.slide',
            speed: 'slow',
            advanceDelay: 4000
        });
    });
</script>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    <div id="wrapper">
	<div id="header">
		<div id="logo">
			<h1><a href="#">Money Management System</a></h1>
		</div>
	</div>
	<div id="menu">
		<ul>
			<li><a href="Default.aspx">Home</a></li>		
            
			<li><a href="mms_product.aspx">Products</a></li>
			<li><a href="partner.aspx">Partner</a></li>			
			<li><a href="about_company.aspx">About</a></li>
			<li><a href="contact.aspx">Contact</a></li>
            <li class="last"><a href="#">Feedback</a></li>
		</ul>
		<br class="clearfix" />
	</div>
	<div id="slider">
		<div class="viewer">
			<div class="reel">
				<div class="slide">
					<img src="images/slide01.jpg" alt="" />
				</div>
				<div class="slide">
					<img src="images/slide02.jpg" alt="" />
				</div>
				<div class="slide">
					<img src="images/slide03.jpg" alt="" />
				</div>
				<div class="slide">
					<img src="images/slide04.jpg" alt="" />
				</div>
				<div class="slide">
					<img src="images/slide05.jpg" alt="" />
				</div>
			</div>
		</div>
		<div class="indicator">
			<span>1</span>
			<span>2</span>
			<span>3</span>
			<span>4</span>
			<span>5</span>
		</div>
	</div>
	<div id="page">
		<div id="content">
			<div class="box">
				<h2>Company Profile</h2>
				<p>
					<strong>Money Management System</strong>, is used in following malls which are our consumer and using this system for a management of customer account management, payroll management,employee management,staff management,product management etc services for a cashless transcation for customer using biometric authentication which provide high security to customer for their transcation.
				</p>
			</div>
			<br class="clearfix" />
		</div>
		<br class="clearfix" />
	</div>
	<div id="page-bottom">
		<div id="page-bottom-content">
			<h3>Basic Money Managemnt System</h3>
			<p>
				Money Management System....have a good future in many stream of business which detalis are provided in Product menu on a main page.So,kindly visit that menu for further information about money management system. 
			</p>
		</div>
		<div id="page-bottom-sidebar">
			<h3>Services</h3>
			<ul class="list">
				<li class="first">Vision</li>
				<li>Mission</li>
				<li class="last">Quality Policy</li>
			</ul>
		</div>
		<br class="clearfix" />
	</div>
</div>
<div id="footer">
	Copyright (c) 2013. All rights reserved. Design by Brijesh,Nirav,Nisarg.
</div>

    </div>
    </form>
</body>
</html>
