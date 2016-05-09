<%@ Page Language="C#" AutoEventWireup="true" CodeFile="customer_registration1.aspx.cs" Inherits="customer_registration1" %>

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

    });
</script>
<%--    <asp:ContentPlaceHolder id="head" runat="server">
    </asp:ContentPlaceHolder>
--%></head>
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
        <li><a href="admin_home1.aspx">Home</a></li>
						
			<li><a href="#">Clients</a></li>
			<li>
				<span class="opener">Support<b></b></span>
				<ul>
					<li><a href="#">Lorem Ipsum</a></li>
					<li><a href="#">Consequat Dolor</a></li>
					<li><a href="#">Magna Feugiat</a></li>
					<li>
						<span>Sed Tempus<b></b></span>
						<ul>
							<li><a href="#">Lorem Ipsum</a></li>
							<li><a href="#">Consequat Dolor</a></li>
							<li><a href="#">Magna Feugiat</a></li>
							<li><a href="#">Sed Tempus</a></li>
							<li><a href="#">Etiam Nullam</a></li>
							<li><a href="#">Amet Phasellus</a></li>
						</ul>
					</li>
					<li><a href="#">Etiam Nullam</a></li>
					<li><a href="#">Amet Phasellus</a></li>
				</ul>
			</li>
			<li><a href="about_company.aspx">About</a></li>
			<li><a href="contact.aspx">Contact</a></li>
            <li class="last"><a href="admin_contact1.aspx">Feedback</a></li>
		</ul>
		<br class="clearfix" />
	</div>
    	<div id="page-bottom">
		<div id="page-bottom-content">
			<h3>Magnis hendrerit erat</h3>
			<p>
				Euismod sodales sociis hendrerit pulvinar acursus urna. Consectetur egestas sodales at ornare laoreet turpis. Lorem id sapien ridiculus sagittis imperdiet urna suspendisse. Posuere arcu parturient quam risus. Aliquam nullam magnis integer gravida vulputate felis. Consectetur montes sollicitudin dictum. Auctor sociis hendrerit pulvinar acursus urna lorem ipsum dolor vivamus pulvinar libero. Massa egestas cubilia lacus augue mattis consectetur.
			</p>
		</div>
		<div id="page-bottom-sidebar">
			<h3>Sed interdum</h3>
			<ul class="list">
				<li class="first"><a href="#">Suspendisse ultricies</a></li>
				<li><a href="#">Tortor mollis enim</a></li>
				<li class="last"><a href="#">Lorem enim tempor</a></li>
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
