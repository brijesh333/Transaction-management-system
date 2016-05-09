<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<script runat="server">

    
</script>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
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
		&nbsp;<div id="logo">
			<h1><a href="#">Money Management System</a></h1>
		</div>
        <asp:Label ID="Label2" runat="server" ForeColor="Red"></asp:Label>		
        
	    `</div>
	<div id="menu">
		<ul>
			<li><a href="Default.aspx">Home</a></li>		
            
			<li><a href="mms_product.aspx">Products</a></li>
            <li><a href="partner.aspx">Partners</a></li>
			<li><a href="about_company.aspx">About</a></li>
			<li><a href="contact.aspx">Contact</a></li>
            <li class="last"><a href="feedback1.aspx">Feedback</a></li>
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
    <asp:Label ID="Label5" runat="server" ForeColor="Red" Font-Italic="True" 
            Font-Size="Large"></asp:Label>
		<div id="content">
        
			<div class="box">
				<h2>Welcome to Money Management System</h2>
				<p>
					<strong>Money Management System</strong>, is used in large retailer chain malls which are our consumer and using this system for a management of customer account management, payroll management,employee management,staff management,product management etc services for a cashless transaction for customer using biometric authentication which provide high security to customer for their transaction.
				</p>
			</div>
			<div class="box" id="content-box1">
				<h3>Our Consumer</h3>
				<ul class="section-list">
					<li class="first">
						<img class="pic alignleft" src="images/pic01.jpg" width="70" height="70" alt="" />
						<span>7 seas</span>
					</li>
					<li>
						<img class="pic alignleft" src="images/pic02.jpg" width="70" height="70" alt="" />
						<span>Centre square</span>
					</li>
					<li class="last">
						<img class="pic alignleft" src="images/pic03.jpg" width="70" height="70" alt="" />
						<span>Central Mall</span>
					</li>
				</ul>
			</div>
			<div class="box" id="content-box2">
				<h3>General Notes</h3>				
				<ul class="list">
					<li class="first"><a href="#">working 24X7</a></li>
					<li><a href="#">Daily new discount Offers</a></li>
					<li><a href="#">Secure transaction</a></li>
					<li><a href="#">General Rules</a></li>
					
				</ul>
			</div>
			<br class="clearfix" />
		</div>
		<div id="sidebar">
			<div class="box" style="padding: inherit; margin: auto">
				<h3>Log In</h3>
				<ul class="list">
					<li class="first">User Name : 
                        <asp:TextBox ID="txtUserName" runat="server" 
                            Height="19px" Width="130px" BorderColor="#666666" BorderStyle="Outset" 
                            BorderWidth="2px"></asp:TextBox><br>
					Password :&nbsp;&nbsp;&nbsp; 
                        <asp:TextBox ID="txtPassword" 
                            runat="server" Height="19px" Width="130px" BorderColor="#666666" 
                            BorderStyle="Outset" BorderWidth="2px" TextMode="Password"></asp:TextBox><br>
                    </li>
                    <li class="first">
                    <asp:Button ID="btnLogIn" onclick="btnLogIn_Click" runat="server" Text="Log In" 
                            BorderColor="Black" BorderStyle="Double" 
                            ForeColor="Black" Height="26px" Width="223px"></asp:Button>
                     <br><asp:Label ID="Label1" runat="server" ForeColor="Red"></asp:Label>
                    <asp:Label ID="Label3" runat="server" Text="Label" Visible="false"></asp:Label>&nbsp;<asp:LinkButton 
                            ID="LinkButton1" runat="server" onclick="LinkButton1_Click">Forgot Password</asp:LinkButton>
                    </li>
                    <li class="first">
                        <asp:Label ID="Label4" runat="server" Text="Not Registered ?"></asp:Label>
&nbsp;<asp:Button ID="btnRegistration" runat="server" Text="Register Now" 
                            onclick="btnRegistration_Click" BorderColor="Black" BorderStyle="Double" 
                            Width="105px" />
                    </li>
				</ul>
                </div>
                <div class="box">
                <h3>
                    Recent News</h3>
                <div class="date-list">
                    <ul class="list date-list">
                        <li class="first"><span class="date">5/18</span> <a href="#">Tex Benifit</a></li>
                        <li><span class="date">5/10</span> <a href="#">decrement Repo-rate</a></li>
                        <li><span class="date">5/01</span> <a href="#">Indian economy rise</a></li>
                        <li class="last"><span class="date">4/29</span> <a href="#">Market watch</a></li>
                    </ul>
                </div>
			</div>
          
		</div>
		<br class="clearfix" />
	</div>
	<div id="page-bottom">
		<div id="page-bottom-content">
			<h3>Basic Money Managemnt System</h3>
			<p>
				<br> Our motto is to provide the enrichment of facelities to the customer to gain interest of the customer induring the trust and services.<br/>
                <br>security</br>
                <br>Service</br>
                <br>Benificial</br>
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
	Copyright (c) 2013. All rights reserved. Design by Brijesh.</div>

    </form>
</body>
</html>
