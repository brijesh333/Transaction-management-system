<%@ Page Language="C#" AutoEventWireup="true" CodeFile="partner.aspx.cs" Inherits="partner" %>

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
    <style type="text/css">
        .style1
        {
            width: 100%;
        }
        .style2
        {
            width: 430px;
        }
        .style3
        {
            color: #0000CC;
        }
    </style>
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
	<%--<div id="slider">
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
	</div>--%>
	<div id="page">
		<div id="content">
			<div class="box">
				<h2>Our Partners</h2>
			</div>
            <table class="style1">
                <tr>
                    <td class="style2" style="border: medium double #000000">
                        <p>
                            <strong class="style3"><em>Technical Partner :</em></strong></p>
                        <asp:Image ID="Image1" runat="server" ImageUrl="~/images/12.gif" />
&nbsp;<asp:Image ID="Image2" runat="server" ImageUrl="~/images/amd.gif" />
&nbsp;&nbsp;
                        <asp:Image ID="Image3" runat="server" ImageUrl="~/images/Sun.gif" />
&nbsp;
                        <asp:Image ID="Image4" runat="server" ImageUrl="~/images/529.gif" />
                        <br />
                        <br />
                    </td>
                    <td height="5">
                        Financial Partner :<br />
                        <asp:Image ID="Image5" runat="server" />
                        <asp:Image ID="Image6" runat="server" />
                        <asp:Image ID="Image7" runat="server" />
                        <asp:Image ID="Image8" runat="server" />
                    </td>
                </tr>
                <tr>
                    <td class="style2" rowspan="2">
                        Marketing and Media Partner 
                        :<br />
                        <asp:Image ID="Image9" runat="server" ImageUrl="~/images/35i58.gif" />
&nbsp;
                        <asp:Image ID="Image10" runat="server" ImageUrl="~/images/35i63.gif" />
                        <asp:Image ID="Image11" runat="server" ImageUrl="~/images/35i93.gif" />
&nbsp;&nbsp;
                        <asp:Image ID="Image12" runat="server" />
                        <br />
                    </td>
                    <td>
                        Official Channel Partner<br />
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Image ID="Image13" runat="server" />
                        <asp:Image ID="Image14" runat="server" />
                        <asp:Image ID="Image15" runat="server" />
                        <asp:Image ID="Image16" runat="server" />
                    </td>
                </tr>
                </table>
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
			<h3>Some Links</h3>
			<ul class="list">
				<li class="first"><a href="Default.aspx">Home</a></li>
				<li><a href="mms_product.aspx">Product</a></li>
				<li class="last"><a href="about_company.aspx">About</a></li>
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
