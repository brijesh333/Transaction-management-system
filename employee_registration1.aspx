<%@ Page Language="C#" AutoEventWireup="true" CodeFile="employee_registration1.aspx.cs" Inherits="employee_registration1" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

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
//        $('#slider').slidertron({
//            viewerSelector: '.viewer',
//            indicatorSelector: '.indicator span',
//            reelSelector: '.reel',
//            slidesSelector: '.slide',
//            speed: 'slow',
//            advanceDelay: 4000
//        });
    });
</script>

    <style type="text/css">
        .style1
        {
            width: 100%;
            height: 462px;
        }
        .style6
        {
            width: 283px;
        }
        .style13
        {
            color: #FF0000;
        }
        .style17
        {
            height: 40px;
            width: 181px;
        }
        .style9
        {
            width: 283px;
            height: 40px;
        }
        .style8
        {
            height: 40px;
        }
        .style18
        {
            width: 100%;
        }
        .style3
        {
            height: 26px;
        }
        .style19
        {
            width: 34%;
        }
        .style20
        {
            width: 170px;
        }
        .style21
        {
            height: 26px;
            width: 170px;
        }
        .style7
        {
            height: 26px;
            width: 283px;
        }
        .style22
        {
            width: 22%;
        }
        .style23
        {
        }
        .style25
        {
            width: 53px;
        }
        .style26
        {
            overflow: hidden;
            margin-bottom: 1em;
            text-decoration: underline;
            font-size: large;
            width: 884px;
            text-align: center;
        }
        .style27
        {
            width: 125px;
        }
        .style28
        {
            height: 26px;
            width: 53px;
        }
        .style29
        {
            height: 26px;
            width: 320px;
        }
        .style30
        {
            width: 320px;
        }
        .style31
        {
            height: 28px;
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
			
            <li class="first">
				<span class="opener">Client<b></b></span>
				<ul>
					<li><a href="#">Technology Pasrtner</a></li>
					<li><a href="#">Consultancy Partner</a></li>
					<li><a href="#">Marketing and Media Partner</a></li>					
				</ul>
			</li>
			<li><a href="#">Products</a></li>
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
			<li><a href="#">About</a></li>
			<li class="last"><a href="#">Contact</a></li>
		</ul>
		<br class="clearfix" />
	</div>
	<div id="page">
		<div id="content">
			<div class="style26">
				<strong>Employee Registartion Form</strong></div>
			<table class="style1">
                <tr>
                    <td colspan="2">
                        <asp:TabContainer ID="TabContainer1" runat="server" ActiveTabIndex="1" 
                            BorderColor="#009999" BorderStyle="Outset" BorderWidth="3px" Font-Bold="False" 
                            Height="545px" ScrollBars="Both" Width="884px">
                            <asp:TabPanel runat="server" HeaderText="TabPanel1" ID="TabPanel1">
                                <HeaderTemplate>
                                    Personal Detail
                                </HeaderTemplate>
                                <ContentTemplate>
                                    <table class="style1">
                                        <tr>
                                            <td class="style16">
                                                Full Name :</td>
                                            <td class="style6">
                                                <asp:TextBox ID="txtFullName" runat="server"></asp:TextBox>
                                                &nbsp;<span class="style13">*</span></td>
                                            <td>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                                                    ControlToValidate="txtFullName" ErrorMessage="Must enter name" 
                                                    ForeColor="Red"></asp:RequiredFieldValidator>
                                            </td>
                                            <td>
                                                &nbsp;</td>
                                        </tr>
                                        <tr>
                                            <td class="style16">
                                                Parmenant Address :</td>
                                            <td class="style6">
                                                <asp:TextBox ID="txtPAddress" runat="server" TextMode="MultiLine"></asp:TextBox>
                                                &nbsp;<span class="style13">*</span></td>
                                            <td>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator20" runat="server" 
                                                    ControlToValidate="txtPAddress" ErrorMessage="Must Enter Address" 
                                                    ForeColor="Red"></asp:RequiredFieldValidator>
                                            </td>
                                            <td>
                                                &nbsp;</td>
                                        </tr>
                                        <tr>
                                            <td class="style17">
                                                Current Address :</td>
                                            <td class="style9">
                                                <asp:TextBox ID="txtCAddress" runat="server" TextMode="MultiLine"></asp:TextBox>
                                            </td>
                                            <td class="style8">
                                            </td>
                                            <td class="style8">
                                                </td>
                                        </tr>
                                        <tr>
                                            <td class="style16">
                                                Date Of Birth :</td>
                                            <td class="style6">
                                                <asp:TextBox ID="txtDOB" runat="server"></asp:TextBox>
                                                <asp:CalendarExtender ID="txtDOB_CalendarExtender" runat="server" 
                                                    Enabled="True" TargetControlID="txtDOB">
                                                </asp:CalendarExtender>
                                            </td>
                                            <td>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator23" runat="server" 
                                                    ControlToValidate="txtDOB" ErrorMessage="Select Proper DOB" ForeColor="Red"></asp:RequiredFieldValidator>
                                            </td>
                                            <td>
                                                &nbsp;</td>
                                        </tr>
                                        <tr>
                                            <td class="style16">
                                                Gender :</td>
                                            <td class="style6">
                                                <asp:RadioButtonList ID="rdGender" runat="server" RepeatDirection="Horizontal" 
                                                    Width="132px">
                                                    <asp:ListItem>Male</asp:ListItem>
                                                    <asp:ListItem>Female</asp:ListItem>
                                                </asp:RadioButtonList>
                                                &nbsp;</td>
                                            <td>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                                                    ControlToValidate="rdGender" ErrorMessage="Select proper gender" 
                                                    ForeColor="Red" ValidationGroup="s"></asp:RequiredFieldValidator>
                                            </td>
                                            <td>
                                                &nbsp;</td>
                                        </tr>
                                        <tr>
                                            <td class="style16">
                                                Marital Status :</td>
                                            <td class="style6">
                                                <asp:RadioButtonList ID="rdMaritalStatus" runat="server" 
                                                    RepeatDirection="Horizontal">
                                                    <asp:ListItem>Married</asp:ListItem>
                                                    <asp:ListItem>Unmarried</asp:ListItem>
                                                </asp:RadioButtonList>
                                            </td>
                                            <td>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                                                    ControlToValidate="rdMaritalStatus" ErrorMessage="Select proper marital status" 
                                                    ForeColor="Red"></asp:RequiredFieldValidator>
                                            </td>
                                            <td>
                                                &nbsp;</td>
                                        </tr>
                                        <tr>
                                            <td class="style16">
                                                Country :</td>
                                            <td class="style6">
                                                <asp:DropDownList ID="ddCountry" runat="server" AutoPostBack="True" 
                                                    OnSelectedIndexChanged="ddCountry_SelectedIndexChanged">
                                                </asp:DropDownList>
                                                &nbsp;</td>
                                            <td>
                                                &nbsp;</td>
                                            <td>
                                                &nbsp;</td>
                                        </tr>
                                        <tr>
                                            <td class="style16">
                                                State :</td>
                                            <td class="style6">
                                                <asp:DropDownList ID="ddState" runat="server" AutoPostBack="True" 
                                                    OnSelectedIndexChanged="ddState_SelectedIndexChanged">
                                                </asp:DropDownList>
                                                &nbsp;</td>
                                            <td>
                                                &nbsp;</td>
                                            <td>
                                                &nbsp;</td>
                                        </tr>
                                        <tr>
                                            <td class="style16">
                                                City :</td>
                                            <td class="style6">
                                                <asp:DropDownList ID="ddCity" runat="server">
                                                </asp:DropDownList>
                                                &nbsp;</td>
                                            <td>
                                                &nbsp;</td>
                                            <td>
                                                &nbsp;</td>
                                        </tr>
                                        <tr>
                                            <td class="style16">
                                                PinCode :</td>
                                            <td class="style6">
                                                <asp:TextBox ID="txtPinCode" runat="server"></asp:TextBox>
                                                &nbsp;<span class="style13">*</span></td>
                                            <td>
                                                <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" 
                                                    ControlToValidate="txtPinCode" ErrorMessage="Enter Proper PinCode" 
                                                    ForeColor="Red" ValidationExpression="\d{6}"></asp:RegularExpressionValidator>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator25" runat="server" 
                                                    ControlToValidate="txtPinCode" ErrorMessage="Enter Pincode" ForeColor="Red"></asp:RequiredFieldValidator>
                                            </td>
                                            <td>
                                                &nbsp;</td>
                                        </tr>
                                        <tr>
                                            <td class="style16">
                                                Contact No. :</td>
                                            <td class="style6">
                                                <asp:TextBox ID="txtContactNo" runat="server"></asp:TextBox>
                                                &nbsp;<span class="style13">*</span></td>
                                            <td>
                                                <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" 
                                                    ControlToValidate="txtContactNo" ErrorMessage="Enter Proper Contact No" 
                                                    ForeColor="Red" ValidationExpression="^[789]\d{9}$"></asp:RegularExpressionValidator>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator26" runat="server" 
                                                    ControlToValidate="txtContactNo" ErrorMessage="Enter Contact No" 
                                                    ForeColor="Red"></asp:RequiredFieldValidator>
                                            </td>
                                            <td>
                                                &nbsp;</td>
                                        </tr>
                                        <tr>
                                            <td class="style16">
                                                E- mail :</td>
                                            <td class="style6">
                                                <asp:TextBox ID="txtEmail" runat="server" Height="21px" Width="217px"></asp:TextBox>
                                                &nbsp;<span class="style13">*</span></td>
                                            <td>
                                                <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" 
                                                    ControlToValidate="txtEmail" ErrorMessage="Enter Proper Email ID" 
                                                    ForeColor="Red" 
                                                    ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator27" runat="server" 
                                                    ControlToValidate="txtEmail" ErrorMessage="Enter proper Email ID" 
                                                    ForeColor="Red"></asp:RequiredFieldValidator>
                                            </td>
                                            <td>
                                                &nbsp;</td>
                                        </tr>
                                        <tr>
                                            <td class="style16">
                                                Blood Group :</td>
                                            <td class="style6">
                                                <asp:TextBox ID="txtBloodGroup" runat="server"></asp:TextBox>
                                            </td>
                                            <td>
                                                &nbsp;</td>
                                            <td>
                                                &nbsp;</td>
                                        </tr>
                                        <tr>
                                            <td class="style31">
                                                </td>
                                            <td class="style31">
                                                </td>
                                            <td class="style31">
                                                </td>
                                            <td class="style31">
                                                </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <asp:Button ID="btnNext" runat="server" 
                                                    OnClick="btnNext_Click" Text="Next" />
                                            </td>
                                            <td>
                                                &nbsp;</td>
                                            <td>
                                                &nbsp;</td>
                                            <td>
                                                &nbsp;</td>
                                        </tr>
                                    </table>
                                </ContentTemplate>
                            </asp:TabPanel>
                            <asp:TabPanel ID="TabPanel2" runat="server" HeaderText="TabPanel2">
                                <HeaderTemplate>
                                    Educational Detail
                                </HeaderTemplate>
                                <ContentTemplate>
                                    <table class="style18">
                                        <tr>
                                            <td class="style16">
                                                &nbsp;</td>
                                            <td class="style6">
                                                &nbsp;</td>
                                            <td>
                                                &nbsp;</td>
                                            <td>
                                                &nbsp;</td>
                                        </tr>
                                        <tr>
                                            <td class="style16">
                                                Qualification :</td>
                                            <td class="style6">
                                                <asp:TextBox ID="txtQualification" runat="server"></asp:TextBox>
                                                &nbsp;<span class="style13">*</span></td>
                                            <td>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator21" runat="server" 
                                                    ControlToValidate="txtQualification" ErrorMessage="Enter proper qualification" 
                                                    ForeColor="Red" ValidationGroup="ed"></asp:RequiredFieldValidator>
                                            </td>
                                            <td>
                                                &nbsp;</td>
                                        </tr>
                                        <tr>
                                            <td class="style16">
                                                Affected University :</td>
                                            <td class="style6">
                                                <asp:TextBox ID="txtAffiliatedUniversity" runat="server"></asp:TextBox>
                                            </td>
                                            <td>
                                                &nbsp;</td>
                                            <td>
                                                &nbsp;</td>
                                        </tr>
                                        <tr>
                                            <td class="style16">
                                                Skill Sets :</td>
                                            <td class="style6">
                                                <asp:TextBox ID="txtSkillsSet" runat="server" TextMode="MultiLine"></asp:TextBox>
                                            </td>
                                            <td>
                                                &nbsp;</td>
                                            <td>
                                                &nbsp;</td>
                                        </tr>
                                        <tr>
                                            <td class="style16">
                                                1st Highest Degree :</td>
                                            <td class="style6">
                                                <asp:DropDownList ID="ddFirstDegree" runat="server">
                                                </asp:DropDownList>
                                            </td>
                                            <td>
                                                &nbsp;</td>
                                            <td>
                                                &nbsp;</td>
                                        </tr>
                                        <tr>
                                            <td class="style16">
                                                2st Highest Degree :</td>
                                            <td class="style6">
                                                <asp:DropDownList ID="ddSecongDegree" runat="server">
                                                </asp:DropDownList>
                                            </td>
                                            <td>
                                                &nbsp;</td>
                                            <td>
                                                &nbsp;</td>
                                        </tr>
                                        <tr>
                                            <td class="style16">
                                                3st Highest Degree :</td>
                                            <td class="style6">
                                                <asp:DropDownList ID="ddThirdDegree" runat="server">
                                                </asp:DropDownList>
                                            </td>
                                            <td>
                                                &nbsp;</td>
                                            <td>
                                                &nbsp;</td>
                                        </tr>
                                        <tr>
                                            <td class="style16">
                                                4st Highest Degree :</td>
                                            <td class="style6">
                                                <asp:DropDownList ID="ddFourthDegree" runat="server">
                                                </asp:DropDownList>
                                            </td>
                                            <td>
                                                &nbsp;</td>
                                            <td>
                                                &nbsp;</td>
                                        </tr>
                                        <tr>
                                            <td class="style16">
                                                &nbsp;</td>
                                            <td class="style6">
                                                &nbsp;</td>
                                            <td>
                                                &nbsp;</td>
                                            <td>
                                                &nbsp;</td>
                                        </tr>
                                        <tr>
                                            <td class="style16">
                                                <asp:Button ID="Button12" runat="server" OnClick="Button2_Click" 
                                                    Text="Previous" />
                                            </td>
                                            <td class="style6">
                                                <asp:Button ID="Button13" runat="server" OnClick="Button1_Click" Text="Next" />
                                            </td>
                                            <td>
                                                &nbsp;</td>
                                            <td>
                                                &nbsp;</td>
                                        </tr>
                                    </table>
                                </ContentTemplate>
                            </asp:TabPanel>
                            <asp:TabPanel ID="TabPanel3" runat="server" HeaderText="TabPanel3">
                                <HeaderTemplate>
                                    Professional Detail
                                </HeaderTemplate>
                                <ContentTemplate>
                                    <table class="style18">
                                        <tr>
                                            <td class="style16">
                                                &nbsp;</td>
                                            <td class="style6">
                                                &nbsp;</td>
                                            <td>
                                                &nbsp;</td>
                                            <td>
                                                &nbsp;</td>
                                        </tr>
                                        <tr>
                                            <td class="style16">
                                                &nbsp;</td>
                                            <td class="style6">
                                                &nbsp;</td>
                                            <td>
                                                &nbsp;</td>
                                            <td>
                                                &nbsp;</td>
                                        </tr>
                                        <tr>
                                            <td class="style16">
                                                Job Type :</td>
                                            <td class="style6">
                                                <asp:DropDownList ID="ddJobType" runat="server">
                                                </asp:DropDownList>
                                                &nbsp;<span class="style13">*</span></td>
                                            <td>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator12" runat="server" 
                                                    ControlToValidate="ddJobType" ErrorMessage="Select Proper Job Type" 
                                                    ForeColor="Red" ValidationGroup="prd"></asp:RequiredFieldValidator>
                                            </td>
                                            <td>
                                                &nbsp;</td>
                                        </tr>
                                        <tr>
                                            <td class="style16">
                                                Previous Company Name :</td>
                                            <td class="style6">
                                                <asp:TextBox ID="txtPreviousCompany" runat="server" Height="20px" Width="228px"></asp:TextBox>
                                            </td>
                                            <td>
                                                &nbsp;</td>
                                            <td>
                                                &nbsp;</td>
                                        </tr>
                                        <tr>
                                            <td class="style16">
                                                Previous Department :</td>
                                            <td class="style6">
                                                <asp:DropDownList ID="ddPreviousDepartment" runat="server" AutoPostBack="True" 
                                                    OnSelectedIndexChanged="ddPreviousDepartment_SelectedIndexChanged">
                                                </asp:DropDownList>
                                            </td>
                                            <td>
                                                &nbsp;</td>
                                            <td>
                                                &nbsp;</td>
                                        </tr>
                                        <tr>
                                            <td class="style16">
                                                Previous Designation</td>
                                            <td class="style6">
                                                <asp:DropDownList ID="ddPreviousDesignation" runat="server">
                                                </asp:DropDownList>
                                            </td>
                                            <td>
                                                &nbsp;</td>
                                            <td>
                                                &nbsp;</td>
                                        </tr>
                                        <tr>
                                            <td class="style16">
                                                Date Of Joining :</td>
                                            <td class="style6">
                                                <asp:TextBox ID="txtDOJ" runat="server"></asp:TextBox>
                                                <asp:CalendarExtender ID="txtDOJ_CalendarExtender" runat="server" 
                                                    Enabled="True" TargetControlID="txtDOJ">
                                                </asp:CalendarExtender>
                                                &nbsp;<span class="style13">*</span></td>
                                            <td>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator13" runat="server" 
                                                    ControlToValidate="txtDOJ" ErrorMessage="Enter Proper Date Of Joining" 
                                                    ForeColor="Red" ValidationGroup="prd"></asp:RequiredFieldValidator>
                                                <asp:ScriptManager ID="ScriptManager1" runat="server">
                                                </asp:ScriptManager>
                                            </td>
                                            <td>
                                                &nbsp;</td>
                                        </tr>
                                        <tr>
                                            <td class="style16">
                                                Date Of Leaving :</td>
                                            <td class="style6">
                                                <asp:TextBox ID="txtDOL" runat="server"></asp:TextBox>
                                                <asp:CalendarExtender ID="txtDOL_CalendarExtender" runat="server" 
                                                    Enabled="True" TargetControlID="txtDOL">
                                                </asp:CalendarExtender>
                                            </td>
                                            <td>
                                                &nbsp;</td>
                                            <td>
                                                &nbsp;</td>
                                        </tr>
                                        <tr>
                                            <td class="style16">
                                                Last Salary :</td>
                                            <td class="style6">
                                                <asp:TextBox ID="txtLastSalary" runat="server"></asp:TextBox>
                                            </td>
                                            <td>
                                                &nbsp;</td>
                                            <td>
                                                &nbsp;</td>
                                        </tr>
                                        <tr>
                                            <td class="style16">
                                                Experience :</td>
                                            <td class="style6">
                                                <asp:TextBox ID="txtExperience" runat="server"></asp:TextBox>
                                            </td>
                                            <td>
                                                &nbsp;</td>
                                            <td>
                                                &nbsp;</td>
                                        </tr>
                                        <tr>
                                            <td class="style16">
                                                Previous Company Contact No :</td>
                                            <td class="style6">
                                                <asp:TextBox ID="txtPreComContact" runat="server"></asp:TextBox>
                                            </td>
                                            <td>
                                                &nbsp;</td>
                                            <td>
                                                &nbsp;</td>
                                        </tr>
                                        <tr>
                                            <td class="style16">
                                                Previous Company Email Id :</td>
                                            <td class="style6">
                                                <asp:TextBox ID="txtPreCompanyEmail" runat="server"></asp:TextBox>
                                            </td>
                                            <td>
                                                &nbsp;</td>
                                            <td>
                                                &nbsp;</td>
                                        </tr>
                                        <tr>
                                            <td class="style16">
                                                &nbsp;</td>
                                            <td class="style6">
                                                &nbsp;</td>
                                            <td>
                                                &nbsp;</td>
                                            <td>
                                                &nbsp;</td>
                                        </tr>
                                        <tr>
                                            <td class="style16">
                                                <asp:Button ID="Button4" runat="server" OnClick="Button4_Click" 
                                                    Text="Previous" />
                                            </td>
                                            <td class="style6">
                                                <asp:Button ID="Button3" runat="server" OnClick="Button3_Click" Text="Next" />
                                            </td>
                                            <td>
                                                &nbsp;</td>
                                            <td>
                                                &nbsp;</td>
                                        </tr>
                                    </table>
                                </ContentTemplate>
                            </asp:TabPanel>
                            <asp:TabPanel ID="TabPanel4" runat="server" HeaderText="TabPanel4">
                                <HeaderTemplate>
                                    Emergency Contact Detail
                                </HeaderTemplate>
                                <ContentTemplate>
                                    <table class="style18">
                                        <tr>
                                            <td class="style19">
                                                Person Name :</td>
                                            <td class="style20">
                                                <asp:TextBox ID="txtE_PersonName" runat="server"></asp:TextBox>
                                                &nbsp;<span class="style13">*</span></td>
                                            <td>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator14" runat="server" 
                                                    ControlToValidate="txtE_PersonName" ErrorMessage="Enter Proper Person Name" 
                                                    ForeColor="Red" ValidationGroup="ec"></asp:RequiredFieldValidator>
                                            </td>
                                            <td>
                                                &nbsp;</td>
                                        </tr>
                                        <tr>
                                            <td class="style19">
                                                Relationship :</td>
                                            <td class="style20">
                                                <asp:TextBox ID="txtE_Relationship" runat="server"></asp:TextBox>
                                            </td>
                                            <td>
                                                &nbsp;</td>
                                            <td>
                                                &nbsp;</td>
                                        </tr>
                                        <tr>
                                            <td class="style19">
                                                Address :</td>
                                            <td class="style20">
                                                <asp:TextBox ID="txtE_Address" runat="server"></asp:TextBox>
                                                &nbsp;<span class="style13">*</span></td>
                                            <td>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator22" runat="server" 
                                                    ControlToValidate="txtE_Address" ErrorMessage="Enter Proper Address" 
                                                    ForeColor="Red" ValidationGroup="ec"></asp:RequiredFieldValidator>
                                            </td>
                                            <td>
                                                &nbsp;</td>
                                        </tr>
                                        <tr>
                                            <td class="style19">
                                                Contact No :</td>
                                            <td class="style21">
                                                <asp:TextBox ID="txtE_ConatctNo" runat="server"></asp:TextBox>
                                                &nbsp;<span class="style13">*</span></td>
                                            <td class="style3">
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator15" runat="server" 
                                                    ControlToValidate="txtE_ConatctNo" ErrorMessage="Enter Proper Contact No" 
                                                    ForeColor="Red" ValidationGroup="ec"></asp:RequiredFieldValidator>
                                            </td>
                                            <td class="style3">
                                                &nbsp;</td>
                                        </tr>
                                        <tr>
                                            <td class="style19">
                                                &nbsp;</td>
                                            <td class="style21">
                                                &nbsp;</td>
                                            <td class="style3">
                                                &nbsp;</td>
                                            <td class="style3">
                                                &nbsp;</td>
                                        </tr>
                                        <tr>
                                            <td class="style19">
                                                <asp:Button ID="Button10" runat="server" OnClick="Button6_Click" 
                                                    Text="Previous" />
                                            </td>
                                            <td class="style21">
                                                <asp:Button ID="Button11" runat="server" OnClick="Button5_Click" Text="Next" />
                                            </td>
                                            <td class="style3">
                                                &nbsp;</td>
                                            <td class="style3">
                                                &nbsp;</td>
                                        </tr>
                                    </table>
                                </ContentTemplate>
                            </asp:TabPanel>
                            <asp:TabPanel ID="TabPanel5" runat="server" HeaderText="TabPanel5">
                                <HeaderTemplate>
                                    Authenticaion Detail
                                </HeaderTemplate>
                                <ContentTemplate>
                                    <table class="style18" frame="void">
                                        <tr>
                                            <td class="style22">
                                                User Name :</td>
                                            <td class="style7">
                                                <asp:TextBox ID="txtUserName" runat="server"></asp:TextBox>
                                                &nbsp;<span class="style13">*</span></td>
                                            <td class="style3">
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator16" runat="server" 
                                                    ControlToValidate="txtUserName" ErrorMessage="Enter Proper User Name" 
                                                    ForeColor="Red" ValidationGroup="ad"></asp:RequiredFieldValidator>
                                            </td>
                                            <td class="style3">
                                                &nbsp;</td>
                                        </tr>
                                        <tr>
                                            <td class="style22">
                                                Password :</td>
                                            <td class="style7">
                                                <asp:TextBox ID="txtPassword" runat="server" TextMode="Password"></asp:TextBox>
                                                &nbsp;<span class="style13">*</span></td>
                                            <td class="style3">
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator17" runat="server" 
                                                    ControlToValidate="txtPassword" ErrorMessage="Enter Proper Password" 
                                                    ForeColor="Red" ValidationGroup="ad"></asp:RequiredFieldValidator>
                                            </td>
                                            <td class="style3">
                                                &nbsp;</td>
                                        </tr>
                                        <tr>
                                            <td class="style22">
                                                Confirm Password :</td>
                                            <td class="style7">
                                                <asp:TextBox ID="txtConfirmPassword" runat="server" TextMode="Password"></asp:TextBox>
                                                &nbsp;<span class="style13">*</span></td>
                                            <td class="style3">
                                                <asp:CompareValidator ID="CompareValidator1" runat="server" 
                                                    ControlToCompare="txtPassword" ControlToValidate="txtConfirmPassword" 
                                                    ErrorMessage="Password Does Not Matched" ForeColor="Red" ValidationGroup="ad"></asp:CompareValidator>
                                            </td>
                                            <td class="style3">
                                                &nbsp;</td>
                                        </tr>
                                        <tr>
                                            <td class="style22">
                                                Security Question :</td>
                                            <td class="style7">
                                                <asp:DropDownList ID="ddSecurityQuestion" runat="server" Height="31px" 
                                                    Width="252px">
                                                </asp:DropDownList>
                                                &nbsp;<span class="style13">*</span></td>
                                            <td class="style3">
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator18" runat="server" 
                                                    ControlToValidate="ddSecurityQuestion" ErrorMessage="Select Security Question" 
                                                    ForeColor="Red" ValidationGroup="ad"></asp:RequiredFieldValidator>
                                            </td>
                                            <td class="style3">
                                                &nbsp;</td>
                                        </tr>
                                        <tr>
                                            <td class="style22">
                                                Security Answer :</td>
                                            <td class="style7">
                                                <asp:TextBox ID="txtSecurityAnswer" runat="server" TextMode="MultiLine" 
                                                    Width="258px"></asp:TextBox>
                                                &nbsp;<span class="style13">*</span></td>
                                            <td class="style3">
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator19" runat="server" 
                                                    ControlToValidate="txtSecurityAnswer" ErrorMessage="Enter Proper Answer" 
                                                    ForeColor="Red" ValidationGroup="ad"></asp:RequiredFieldValidator>
                                            </td>
                                            <td class="style3">
                                                &nbsp;</td>
                                        </tr>
                                        <tr>
                                            <td class="style22">
                                                Passport No :</td>
                                            <td class="style7">
                                                <asp:TextBox ID="txtPassportNo" runat="server"></asp:TextBox>
                                            </td>
                                            <td class="style3">
                                                &nbsp;</td>
                                            <td class="style3">
                                                &nbsp;</td>
                                        </tr>
                                        <tr>
                                            <td class="style22">
                                                Bank Account No :</td>
                                            <td class="style7">
                                                <asp:TextBox ID="txtBankAccountNo" runat="server"></asp:TextBox>
                                            </td>
                                            <td class="style3">
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator24" runat="server" 
                                                    ControlToValidate="txtBankAccountNo" 
                                                    ErrorMessage="Enter Proper Bank Account No" ForeColor="Red" 
                                                    ValidationGroup="ad"></asp:RequiredFieldValidator>
                                            </td>
                                            <td class="style3">
                                                &nbsp;</td>
                                        </tr>
                                        <tr>
                                            <td class="style22">
                                                P.F. No :</td>
                                            <td class="style7">
                                                <asp:TextBox ID="txtPFNo" runat="server"></asp:TextBox>
                                            </td>
                                            <td class="style3">
                                                &nbsp;</td>
                                            <td class="style3">
                                                &nbsp;</td>
                                        </tr>
                                        <tr>
                                            <td class="style22">
                                                &nbsp;</td>
                                            <td class="style7">
                                                &nbsp;</td>
                                            <td class="style3">
                                                &nbsp;</td>
                                            <td class="style3">
                                                &nbsp;</td>
                                        </tr>
                                        <tr>
                                            <td class="style22">
                                                <asp:Button ID="Button8" runat="server" OnClick="Button8_Click" 
                                                    Text="Previous" />
                                            </td>
                                            <td class="style7">
                                                <asp:Button ID="Button7" runat="server" OnClick="Button7_Click" Text="Next" />
                                            </td>
                                            <td class="style3">
                                                &nbsp;</td>
                                            <td class="style3">
                                                &nbsp;</td>
                                        </tr>
                                        <tr>
                                            <td class="style22">
                                                &nbsp;</td>
                                            <td>
                                                &nbsp;</td>
                                            <td>
                                                &nbsp;</td>
                                            <td>
                                                &nbsp;</td>
                                        </tr>
                                        <tr>
                                            <td class="style22">
                                                &nbsp;</td>
                                            <td>
                                                &nbsp;</td>
                                            <td>
                                                &nbsp;</td>
                                            <td>
                                                &nbsp;</td>
                                        </tr>
                                    </table>
                                </ContentTemplate>
                            </asp:TabPanel>
                            <asp:TabPanel ID="TabPanel6" runat="server" HeaderText="TabPanel6">
                                <HeaderTemplate>
                                    Document Upload
                                </HeaderTemplate>
                                <ContentTemplate>
                                    <table class="style18">
                                        <tr>
                                            <td class="style27">
                                                Certificate :</td>
                                            <td class="style29">
                                                <asp:FileUpload ID="fuCertificate" runat="server" />
                                                &nbsp;<span class="style13">*</span></td>
                                            <td class="style28">
                                                <asp:Label ID="Label8" runat="server"></asp:Label>
                                            </td>
                                            <td class="style3">
                                                <asp:RegularExpressionValidator ID="RegularExpressionValidator5" runat="server" 
                                                    ControlToValidate="fuCertificate" 
                                                    ErrorMessage="Upload Certificate in correct format" ForeColor="Red" 
                                                    ValidationExpression="(.*?)\.(|pdf)$"></asp:RegularExpressionValidator>
                                            </td>
                                            <td class="style3">
                                                &nbsp;</td>
                                        </tr>
                                        <tr>
                                            <td class="style27">
                                                Document :</td>
                                            <td class="style29">
                                                <asp:FileUpload ID="fuDocument" runat="server" />
                                                <span class="style13">&nbsp;*</span></td>
                                            <td class="style28">
                                                <asp:Label ID="Label9" runat="server"></asp:Label>
                                            </td>
                                            <td class="style3">
                                                <asp:RegularExpressionValidator ID="RegularExpressionValidator6" runat="server" 
                                                    ControlToValidate="fuDocument" ErrorMessage="Upload Document in correct format" 
                                                    ForeColor="Red" ValidationExpression="(.*?)\.(|pdf)$"></asp:RegularExpressionValidator>
                                            </td>
                                            <td class="style3">
                                                &nbsp;</td>
                                        </tr>
                                        <tr>
                                            <td class="style27">
                                                Photo :</td>
                                            <td class="style29">
                                                <asp:FileUpload ID="fuPhoto" runat="server" />
                                                &nbsp;<span class="style13">*</span></td>
                                            <td class="style28">
                                                <asp:Label ID="Label10" runat="server"></asp:Label>
                                            </td>
                                            <td class="style3">
                                                <asp:RegularExpressionValidator ID="RegularExpressionValidator7" runat="server" 
                                                    ControlToValidate="fuPhoto" ErrorMessage="Upload Photo in Correct Format" 
                                                    ForeColor="Red" ValidationExpression="(.*?)\.(jpg|JPG|gif|GIF)$"></asp:RegularExpressionValidator>
                                            </td>
                                            <td class="style3">
                                                &nbsp;</td>
                                        </tr>
                                        <tr>
                                            <td class="style27">
                                                &nbsp;</td>
                                            <td class="style7" colspan="2">
                                                &nbsp;</td>
                                            <td class="style3">
                                                <asp:Label ID="Label7" runat="server" ForeColor="Red"></asp:Label>
                                            </td>
                                            <td class="style3">
                                                &nbsp;</td>
                                        </tr>
                                        <tr>
                                            <td class="style27">
                                                <asp:Button ID="btnSubmit" runat="server" OnClick="btnSubmit_Click" 
                                                    Text="Submit" />
                                            </td>
                                            <td class="style6" colspan="2">
                                                <asp:Button ID="btnUpdate" runat="server" OnClick="btnUpdate_Click" 
                                                    Text="Update" />
                                            </td>
                                            <td>
                                                <asp:Button ID="Button9" runat="server" OnClick="Button9_Click" 
                                                    Text="Previous" />
                                            </td>
                                            <td>
                                                &nbsp;</td>
                                        </tr>
                                        <tr>
                                            <td class="style27">
                                                &nbsp;</td>
                                            <td class="style30">
                                                &nbsp;</td>
                                            <td class="style25">
                                                &nbsp;</td>
                                            <td>
                                                &nbsp;</td>
                                        </tr>
                                        <tr>
                                            <td class="style23" colspan="4">
                                                <asp:GridView ID="GridView1" runat="server" OnRowCommand="GridView1_RowCommand" 
                                                    OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
                                                    <Columns>
                                                        <asp:TemplateField HeaderText="Edit">
                                                            <ItemTemplate>
                                                                <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="false" 
                                                                    CommandArgument='<%#Eval("Employee_ID") %>' CommandName="Editt">Edit</asp:LinkButton>
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Delete">
                                                            <ItemTemplate>
                                                                <asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="false" 
                                                                    CommandArgument='<%#Eval("Employee_ID") %>' CommandName="Deletee">Delete</asp:LinkButton>
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                    </Columns>
                                                </asp:GridView>
                                            </td>
                                        </tr>
                                    </table>
                                </ContentTemplate>
                            </asp:TabPanel>
                        </asp:TabContainer>
                    </td>
                </tr>
                <tr>
                    <td>
                        &nbsp;</td>
                    <td>
                        &nbsp;</td>
                </tr>
            </table>
			<br class="clearfix" />
		</div>
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
