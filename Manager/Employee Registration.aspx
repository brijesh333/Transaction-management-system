﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Employee Registration.aspx.cs" Inherits="Manager_er" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">

        .style1
        {
            width: 100%;
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
            height: 26px;
            width: 181px;
        }
        .style7
        {
            height: 26px;
            width: 283px;
        }
        .style3
        {
            height: 26px;
        }
        </style>
</head>
<body>
<form id="form1" runat="server">
    <div>
    
        <asp:TabContainer ID="TabContainer1" runat="server" ActiveTabIndex="2" 
            Height="662px" Width="1251px">
            
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <asp:TabPanel runat="server" HeaderText="TabPanel1" ID="TabPanel1"><HeaderTemplate>
                Personal Detail</HeaderTemplate><ContentTemplate><table 
                class="style1"><tr><td class="style16">&nbsp;</td><td class="style6">&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td></tr><tr><td 
                class="style16">Full Name :</td><td class="style6"><asp:TextBox 
                    ID="txtFullName" runat="server"></asp:TextBox>&nbsp;<span class="style13">*</span></td><td><asp:RequiredFieldValidator 
                    ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtFullName" 
                    ErrorMessage="Must enter name" ForeColor="Red" ValidationGroup="pd"></asp:RequiredFieldValidator></td><td>&nbsp;</td></tr><tr><td 
                class="style16">Parmenant Address :</td><td class="style6"><asp:TextBox 
                    ID="txtPAddress" runat="server" TextMode="MultiLine"></asp:TextBox>&nbsp;<span 
                    class="style13">*</span></td><td><asp:RequiredFieldValidator 
                    ID="RequiredFieldValidator20" runat="server" ControlToValidate="txtPAddress" 
                    ErrorMessage="Must Enter Address" ForeColor="Red" ValidationGroup="pd"></asp:RequiredFieldValidator></td><td>&nbsp;</td></tr><tr><td 
                class="style17">Current Address :</td><td class="style9"><asp:TextBox 
                    ID="txtCAddress" runat="server" TextMode="MultiLine"></asp:TextBox></td><td 
                class="style8"></td><td class="style8"></td></tr><tr><td class="style16">Date Of Birth :</td><td 
                class="style6"><asp:TextBox ID="txtDOB" runat="server"></asp:TextBox><asp:CalendarExtender 
                ID="txtDOB_CalendarExtender" runat="server" Enabled="True" 
                TargetControlID="txtDOB"></asp:CalendarExtender></td><td>&nbsp;</td><td>&nbsp;</td></tr><tr><td 
                class="style16">Gender :</td><td class="style6"><asp:RadioButtonList 
                    ID="rdGender" runat="server" RepeatDirection="Horizontal" Width="132px"><asp:ListItem>Male</asp:ListItem><asp:ListItem>Female</asp:ListItem></asp:RadioButtonList>&nbsp;</td><td><asp:RequiredFieldValidator 
                    ID="RequiredFieldValidator2" runat="server" ControlToValidate="rdGender" 
                    ErrorMessage="Select proper gender" ForeColor="Red" ValidationGroup="pd"></asp:RequiredFieldValidator></td><td>&nbsp;</td></tr><tr><td 
                class="style16">Marital Status :</td><td class="style6"><asp:RadioButtonList 
                    ID="rdMaritalStatus" runat="server" RepeatDirection="Horizontal"><asp:ListItem>Married</asp:ListItem><asp:ListItem>Unmarried</asp:ListItem></asp:RadioButtonList></td><td><asp:RequiredFieldValidator 
                    ID="RequiredFieldValidator3" runat="server" ControlToValidate="rdMaritalStatus" 
                    ErrorMessage="Select proper marital status" ForeColor="Red" 
                    ValidationGroup="pd"></asp:RequiredFieldValidator></td><td>&nbsp;</td></tr><tr><td 
                class="style16">Country :</td><td class="style6"><asp:DropDownList 
                    ID="ddCountry" runat="server" AutoPostBack="True" 
                    OnSelectedIndexChanged="ddCountry_SelectedIndexChanged"></asp:DropDownList>&nbsp;<span 
                    class="style13">*</span></td><td><asp:RequiredFieldValidator 
                    ID="RequiredFieldValidator4" runat="server" ControlToValidate="ddCountry" 
                    ErrorMessage="Select proper country" ForeColor="Red" ValidationGroup="pd"></asp:RequiredFieldValidator></td><td>&nbsp;</td></tr><tr><td 
                class="style16">State :</td><td class="style6"><asp:DropDownList ID="ddState" 
                    runat="server" AutoPostBack="True" 
                    OnSelectedIndexChanged="ddState_SelectedIndexChanged"></asp:DropDownList>&nbsp;<span 
                    class="style13">*</span></td><td><asp:RequiredFieldValidator 
                    ID="RequiredFieldValidator5" runat="server" ControlToValidate="ddState" 
                    ErrorMessage="Select proper state" ForeColor="Red" ValidationGroup="pd"></asp:RequiredFieldValidator></td><td>&nbsp;</td></tr><tr><td 
                class="style16">City :</td><td class="style6"><asp:DropDownList ID="ddCity" 
                    runat="server"></asp:DropDownList>&nbsp;<span class="style13">*</span></td><td><asp:RequiredFieldValidator 
                    ID="RequiredFieldValidator6" runat="server" ControlToValidate="ddCity" 
                    ErrorMessage="Select proper city" ForeColor="Red" ValidationGroup="pd"></asp:RequiredFieldValidator></td><td>&nbsp;</td></tr><tr><td 
                class="style16">PinCode :</td><td class="style6"><asp:TextBox ID="txtPinCode" 
                    runat="server"></asp:TextBox>&nbsp;<span class="style13">*</span></td><td><asp:RegularExpressionValidator 
                    ID="RegularExpressionValidator4" runat="server" ControlToValidate="txtPinCode" 
                    ErrorMessage="Enter Proper PinCode" ForeColor="Red" 
                    ValidationExpression="\d{6}" ValidationGroup="pd"></asp:RegularExpressionValidator></td><td>&nbsp;</td></tr><tr><td 
                class="style16">Contact No. :</td><td class="style6"><asp:TextBox 
                    ID="txtContactNo" runat="server"></asp:TextBox>&nbsp;<span class="style13">*</span></td><td><asp:RegularExpressionValidator 
                    ID="RegularExpressionValidator2" runat="server" 
                    ControlToValidate="txtContactNo" ErrorMessage="Enter Proper Contact No" 
                    ForeColor="Red" ValidationExpression="^[789]\d{9}$" ValidationGroup="pd"></asp:RegularExpressionValidator></td><td>&nbsp;</td></tr><tr><td 
                class="style16">E- mail :</td><td class="style6"><asp:TextBox ID="txtEmail" 
                    runat="server" Height="21px" Width="217px"></asp:TextBox>&nbsp;<span 
                    class="style13">*</span></td><td><asp:RegularExpressionValidator 
                    ID="RegularExpressionValidator3" runat="server" ControlToValidate="txtEmail" 
                    ErrorMessage="Enter Proper Email ID" ForeColor="Red" 
                    ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" 
                    ValidationGroup="pd"></asp:RegularExpressionValidator></td><td>&nbsp;</td></tr><tr><td 
                class="style16">Blood Group :</td><td class="style6"><asp:TextBox 
                    ID="txtBloodGroup" runat="server"></asp:TextBox></td><td>&nbsp;</td><td>&nbsp;</td></tr><tr><td 
                class="style16">&nbsp;</td><td class="style6">&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td></tr><tr><td 
                class="style16">&#160;</td><td class="style6">&#160;</td><td>&#160;</td><td>&#160;</td></tr><tr><td 
                class="style16"><asp:Button ID="btnNext" runat="server" 
                CausesValidation="False" onclick="btnNext_Click" Text="Next" />
            </td>
            <td class="style6">
                &nbsp;</td><td>&#160;</td><td>&#160;</td></tr></table></ContentTemplate></asp:TabPanel>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <asp:TabPanel ID="TabPanel2" runat="server" HeaderText="TabPanel2"><HeaderTemplate>
                Educational Detail</HeaderTemplate><ContentTemplate><table 
                class="style1"><tr><td class="style16">&nbsp;</td><td class="style6">&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td></tr><tr><td 
                class="style16">Qualification :</td><td class="style6"><asp:TextBox 
                    ID="txtQualification" runat="server"></asp:TextBox>&nbsp;<span class="style13">*</span></td><td><asp:RequiredFieldValidator 
                    ID="RequiredFieldValidator21" runat="server" 
                    ControlToValidate="txtQualification" ErrorMessage="Enter proper qualification" 
                    ForeColor="Red" ValidationGroup="ed"></asp:RequiredFieldValidator></td><td>&nbsp;</td></tr><tr><td 
                class="style16">Affected University :</td><td class="style6"><asp:TextBox 
                    ID="txtAffiliatedUniversity" runat="server"></asp:TextBox></td><td>&nbsp;</td><td>&nbsp;</td></tr><tr><td 
                class="style16">Skill Sets :</td><td class="style6"><asp:TextBox 
                    ID="txtSkillsSet" runat="server" TextMode="MultiLine"></asp:TextBox></td><td>&nbsp;</td><td>&nbsp;</td></tr><tr><td 
                class="style16">1st Highest Degree :</td><td class="style6"><asp:DropDownList 
                    ID="ddFirstDegree" runat="server"></asp:DropDownList></td><td>&nbsp;</td><td>&nbsp;</td></tr><tr><td 
                class="style16">2st Highest Degree :</td><td class="style6"><asp:DropDownList 
                    ID="ddSecongDegree" runat="server"></asp:DropDownList></td><td>&nbsp;</td><td>&nbsp;</td></tr><tr><td 
                class="style16">3st Highest Degree :</td><td class="style6"><asp:DropDownList 
                    ID="ddThirdDegree" runat="server"></asp:DropDownList></td><td>&nbsp;</td><td>&nbsp;</td></tr><tr><td 
                class="style16">4st Highest Degree :</td><td class="style6"><asp:DropDownList 
                    ID="ddFourthDegree" runat="server"></asp:DropDownList></td><td>&nbsp;</td><td>&nbsp;</td></tr><tr><td 
                class="style16">&#160;</td><td class="style6">&#160;</td><td>&#160;</td><td>&#160;</td></tr><tr><td 
                class="style16"><asp:Button ID="Button1" runat="server" 
                onclick="Button1_Click" Text="Next" />
            </td>
            <td class="style6">
                <asp:Button ID="Button2" runat="server" onclick="Button2_Click" 
                    Text="Previous" />
            </td>
            <td>
                &nbsp;</td><td>&#160;</td></tr></table></ContentTemplate></asp:TabPanel>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <asp:TabPanel ID="TabPanel3" runat="server" HeaderText="TabPanel3"><HeaderTemplate>
                Professional Detail</HeaderTemplate><ContentTemplate><table 
                class="style1"><tr><td class="style16">&nbsp;</td><td class="style6">&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td></tr><tr><td 
                class="style16">Department :</td><td class="style6"><asp:DropDownList 
                    ID="ddDepartment" runat="server" AutoPostBack="True" 
                    OnSelectedIndexChanged="ddDepartment_SelectedIndexChanged"></asp:DropDownList>&nbsp;<span 
                    class="style13">*</span></td><td><asp:RequiredFieldValidator 
                    ID="RequiredFieldValidator10" runat="server" ControlToValidate="ddDepartment" 
                    ErrorMessage="Select Proper Department" ForeColor="Red" 
                    ValidationGroup="pr"></asp:RequiredFieldValidator></td><td>&nbsp;</td></tr><tr><td 
                class="style16">Designation :</td><td class="style6"><asp:DropDownList 
                    ID="ddDesignation" runat="server" 
                    ></asp:DropDownList>&nbsp;<span 
                    class="style13">*</span></td><td><asp:RequiredFieldValidator 
                    ID="RequiredFieldValidator11" runat="server" ControlToValidate="ddDesignation" 
                    ErrorMessage="Select Proper Designation" ForeColor="Red" 
                    ValidationGroup="pr"></asp:RequiredFieldValidator></td><td>&nbsp;</td></tr><tr><td 
                class="style16">Job Type :</td><td class="style6"><asp:DropDownList 
                    ID="ddJobType" runat="server"></asp:DropDownList>&nbsp;<span class="style13">*</span></td><td><asp:RequiredFieldValidator 
                    ID="RequiredFieldValidator12" runat="server" ControlToValidate="ddJobType" 
                    ErrorMessage="Select Proper Job Type" ForeColor="Red" ValidationGroup="pr"></asp:RequiredFieldValidator></td><td>&nbsp;</td></tr><tr><td 
                class="style16">Previous Company Name :</td><td class="style6"><asp:TextBox 
                    ID="txtPreviousCompany" runat="server" Height="20px" Width="228px"></asp:TextBox></td><td>&nbsp;</td><td>&nbsp;</td></tr><tr><td 
                class="style16">Previous Department :</td><td class="style6"><asp:DropDownList 
                    ID="ddPreviousDepartment" runat="server" AutoPostBack="True" 
                    onselectedindexchanged="ddPreviousDepartment_SelectedIndexChanged"></asp:DropDownList></td><td>&nbsp;</td><td>&nbsp;</td></tr><tr><td 
                class="style16">Previous Designation</td><td class="style6"><asp:DropDownList 
                    ID="ddPreviousDesignation" runat="server"></asp:DropDownList></td><td>&nbsp;</td><td>&nbsp;</td></tr><tr><td 
                class="style16">Date Of Joining :</td><td class="style6"><asp:TextBox 
                    ID="txtDOJ" runat="server"></asp:TextBox><asp:CalendarExtender 
                    ID="txtDOJ_CalendarExtender" runat="server" Enabled="True" 
                    TargetControlID="txtDOJ"></asp:CalendarExtender>&nbsp;<span class="style13">*</span></td><td><asp:RequiredFieldValidator 
                    ID="RequiredFieldValidator13" runat="server" ControlToValidate="txtDOJ" 
                    ErrorMessage="Enter Proper Date Of Joining" ForeColor="Red" 
                    ValidationGroup="pr"></asp:RequiredFieldValidator><asp:ScriptManager 
                    ID="ScriptManager1" runat="server"></asp:ScriptManager></td><td>&nbsp;</td></tr><tr><td 
                class="style16">Date Of Leaving :</td><td class="style6"><asp:TextBox 
                    ID="txtDOL" runat="server"></asp:TextBox><asp:CalendarExtender 
                    ID="txtDOL_CalendarExtender" runat="server" Enabled="True" 
                    TargetControlID="txtDOL"></asp:CalendarExtender></td><td>&nbsp;</td><td>&nbsp;</td></tr><tr><td 
                class="style16">Last Salary :</td><td class="style6"><asp:TextBox 
                    ID="txtLastSalary" runat="server"></asp:TextBox></td><td>&nbsp;</td><td>&nbsp;</td></tr><tr><td 
                class="style16">Experience :</td><td class="style6"><asp:TextBox 
                    ID="txtExperience" runat="server"></asp:TextBox></td><td>&nbsp;</td><td>&nbsp;</td></tr><tr><td 
                class="style16">Previous Company Contact No :</td><td class="style6"><asp:TextBox 
                    ID="txtPreComContact" runat="server"></asp:TextBox></td><td>&nbsp;</td><td>&nbsp;</td></tr><tr><td 
                class="style16">Previous Company Email Id :</td><td class="style6"><asp:TextBox 
                    ID="txtPreCompanyEmail" runat="server"></asp:TextBox></td><td>&nbsp;</td><td>&nbsp;</td></tr><tr><td 
                class="style16">&nbsp;</td><td class="style6">&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td></tr><tr><td 
                class="style16"><asp:Button ID="Button3" runat="server" 
                onclick="Button3_Click" Text="Next" />
            </td>
            <td class="style6">
                <asp:Button ID="Button4" runat="server" onclick="Button4_Click" 
                    Text="Previous" />
            </td>
            <td>
                &nbsp;</td><td>&#160;</td></tr></table></ContentTemplate></asp:TabPanel>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <asp:TabPanel ID="TabPanel4" runat="server" HeaderText="TabPanel4"><HeaderTemplate>
                Emergenct Contact Detail</HeaderTemplate><ContentTemplate><table 
                class="style1"><tr><td class="style16">&nbsp;</td><td class="style6">&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td></tr><tr><td 
                class="style16">Person Name :</td><td class="style6"><asp:TextBox 
                    ID="txtE_PersonName" runat="server"></asp:TextBox>&nbsp;<span class="style13">*</span></td><td><asp:RequiredFieldValidator 
                    ID="RequiredFieldValidator14" runat="server" 
                    ControlToValidate="txtE_PersonName" ErrorMessage="Enter Proper Person Name" 
                    ForeColor="Red" ValidationGroup="ec"></asp:RequiredFieldValidator></td><td>&nbsp;</td></tr><tr><td 
                class="style16">Relationship :</td><td class="style6"><asp:TextBox 
                    ID="txtE_Relationship" runat="server"></asp:TextBox></td><td>&nbsp;</td><td>&nbsp;</td></tr><tr><td 
                class="style16">Address :</td><td class="style6"><asp:TextBox ID="txtE_Address" 
                    runat="server"></asp:TextBox>&nbsp;<span class="style13">*</span></td><td><asp:RequiredFieldValidator 
                    ID="RequiredFieldValidator22" runat="server" ControlToValidate="txtE_Address" 
                    ErrorMessage="Enter Proper Address" ForeColor="Red" ValidationGroup="ec"></asp:RequiredFieldValidator></td><td>&nbsp;</td></tr><tr><td 
                class="style18">Contact No :</td><td class="style7"><asp:TextBox 
                    ID="txtE_ConatctNo" runat="server"></asp:TextBox>&nbsp;<span class="style13">*</span></td><td 
                class="style3"><asp:RequiredFieldValidator ID="RequiredFieldValidator15" 
                    runat="server" ControlToValidate="txtE_ConatctNo" 
                    ErrorMessage="Enter Proper Contact No" ForeColor="Red" 
                    ValidationGroup="ec"></asp:RequiredFieldValidator></td><td 
                class="style3">&nbsp;</td></tr><tr><td class="style18">&#160;</td><td class="style7">&#160;</td><td 
                    class="style3">&#160;</td><td class="style3">&#160;</td></tr><tr><td 
                class="style18"><asp:Button ID="Button5" runat="server" 
                onclick="Button5_Click" Text="Next" />
            </td>
            <td class="style7">
                &nbsp;</td><td class="style3"><asp:Button ID="Button6" runat="server" 
                    onclick="Button6_Click" Text="Previous" />
            </td>
            <td class="style3">
                &nbsp;</td></tr></table></ContentTemplate></asp:TabPanel>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <asp:TabPanel ID="TabPanel5" runat="server" HeaderText="TabPanel5"><HeaderTemplate>
                Authentication Detail</HeaderTemplate><ContentTemplate><table 
                class="style1"><tr><td class="style18">&nbsp;</td><td class="style7">&nbsp;</td><td 
                    class="style3">&nbsp;</td><td class="style3">&nbsp;</td></tr><tr><td 
                class="style18">User Name :</td><td class="style7"><asp:TextBox 
                    ID="txtUserName" runat="server"></asp:TextBox>&nbsp;<span class="style13">*</span></td><td 
                class="style3"><asp:RequiredFieldValidator ID="RequiredFieldValidator16" 
                    runat="server" ControlToValidate="txtUserName" 
                    ErrorMessage="Enter Proper User Name" ForeColor="Red" ValidationGroup="ad"></asp:RequiredFieldValidator></td><td 
                class="style3">&nbsp;</td></tr><tr><td class="style18">Password :</td><td 
                    class="style7"><asp:TextBox ID="txtPassword" runat="server" 
                    TextMode="Password"></asp:TextBox>&nbsp;<span class="style13">*</span></td><td 
                    class="style3"><asp:RequiredFieldValidator ID="RequiredFieldValidator17" 
                        runat="server" ControlToValidate="txtPassword" 
                        ErrorMessage="Enter Proper Password" ForeColor="Red" ValidationGroup="ad"></asp:RequiredFieldValidator></td><td 
                    class="style3">&nbsp;</td></tr><tr><td class="style18">Confirm Password :</td><td 
                    class="style7"><asp:TextBox ID="txtConfirmPassword" runat="server" 
                    TextMode="Password"></asp:TextBox>&nbsp;<span class="style13">*</span></td><td 
                    class="style3"><asp:CompareValidator ID="CompareValidator1" runat="server" 
                        ControlToCompare="txtPassword" ControlToValidate="txtConfirmPassword" 
                        ErrorMessage="Password Does Not Matched" ForeColor="Red" 
                        ValidationGroup="ad"></asp:CompareValidator></td><td 
                    class="style3">&nbsp;</td></tr><tr><td class="style18">Security Question :</td><td 
                    class="style7"><asp:DropDownList ID="ddSecurityQuestion" runat="server" 
                    Height="31px" Width="252px"></asp:DropDownList>&nbsp;<span class="style13">*</span></td><td 
                    class="style3"><asp:RequiredFieldValidator ID="RequiredFieldValidator18" 
                        runat="server" ControlToValidate="ddSecurityQuestion" 
                        ErrorMessage="Select Security Question" ForeColor="Red" 
                        ValidationGroup="ad"></asp:RequiredFieldValidator></td><td 
                    class="style3">&nbsp;</td></tr><tr><td class="style18">Security Answer :</td><td 
                    class="style7"><asp:TextBox ID="txtSecurityAnswer" runat="server" 
                    TextMode="MultiLine" Width="258px"></asp:TextBox>&nbsp;<span class="style13">*</span></td><td 
                    class="style3"><asp:RequiredFieldValidator ID="RequiredFieldValidator19" 
                        runat="server" ControlToValidate="txtSecurityAnswer" 
                        ErrorMessage="Enter Proper Answer" ForeColor="Red" ValidationGroup="ad"></asp:RequiredFieldValidator></td><td 
                    class="style3">&nbsp;</td></tr><tr><td class="style18">Passport No :</td><td 
                    class="style7"><asp:TextBox ID="txtPassportNo" runat="server"></asp:TextBox></td><td 
                    class="style3">&nbsp;</td><td class="style3">&nbsp;</td></tr><tr><td 
                class="style18">Bank Account No :</td><td class="style7"><asp:TextBox 
                    ID="txtBankAccountNo" runat="server"></asp:TextBox></td><td 
                class="style3">&nbsp;</td><td class="style3">&nbsp;</td></tr><tr><td class="style18">P.F. No :</td><td 
                class="style7"><asp:TextBox ID="txtPFNo" runat="server"></asp:TextBox></td><td 
                class="style3">&nbsp;</td><td class="style3">&nbsp;</td></tr><tr><td 
                class="style18">&#160;</td><td class="style7">&#160;</td><td class="style3">&#160;</td><td 
                class="style3">&#160;</td></tr><tr><td class="style18"><asp:Button ID="Button7" 
                    runat="server" onclick="Button7_Click" Text="Next" />
                </td>
                <td class="style7">
                    &nbsp;</td><td class="style3"><asp:Button ID="Button8" runat="server" 
                        onclick="Button8_Click" Text="Previous" />
                </td>
                <td class="style3">
                    &nbsp;</td></tr></table></ContentTemplate></asp:TabPanel>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <asp:TabPanel ID="TabPanel6" runat="server" HeaderText="TabPanel6"><HeaderTemplate>
                Document Upload</HeaderTemplate><ContentTemplate><table 
                class="style1"><tr><td class="style18">Certificate :</td><td class="style7"><asp:FileUpload 
                    ID="fuCertificate" runat="server"></asp:FileUpload>&nbsp;<span class="style13">*</span></td><td 
                    class="style7"><asp:Label ID="Label8" runat="server"></asp:Label></td><td 
                    class="style3"><asp:RequiredFieldValidator ID="RequiredFieldValidator7" 
                        runat="server" ControlToValidate="fuCertificate" 
                        ErrorMessage="Must upload Certificate" ForeColor="Red" 
                        ValidationGroup="du"></asp:RequiredFieldValidator></td><td 
                    class="style3">&nbsp;</td></tr><tr><td class="style18">Document :</td><td 
                    class="style7"><asp:FileUpload ID="fuDocument" runat="server"></asp:FileUpload><span 
                    class="style13">&nbsp;*</span></td><td class="style7"><asp:Label ID="Label9" 
                        runat="server"></asp:Label></td><td class="style3"><asp:RequiredFieldValidator 
                        ID="RequiredFieldValidator8" runat="server" ControlToValidate="fuDocument" 
                        ErrorMessage="Must upload document" ForeColor="Red" ValidationGroup="du"></asp:RequiredFieldValidator></td><td 
                    class="style3">&nbsp;</td></tr><tr><td class="style18">Photo :</td><td 
                    class="style7"><asp:FileUpload ID="fuPhoto" runat="server"></asp:FileUpload>&nbsp;<span 
                    class="style13">*</span></td><td class="style7"><asp:Label ID="Label10" 
                        runat="server"></asp:Label></td><td class="style3"><asp:RequiredFieldValidator 
                        ID="RequiredFieldValidator9" runat="server" ControlToValidate="fuPhoto" 
                        ErrorMessage="Must upload photo" ForeColor="Red" ValidationGroup="du"></asp:RequiredFieldValidator></td><td 
                    class="style3">&nbsp;</td></tr><tr><td class="style18">&nbsp;</td><td class="style7" 
                    colspan="2">&nbsp;</td><td class="style3">&nbsp;</td><td class="style3">&nbsp;</td></tr><tr><td 
                class="style18">&nbsp;</td><td class="style7" colspan="2">&nbsp;</td><td 
                class="style3"><asp:Label ID="Label7" runat="server" ForeColor="Red"></asp:Label></td><td 
                class="style3">&nbsp;</td></tr><tr><td class="style16"><asp:Button ID="btnSubmit" 
                    runat="server" OnClick="btnSubmit_Click" Text="Submit"></asp:Button></td><td 
                    class="style6" colspan="2"><asp:Button ID="btnUpdate" runat="server" 
                        OnClick="btnUpdate_Click" Text="Update"></asp:Button></td><td><asp:Button 
                        ID="Button9" runat="server" onclick="Button9_Click" Text="Previous" />
                </td><td>&nbsp;</td></tr><tr><td 
                class="style16">&nbsp;</td><td class="style6" colspan="2">&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td></tr><tr><td 
                class="style16" colspan="5"><asp:GridView ID="GridView1" runat="server" 
                OnRowCommand="GridView1_RowCommand" 
                onselectedindexchanged="GridView1_SelectedIndexChanged"><Columns><asp:TemplateField 
                        HeaderText="Edit"><ItemTemplate><asp:LinkButton ID="LinkButton1" runat="server" 
                            CausesValidation="false" CommandArgument='<%#Eval("Employee_ID") %>' 
                            CommandName="Editt">Edit</asp:LinkButton></ItemTemplate></asp:TemplateField><asp:TemplateField 
                        HeaderText="Delete"><ItemTemplate><asp:LinkButton ID="LinkButton2" 
                            runat="server" CausesValidation="false" 
                            CommandArgument='<%#Eval("Employee_ID") %>' CommandName="Deletee">Delete</asp:LinkButton></ItemTemplate></asp:TemplateField></Columns></asp:GridView></td></tr></table></ContentTemplate></asp:TabPanel>
            
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </asp:TabContainer>
    
    </div>
    </form>
</body>
</html>