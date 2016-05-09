<%@ Page Title="" Language="C#" MasterPageFile="~/HR MasterPage.master" AutoEventWireup="true" CodeFile="HR_home1.aspx.cs" Inherits="HR_Home1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <p>
        <br />
    </p>
       <html xmlns="http://www.w3.org/1999/xhtml">
<head>
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
<asp:Label ID="Label1" runat="server" ForeColor="Red"></asp:Label>
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
    <asp:Button ID="Button1" runat="server" Text="Button" onclick="Button1_Click" />
<div id="page">
		<div id="content">
			<div class="box">
				<h2>Welcome to Money Management System</h2>
				<p>
					<strong>Money Management System</strong>, is used in following malls which are our consumer and using this system for a management of customer account management, payroll management,employee management,staff management,product management etc services for a cashless transcation for customer using biometric authentication which provide high security to customer for their transcation.
				</p>
			</div>
			<div class="box" id="content-box1">
				<h3>Our Consumer</h3>
				<ul class="section-list">
					<li class="first">
						<img class="pic alignleft" src="images/pic01.jpg" width="70" height="70" alt="" />
						<span>7seas</span>
					</li>
					<li>
						<img class="pic alignleft" src="images/pic02.jpg" width="70" height="70" alt="" />
						<span>Central square</span>
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
					
                <h3>
                    Recent News and Annoucementh</h3>
                <div class="date-list">
                    <ul class="list date-list">
                        <li class="first"><span class="date">2/08</span> <a href="#">Quam sed tempus</a></li>
                        <li><span class="date">2/05</span> <a href="#">Lorem et vestibulum</a></li>
                        <li><span class="date">2/01</span> <a href="#">Risus aenean tellus</a></li>
                        <li class="last"><span class="date">1/31</span> <a href="#">Tristique et primis</a></li>
                    </ul>
                </div>
			</div>
		</div>
		<br class="clearfix" />
	
</div>
</body>    
    </html>
</asp:Content>

