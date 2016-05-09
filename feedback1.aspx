<%@ Page Language="C#" AutoEventWireup="true" CodeFile="feedback1.aspx.cs" Inherits="feedback1" %>

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
            width: 99%;
        }
        .style2
        {
            width: 397px;
        }
        .style3
        {
            width: 182px;
        }
        .style4
        {
            width: 43px;
        }
        .style5
        {
            width: 82px;
        }
    </style>
</head>
<body>
    <form id="form2" runat="server">
    <div>
    <div id="wrapper">
	<div id="header">
		&nbsp;<div id="logo">
			<h1><a href="#">Money Management System</a></h1>
		</div>
        		
        
	</div>
	<div id="menu">
		<ul>
			<li><a href="Default.aspx">Home</a></li>		
            
			<li><a href="mms_product.aspx">Products</a></li>
            <li><a href="partner.aspx">Partners</a></li>
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
				<h2>Feedback Form :-</h2>
				<table class="style1">
                    <tr>
                        <td class="style3" colspan="2">
                            Name :</td>
                        <td class="style2">
                            <asp:TextBox ID="txtName" runat="server" Height="22px" Width="252px"></asp:TextBox>
                            <br />
                        </td>
                        <td>
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td class="style3" colspan="2">
                            Email ID :</td>
                        <td class="style2">
                            <asp:TextBox ID="txtEmailID" runat="server" Height="24px" Width="254px"></asp:TextBox>
                            <br />
                        </td>
                        <td>
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td class="style3" colspan="2">
                            Feedback :</td>
                        <td class="style2">
                            <asp:TextBox ID="txtFeedback" runat="server" Height="107px" 
                                TextMode="MultiLine" Width="352px"></asp:TextBox>
                        </td>
                        <td>
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td class="style3" colspan="2">
                            &nbsp;</td>
                        <td colspan="2">
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td class="style5">
                            &nbsp;</td>
                        <td class="style4">
                            <asp:Button ID="btnSubmit" runat="server" BorderColor="Black" BorderStyle="Double" 
                            ForeColor="Black" 
                                onclick="btnSubmit_Click" Text="Submit" Font-Bold="True" Height="35px" 
                                Width="120px" />
                        </td>
                        <td class="style2">
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <asp:Button ID="btnReset" runat="server" BorderColor="Black" BorderStyle="Double" 
                            ForeColor="Black" 
                                onclick="btnReset_Click" Text="Reset" Font-Bold="True" Height="35px" 
                                Width="120px" />
                        </td>
                        <td>
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td class="style5">
                            &nbsp;</td>
                        <td class="style4">
                            &nbsp;</td>
                        <td class="style2">
                            &nbsp;</td>
                        <td>
                            &nbsp;</td>
                    </tr>
                </table>
                <p>
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<asp:Label ID="Label1" runat="server" Font-Size="Large"></asp:Label>
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
