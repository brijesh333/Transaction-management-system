<%@ Page Title="" Language="C#" MasterPageFile="~/Admin MasterPage.master" AutoEventWireup="true" CodeFile="admin_contact1.aspx.cs" Inherits="admin_contact1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .style1
        {
            width: 878px;
        }
        .style3
        {
        }
        .style4
        {
        }
        .style6
        {
            width: 363px;
        }
        .style7
        {
            width: 30px;
        }
        .style8
        {
            text-decoration: underline;
        }
        .style9
        {
            width: 253px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
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
				<h2 class="style6"><span class="style8">Conact Us</span> :-</h2>
			</div>
            <table class="style1">
                <tr>
                    <td class="style3">
                        <strong>Head Corporate Office</strong></td>
                    <td class="style2">
                        &nbsp;</td>
                    <td class="style4">
                        <strong><span class="style3">Mailing Address</span><br class="style3" />
                        </strong></td>
                </tr>
                <tr>
                    <td class="style3" rowspan="2">
                        <asp:Image ID="Image1" runat="server" ImageUrl="~/images/BUILG008.JPG" 
                            Width="485px" />
                    </td>
                    <td class="style2">
                        &nbsp;</td>
                    <td class="style4">
                        <strong>
                        <br />
                        <br />
                        Location One :Navsari<br />
                        <br />
                        </strong>Phone :+91 9662959443<br />
                        Email : patelbrijesh333@gmail.com</td>
                </tr>
                <tr>
                    <td class="style2">
                        &nbsp;</td>
                    <td class="style4">
                        <strong>Location Two :Vapi<br />
                        <br />
                        </strong>Phone :<br />
                        E-mail :</td>
                </tr>
            </table>
			<br class="clearfix" />
		</div>
		<br class="clearfix" />
	</div>
    </html>
</asp:Content>

