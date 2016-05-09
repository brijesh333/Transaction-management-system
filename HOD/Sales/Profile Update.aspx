<%@ Page Title="" Language="C#" MasterPageFile="~/HOD/Sales/Sales_HOD.master" AutoEventWireup="true" CodeFile="Profile Update.aspx.cs" Inherits="HR_profile_update1" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>

<%--<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
</asp:Content>
--%><asp:Content ID="Content2" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
    .style1
    {
        width: 100%;
        height: 510px;
    }

        .style16
        {
            width: 181px;
        }
        .style23
        {
            height: 40px;
            width: 141px;
        }
        .style17
        {
            height: 40px;
            width: 181px;
        }
        .style25
    {
        width: 141px;
    }
    .style26
    {
        width: 100%;
    }
        .style24
        {
            width: 246px;
            height: 34px;
        }
        .style19
        {
            width: 181px;
            height: 34px;
        }
        .style22
        {
            width: 246px;
            height: 23px;
        }
        .style20
        {
            width: 181px;
            height: 23px;
        }
        .style28
    {
        width: 246px;
    }
        .style18
        {
            height: 26px;
            width: 181px;
        }
        .style29
    {
        width: 107px;
    }
        .style30
        {
            width: 144px;
        }
        .style32
        {
            width: 34px;
        }
        .style33
        {
            height: 40px;
            width: 34px;
        }
        .style34
        {
            width: 38px;
        }
        .style36
        {
            width: 41px;
            height: 34px;
        }
        .style37
        {
            width: 41px;
            height: 23px;
        }
        .style38
        {
            width: 41px;
        }
        .style39
        {
            width: 35px;
        }
        .style40
        {
            width: 45px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:TabContainer ID="TabContainer1" runat="server" ActiveTabIndex="4" 
    Height="459px" Width="973px" ScrollBars="Both" VerticalStripWidth="150px">
    <asp:TabPanel ID="TabPanel1" runat="server" HeaderText="TabPanel1">
        <HeaderTemplate>
            Personal Detail
        </HeaderTemplate>
        <ContentTemplate>
            <table class="style1">
                <tr>
                    <td class="style32">
                        &nbsp;</td>
                    <td class="style25">
                        Full Name :</td>
                    <td class="style16">
                        <asp:Label ID="lblFullName" runat="server" Text="Label"></asp:Label>
                    </td>
                    <td class="style16">
                        &nbsp;</td>
                </tr>
                <tr>
                    <td class="style32">
                        &nbsp;</td>
                    <td class="style25">
                        Parmenant Address :</td>
                    <td class="style16">
                        <asp:TextBox ID="txtPAddress" runat="server" TextMode="MultiLine"></asp:TextBox>
                    </td>
                    <td class="style16">
                        &nbsp;</td>
                </tr>
                <tr>
                    <td class="style33">
                        &nbsp;</td>
                    <td class="style23">
                        Current Address :</td>
                    <td class="style17">
                        <asp:TextBox ID="txtCAddress" runat="server" TextMode="MultiLine"></asp:TextBox>
                    </td>
                    <td class="style17">
                        &nbsp;</td>
                </tr>
                <tr>
                    <td class="style32">
                        &nbsp;</td>
                    <td class="style25">
                        Date Of Birth :</td>
                    <td class="style16">
                        <asp:Label ID="lblDOB" runat="server" Text="Label"></asp:Label>
                    </td>
                    <td class="style16">
                        &nbsp;</td>
                </tr>
                <tr>
                    <td class="style32">
                        &nbsp;</td>
                    <td class="style25">
                        Gender :</td>
                    <td class="style16">
                        <asp:Label ID="lblGender" runat="server" Text="Label"></asp:Label>
                    </td>
                    <td class="style16">
                        &nbsp;</td>
                </tr>
                <tr>
                    <td class="style32">
                        &nbsp;</td>
                    <td class="style25">
                        Marital Status :</td>
                    <td class="style16">
                        <asp:RadioButtonList ID="rdMaritalStatus" runat="server" 
                            RepeatDirection="Horizontal">
                            <asp:ListItem>Married</asp:ListItem>
                            <asp:ListItem>Unmarried</asp:ListItem>
                        </asp:RadioButtonList>
                    </td>
                    <td class="style16">
                        &nbsp;</td>
                </tr>
                <tr>
                    <td class="style32">
                        &nbsp;</td>
                    <td class="style25">
                        Country :</td>
                    <td class="style16">
                        <asp:DropDownList ID="ddCountry" runat="server" AutoPostBack="True">
                        </asp:DropDownList>
                    </td>
                    <td class="style16">
                        &nbsp;</td>
                </tr>
                <tr>
                    <td class="style32">
                        &nbsp;</td>
                    <td class="style25">
                        State :</td>
                    <td class="style16">
                        <asp:DropDownList ID="ddState" runat="server" AutoPostBack="True">
                        </asp:DropDownList>
                    </td>
                    <td class="style16">
                        &nbsp;</td>
                </tr>
                <tr>
                    <td class="style32">
                        &nbsp;</td>
                    <td class="style25">
                        City :</td>
                    <td class="style16">
                        <asp:DropDownList ID="ddCity" runat="server">
                        </asp:DropDownList>
                    </td>
                    <td class="style16">
                        &nbsp;</td>
                </tr>
                <tr>
                    <td class="style32">
                        &nbsp;</td>
                    <td class="style25">
                        PinCode :</td>
                    <td class="style16">
                        <asp:TextBox ID="txtPinCode" runat="server"></asp:TextBox>
                    </td>
                    <td class="style16">
                        &nbsp;</td>
                </tr>
                <tr>
                    <td class="style32">
                        &nbsp;</td>
                    <td class="style25">
                        Contact No. :</td>
                    <td class="style16">
                        <asp:TextBox ID="txtContactNo" runat="server"></asp:TextBox>
                    </td>
                    <td class="style16">
                        &nbsp;</td>
                </tr>
                <tr>
                    <td class="style32">
                        &nbsp;</td>
                    <td class="style25">
                        E- mail :</td>
                    <td class="style16">
                        <asp:TextBox ID="txtEmailID" runat="server"></asp:TextBox>
                    </td>
                    <td class="style16">
                        &nbsp;</td>
                </tr>
                <tr>
                    <td class="style32">
                        &nbsp;</td>
                    <td class="style25">
                        Blood Group :</td>
                    <td class="style16">
                        <asp:Label ID="lblBloodGroup" runat="server" Text="Label"></asp:Label>
                    </td>
                    <td class="style16">
                        &nbsp;</td>
                </tr>
                <tr>
                    <td class="style32">
                        &nbsp;</td>
                    <td class="style25">
                        &nbsp;</td>
                    <td>
                        &nbsp;</td>
                    <td>
                        &nbsp;</td>
                </tr>
                <tr>
                    <td class="style32">
                        &nbsp;</td>
                    <td class="style25">
                        <asp:Button ID="btnNext" runat="server" OnClick="btnNext_Click" Text="Next" />
                    </td>
                    <td>
                        &nbsp;</td>
                    <td>
                        &nbsp;</td>
                </tr>
                <tr>
                    <td class="style32">
                        &nbsp;</td>
                    <td class="style25">
                        &nbsp;</td>
                    <td>
                        &nbsp;</td>
                    <td>
                        &nbsp;</td>
                </tr>
                <tr>
                    <td class="style32">
                        &nbsp;</td>
                    <td class="style25">
                        &nbsp;</td>
                    <td colspan="2">
                        &nbsp;</td>
                </tr>
                <tr>
                    <td class="style32">
                        &nbsp;</td>
                    <td class="style25">
                        &nbsp;</td>
                    <td colspan="2">
                        &nbsp;</td>
                </tr>
                <tr>
                    <td class="style32">
                        &nbsp;</td>
                    <td class="style25">
                        &nbsp;</td>
                    <td colspan="2">
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
            <table class="style26">
                <tr>
                    <td class="style34">
                        &nbsp;</td>
                    <td class="style30">
                        Qualification :</td>
                    <td class="style16">
                        <asp:Label ID="lblQualification" runat="server" Text="Label"></asp:Label>
                    </td>
                    <td class="style16">
                        &nbsp;</td>
                </tr>
                <tr>
                    <td class="style34">
                        &nbsp;</td>
                    <td class="style30">
                        Affected University :</td>
                    <td class="style16">
                        <asp:Label ID="lblAffectedUniversity" runat="server" Text="Label"></asp:Label>
                    </td>
                    <td class="style16">
                        &nbsp;</td>
                </tr>
                <tr>
                    <td class="style34">
                        &nbsp;</td>
                    <td class="style30">
                        Skill Sets :</td>
                    <td class="style16">
                        <asp:TextBox ID="txtSkillsSet" runat="server"></asp:TextBox>
                    </td>
                    <td class="style16">
                        &nbsp;</td>
                </tr>
                <tr>
                    <td class="style34">
                        &nbsp;</td>
                    <td class="style30">
                        1st Highest Degree :</td>
                    <td class="style16">
                        <asp:Label ID="lbl1Degree" runat="server" Text="Label"></asp:Label>
                    </td>
                    <td class="style16">
                        &nbsp;</td>
                </tr>
                <tr>
                    <td class="style34">
                        &nbsp;</td>
                    <td class="style30">
                        2st Highest Degree :</td>
                    <td class="style16">
                        <asp:Label ID="lbl2Degree" runat="server" Text="Label"></asp:Label>
                    </td>
                    <td class="style16">
                        &nbsp;</td>
                </tr>
                <tr>
                    <td class="style34">
                        &nbsp;</td>
                    <td class="style30">
                        3st Highest Degree :</td>
                    <td class="style16">
                        <asp:Label ID="lbl3Degree" runat="server" Text="Label"></asp:Label>
                    </td>
                    <td class="style16">
                        &nbsp;</td>
                </tr>
                <tr>
                    <td class="style34">
                        &nbsp;</td>
                    <td class="style30">
                        4st Highest Degree :</td>
                    <td class="style16">
                        <asp:Label ID="lbl4Degree" runat="server" Text="Label"></asp:Label>
                    </td>
                    <td class="style16">
                        &nbsp;</td>
                </tr>
                <tr>
                    <td class="style34">
                        &nbsp;</td>
                    <td class="style30">
                        &nbsp;</td>
                    <td>
                        &nbsp;</td>
                    <td>
                        &nbsp;</td>
                </tr>
                <tr>
                    <td class="style34">
                        &nbsp;</td>
                    <td class="style30">
                        <asp:Button ID="btnNext0" runat="server" onclick="btnNext0_Click" 
                            Text="Next" />
                    </td>
                    <td>
                        <asp:Button ID="btnPrevious" runat="server" onclick="btnPrevious_Click" 
                            Text="Previous" />
                    </td>
                    <td>
                        <asp:ScriptManager ID="ScriptManager1" runat="server">
                        </asp:ScriptManager>
                    </td>
                </tr>
            </table>
        </ContentTemplate>
    </asp:TabPanel>
    <asp:TabPanel ID="TabPanel3" runat="server" HeaderText="TabPanel3">
        <HeaderTemplate>
            Professional Detail
        </HeaderTemplate>
        <ContentTemplate>
            <table class="style26">
                <tr>
                    <td class="style38">
                        &nbsp;</td>
                    <td class="style28">
                        Department :</td>
                    <td class="style16">
                        <asp:Label ID="lblDepartment" runat="server" Text="Label"></asp:Label>
                    </td>
                    <td class="style16">
                        &nbsp;</td>
                </tr>
                <tr>
                    <td class="style38">
                        &nbsp;</td>
                    <td class="style28">
                        Designation :</td>
                    <td class="style16">
                        <asp:Label ID="lblDesignation" runat="server" Text="Label"></asp:Label>
                    </td>
                    <td class="style16">
                        &nbsp;</td>
                </tr>
                <tr>
                    <td class="style38">
                        &nbsp;</td>
                    <td class="style28">
                        Job Type :</td>
                    <td class="style16">
                        <asp:Label ID="lblJobType" runat="server" Text="Label"></asp:Label>
                    </td>
                    <td class="style16">
                        &nbsp;</td>
                </tr>
                <tr>
                    <td class="style38">
                        &nbsp;</td>
                    <td class="style28">
                        Previous Company Name :</td>
                    <td class="style16">
                        <asp:Label ID="lblPreviousComName" runat="server" Text="Label"></asp:Label>
                    </td>
                    <td class="style16">
                        &nbsp;</td>
                </tr>
                <tr>
                    <td class="style38">
                        &nbsp;</td>
                    <td class="style28">
                        Previous Department :</td>
                    <td class="style16">
                        <asp:Label ID="lblPreviousDept" runat="server" Text="Label"></asp:Label>
                    </td>
                    <td class="style16">
                        &nbsp;</td>
                </tr>
                <tr>
                    <td class="style38">
                        &nbsp;</td>
                    <td class="style28">
                        Previous Designation</td>
                    <td class="style16">
                        <asp:Label ID="lblPreviousDesignation" runat="server" Text="Label"></asp:Label>
                    </td>
                    <td class="style16">
                        &nbsp;</td>
                </tr>
                <tr>
                    <td class="style36">
                        &nbsp;</td>
                    <td class="style24">
                        Date Of Joining :</td>
                    <td class="style19">
                        <asp:Label ID="lblDOJ" runat="server" Text="Label"></asp:Label>
                    </td>
                    <td class="style19">
                        &nbsp;</td>
                </tr>
                <tr>
                    <td class="style38">
                        &nbsp;</td>
                    <td class="style28">
                        Date Of Leaving :</td>
                    <td class="style16">
                        <asp:Label ID="lblDOL" runat="server" Text="Label"></asp:Label>
                    </td>
                    <td class="style16">
                        &nbsp;</td>
                </tr>
                <tr>
                    <td class="style38">
                        &nbsp;</td>
                    <td class="style28">
                        Last Salary :</td>
                    <td class="style16">
                        <asp:Label ID="lblLastSalary" runat="server" Text="Label"></asp:Label>
                    </td>
                    <td class="style16">
                        &nbsp;</td>
                </tr>
                <tr>
                    <td class="style38">
                        &nbsp;</td>
                    <td class="style28">
                        Experience :</td>
                    <td class="style16">
                        <asp:Label ID="lblExperience" runat="server" Text="Label"></asp:Label>
                    </td>
                    <td class="style16">
                        &nbsp;</td>
                </tr>
                <tr>
                    <td class="style38">
                        &nbsp;</td>
                    <td class="style28">
                        Previous Company Contact No :</td>
                    <td class="style16">
                        <asp:Label ID="lblPreComContact" runat="server" Text="Label"></asp:Label>
                    </td>
                    <td class="style16">
                        &nbsp;</td>
                </tr>
                <tr>
                    <td class="style37">
                        &nbsp;</td>
                    <td class="style22">
                        Previous Company Email Id :</td>
                    <td class="style20">
                        <asp:Label ID="lblPreComEmailID" runat="server" Text="Label"></asp:Label>
                    </td>
                    <td class="style20">
                        &nbsp;</td>
                </tr>
                <tr>
                    <td class="style38">
                        &nbsp;</td>
                    <td class="style28">
                        &nbsp;</td>
                    <td colspan="2">
                        &nbsp;</td>
                </tr>
                <tr>
                    <td class="style38">
                        &nbsp;</td>
                    <td class="style28">
                        <asp:Button ID="btnNext1" runat="server" onclick="btnNext1_Click" 
                            Text="Next" />
                    </td>
                    <td colspan="2">
                        <asp:Button ID="btnPrevious0" runat="server" onclick="btnPrevious0_Click" 
                            Text="Previous" />
                    </td>
                </tr>
            </table>
        </ContentTemplate>
    </asp:TabPanel>
    <asp:TabPanel ID="TabPanel4" runat="server" HeaderText="TabPanel4">
        <HeaderTemplate>
           Emargency Contact Detail
        </HeaderTemplate>
        <ContentTemplate>
            <table class="style26">
                <tr>
                    <td class="style39">
                        &nbsp;</td>
                    <td class="style29">
                        Person Name :</td>
                    <td class="style16">
                        <asp:TextBox ID="txtE_PersonaName" runat="server"></asp:TextBox>
                    </td>
                    <td class="style16">
                        &nbsp;</td>
                </tr>
                <tr>
                    <td class="style39">
                        &nbsp;</td>
                    <td class="style29">
                        Relationship :</td>
                    <td class="style16">
                        <asp:TextBox ID="txtE_Relation" runat="server"></asp:TextBox>
                    </td>
                    <td class="style16">
                        &nbsp;</td>
                </tr>
                <tr>
                    <td class="style39">
                        &nbsp;</td>
                    <td class="style29">
                        Address :</td>
                    <td class="style16">
                        <asp:TextBox ID="txtE_Address" runat="server"></asp:TextBox>
                    </td>
                    <td class="style16">
                        &nbsp;</td>
                </tr>
                <tr>
                    <td class="style39">
                        &nbsp;</td>
                    <td class="style29">
                        Contact No :</td>
                    <td class="style18">
                        <asp:TextBox ID="txtE_ContactNo" runat="server"></asp:TextBox>
                    </td>
                    <td class="style18">
                        &nbsp;</td>
                </tr>
                <tr>
                    <td class="style39">
                        &nbsp;</td>
                    <td class="style29">
                        &nbsp;</td>
                    <td>
                        &nbsp;</td>
                    <td>
                        &nbsp;</td>
                </tr>
                <tr>
                    <td class="style39">
                        &nbsp;</td>
                    <td class="style29">
                        <asp:Button ID="btnPrevious3" runat="server" OnClick="btnPrevious1_Click" 
                            Text="Previous" />
                    </td>
                    <td>
                        <asp:Button ID="btnNext3" runat="server" OnClick="btnNext2_Click" Text="Next" />
                    </td>
                    <td>
                        &nbsp;</td>
                </tr>
            </table>
        </ContentTemplate>
    </asp:TabPanel>
    <asp:TabPanel ID="TabPanel5" runat="server" HeaderText="TabPanel5">
        <HeaderTemplate>
            Authentication Detail
        </HeaderTemplate>
        <ContentTemplate>
            <table class="style26">
                <tr>
                    <td class="style40">
                        &nbsp;</td>
                    <td class="style25" colspan="2">
                        User Name :</td>
                    <td class="style18">
                        <asp:Label ID="lblUserName" runat="server" Text="Label"></asp:Label>
                    </td>
                    <td class="style18">
                        &nbsp;</td>
                </tr>
                <tr>
                    <td class="style40">
                        &nbsp;</td>
                    <td class="style25" colspan="2">
                        Password :</td>
                    <td class="style18">
                        <asp:TextBox ID="txtPassword" runat="server"></asp:TextBox>
                    </td>
                    <td class="style18">
                        &nbsp;</td>
                </tr>
                <tr>
                    <td class="style40">
                        &nbsp;</td>
                    <td class="style25" colspan="2">
                        Confirm Password :</td>
                    <td class="style18">
                        <asp:TextBox ID="txtConfirmPassword" runat="server"></asp:TextBox>
                    </td>
                    <td class="style18">
                        &nbsp;</td>
                </tr>
                <tr>
                    <td class="style40">
                        &nbsp;</td>
                    <td class="style25" colspan="2">
                        Security Question :</td>
                    <td class="style18">
                        <asp:DropDownList ID="ddSecurityQuestion" runat="server" Height="31px" 
                            Width="252px">
                        </asp:DropDownList>
                    </td>
                    <td class="style18">
                        &nbsp;</td>
                </tr>
                <tr>
                    <td class="style40">
                        &nbsp;</td>
                    <td class="style25" colspan="2">
                        Security Answer :</td>
                    <td class="style18">
                        <asp:TextBox ID="txtSecurity" runat="server"></asp:TextBox>
                    </td>
                    <td class="style18">
                        &nbsp;</td>
                </tr>
                <tr>
                    <td class="style40">
                        &nbsp;</td>
                    <td class="style25" colspan="2">
                        Passport No :</td>
                    <td class="style18">
                        <asp:Label ID="lblPassportNo" runat="server" Text="Label"></asp:Label>
                    </td>
                    <td class="style18">
                        &nbsp;</td>
                </tr>
                <tr>
                    <td class="style40">
                        &nbsp;</td>
                    <td class="style25" colspan="2">
                        Bank Account No :</td>
                    <td class="style18">
                        <asp:Label ID="lblBankAccNo" runat="server" Text="Label"></asp:Label>
                    </td>
                    <td class="style18">
                        &nbsp;</td>
                </tr>
                <tr>
                    <td class="style40">
                        &nbsp;</td>
                    <td class="style25" colspan="2">
                        P.F. No :</td>
                    <td class="style18">
                        <asp:Label ID="lblPFNo" runat="server" Text="Label"></asp:Label>
                    </td>
                    <td class="style18">
                        &nbsp;</td>
                </tr>
                <tr>
                    <td class="style40">
                        &nbsp;</td>
                    <td colspan="2">
                        &nbsp;</td>
                    <td>
                        &nbsp;</td>
                    <td>
                        &nbsp;</td>
                </tr>
                <tr>
                    <td class="style40">
                        &nbsp;</td>
                    <td class="style25">
                        <asp:Button ID="btnPrevious2" runat="server" onclick="btnPrevious2_Click" 
                            Text="Previous" />
                    </td>
                    <td class="style25">
                        <asp:Button ID="btnUpdate0" runat="server" onclick="btnUpdate0_Click" 
                            Text="Update" />
                    </td>
                    <td class="style18">
                        <asp:Button ID="Reset" runat="server" Text="Reset" />
                    </td>
                    <td class="style18">
                        &nbsp;</td>
                </tr>
            </table>
        </ContentTemplate>
    </asp:TabPanel>
</asp:TabContainer>
</asp:Content>

