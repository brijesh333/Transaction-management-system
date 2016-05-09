<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Vendor_Registration.aspx.cs" Inherits="Vendor_Registration" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<script runat="server">

   
</script>
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
    <style type="text/css">
        .style1
        {
            width: 100%;
        }
        .style2
        {
            font-size: large;
            text-decoration: underline;
        }
        .style7
        {
        }
        .style11
        {
            color: #FF3300;
        }
        .style12
        {
            width: 293px;
        }
        .style14
        {
            width: 571px;
        }
        .style15
        {
            font-size: large;
            height: 24px;
        }
        .style16
        {
            font-size: large;
        }
        .style17
        {
            height: 24px;
        }
        .style18
        {
            height: 24px;
        }
        .style19
        {
            width: 571px;
            height: 24px;
        }
        .style20
        {
            width: 293px;
            height: 26px;
        }
        .style21
        {
            height: 26px;
        }
        .style22
        {
            width: 571px;
            height: 26px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server" enctype="multipart/form-data">
    <div>
    
        <br />
        <table class="style1">
            <tr>
                <td 
                    style="text-align: center; font-size: x-large; font-weight: 700;">
                    VENDOR REGISTRATION </td>
            </tr>
            <tr>
                <td class="style2">
                    <asp:ScriptManager ID="ScriptManager1" runat="server">
                    </asp:ScriptManager>
                </td>
            </tr>
            <tr>
                <td class="style15">
                    <asp:TabContainer ID="TabContainer1" runat="server" ActiveTabIndex="3" 
                        Width="1254px">
                        <asp:TabPanel runat="server" HeaderText="TabPanel1" ID="TabPanel1">
                            <HeaderTemplate>
                                Basic Detail
                            </HeaderTemplate>
                            <ContentTemplate>
                                <table class="style1">
                                    <tr>
                                        <td class="style12">
                                            Company Name:</td>
                                        <td class="style7">
                                            <asp:TextBox ID="txtCompanyName" runat="server"></asp:TextBox>
                                            <span class="style11">*</span></td>
                                        <td class="style14">
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator18" runat="server" 
                                                ControlToValidate="txtCompanyName" ErrorMessage="Enter Company Name" 
                                                ForeColor="Red"></asp:RequiredFieldValidator>
                                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                            <asp:RegularExpressionValidator ID="RegularExpressionValidator9" runat="server" 
                                                ControlToValidate="txtCompanyName" ErrorMessage="Enter Valid Name" 
                                                ForeColor="Red" ValidationExpression="^[a-z A-Z]{0,50}"></asp:RegularExpressionValidator>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="style12">
                                            Type Of Bussiness:</td>
                                        <td class="style7">
                                            <asp:DropDownList ID="ddTypeOfBusiness" runat="server">
                                            </asp:DropDownList>
                                            <span class="style11">*</span></td>
                                        <td class="style14">
                                            &nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator19" runat="server" 
                                                ControlToValidate="ddTypeOfBusiness" ErrorMessage="Select Type of  Business " 
                                                ForeColor="Red"></asp:RequiredFieldValidator>
                                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="style12">
                                            Main Company Head Office Address:</td>
                                        <td class="style7">
                                            <asp:TextBox ID="txtHeadAddress" runat="server" TextMode="MultiLine"></asp:TextBox>
                                            <span class="style11">*</span></td>
                                        <td class="style14">
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator20" runat="server" 
                                                ControlToValidate="txtHeadAddress" ErrorMessage="Enter Address" ForeColor="Red" 
                                                ValidationGroup="a"></asp:RequiredFieldValidator>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="style12">
                                            Head Office Contact No:</td>
                                        <td class="style7">
                                            <asp:TextBox ID="txtCHOfficeContact" runat="server"></asp:TextBox>
                                            <span class="style11">*</span></td>
                                        <td class="style14">
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator21" runat="server" 
                                                ControlToValidate="txtCHOfficeContact" ErrorMessage="Enter Contact No." 
                                                ForeColor="Red" ValidationGroup="a"></asp:RequiredFieldValidator>
                                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="style12">
                                            Head Office E-mail Id:</td>
                                        <td class="style7">
                                            <asp:TextBox ID="txtCHOfficeEmail" runat="server"></asp:TextBox>
                                            <span class="style11">*</span></td>
                                        <td class="style14">
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator22" runat="server" 
                                                ControlToValidate="txtCHOfficeEmail" ErrorMessage="Enter emailID" 
                                                ForeColor="Red" ValidationGroup="a"></asp:RequiredFieldValidator>
                                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                            <asp:RegularExpressionValidator ID="RegularExpressionValidator10" 
                                                runat="server" ControlToValidate="txtCHOfficeEmail" 
                                                ErrorMessage="Enter valid emailID" ForeColor="Red" 
                                                ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" 
                                                ValidationGroup="a"></asp:RegularExpressionValidator>
                                            &nbsp;&nbsp;</td>
                                    </tr>
                                    <tr>
                                        <td class="style12">
                                            Head Office Web-Site:</td>
                                        <td class="style7">
                                            <asp:TextBox ID="txtCHOfficeWebsite" runat="server"></asp:TextBox>
                                        </td>
                                        <td class="style14">
                                            &nbsp;</td>
                                    </tr>
                                </table>
                            </ContentTemplate>
                        </asp:TabPanel>
                        <asp:TabPanel ID="TabPanel2" runat="server" HeaderText="TabPanel2">
                            <HeaderTemplate>
                                Contact Person Detail
                            </HeaderTemplate>
                            <ContentTemplate>
                                <table class="style1">
                                    <tr>
                                        <td class="style12">
                                            Concern Person Name:</td>
                                        <td class="style7">
                                            <asp:TextBox ID="txtCPersonName" runat="server"></asp:TextBox>
                                            <span class="style11">*</span></td>
                                        <td class="style14">
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator23" runat="server" 
                                                ControlToValidate="txtCPersonName" ErrorMessage="Enter Person Name" 
                                                ForeColor="Red" ValidationGroup="a"></asp:RequiredFieldValidator>
                                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                            <asp:RegularExpressionValidator ID="RegularExpressionValidator11" 
                                                runat="server" ControlToValidate="txtCPersonName" 
                                                ErrorMessage="Enter Valid Name" ForeColor="Red" 
                                                ValidationExpression="^[a-z A-Z]{0,50}" ValidationGroup="a"></asp:RegularExpressionValidator>
                                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="style12">
                                            Concern Person Department:</td>
                                        <td class="style7">
                                            <asp:DropDownList ID="ddCPersonDepartment" runat="server" AutoPostBack="True" 
                                                OnSelectedIndexChanged="ddCPersonDepartment_SelectedIndexChanged">
                                            </asp:DropDownList>
                                            <span class="style11">*</span></td>
                                        <td class="style14">
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator24" runat="server" 
                                                ControlToValidate="ddCPersonDepartment" ErrorMessage="Select Person Department" 
                                                ForeColor="Red" ValidationGroup="a"></asp:RequiredFieldValidator>
                                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="style12">
                                            Concern Person Designation:</td>
                                        <td class="style7">
                                            <asp:DropDownList ID="ddCPersonDesignation" runat="server">
                                            </asp:DropDownList>
                                            <span class="style11">*</span></td>
                                        <td class="style14">
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator25" runat="server" 
                                                ControlToValidate="ddCPersonDesignation" 
                                                ErrorMessage="Select Person Designation" ForeColor="Red" ValidationGroup="a"></asp:RequiredFieldValidator>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="style12">
                                            Concern Person E-mail Id:</td>
                                        <td class="style7">
                                            <asp:TextBox ID="txtCPersonEmail" runat="server"></asp:TextBox>
                                            <span class="style11">*</span></td>
                                        <td class="style14">
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator26" runat="server" 
                                                ControlToValidate="txtCPersonEmail" ErrorMessage="Enter Person EmailID" 
                                                ForeColor="Red" ValidationGroup="a"></asp:RequiredFieldValidator>
                                            &nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:RegularExpressionValidator ID="RegularExpressionValidator12" 
                                                runat="server" ControlToValidate="txtCPersonEmail" 
                                                ErrorMessage="Enter Valid EmailID" ForeColor="Red" 
                                                ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" 
                                                ValidationGroup="a"></asp:RegularExpressionValidator>
                                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="style12">
                                            Concern Person Mobile No:</td>
                                        <td class="style7">
                                            <asp:TextBox ID="txtCPersonMobile" runat="server"></asp:TextBox>
                                            <span class="style11">*</span></td>
                                        <td class="style14">
                                            &nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator27" runat="server" 
                                                ControlToValidate="txtCPersonMobile" ErrorMessage="Enter Mob. No" 
                                                ForeColor="Red" ValidationGroup="a"></asp:RequiredFieldValidator>
                                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;
                                            <asp:RegularExpressionValidator ID="RegularExpressionValidator13" 
                                                runat="server" ControlToValidate="txtCPersonMobile" 
                                                ErrorMessage="Enter Valid Mob. No" ForeColor="Red" 
                                                ValidationExpression="^[0-9]{10}"></asp:RegularExpressionValidator>
                                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="style12">
                                            Concern Person Contact No:</td>
                                        <td class="style7">
                                            <asp:TextBox ID="txtCPersonContact" runat="server"></asp:TextBox>
                                        </td>
                                        <td class="style14">
                                            &nbsp;</td>
                                    </tr>
                                    <tr>
                                        <td class="style12">
                                            Concern Person Address:</td>
                                        <td class="style7">
                                            <asp:TextBox ID="txtCPersonAddress" runat="server" TextMode="MultiLine"></asp:TextBox>
                                        </td>
                                        <td class="style14">
                                            &nbsp;</td>
                                    </tr>
                                </table>
                            </ContentTemplate>
                        </asp:TabPanel>
                        <asp:TabPanel ID="TabPanel3" runat="server" HeaderText="TabPanel3">
                            <HeaderTemplate>
                                Company Registration Detail
                            </HeaderTemplate>
                            <ContentTemplate>
                                <table class="style1">
                                    <tr>
                                        <td class="style12">
                                            Registration Number:</td>
                                        <td class="style7">
                                            <asp:TextBox ID="txtCRegistrationNo" runat="server"></asp:TextBox>
                                            <span class="style11">*</span></td>
                                        <td class="style14">
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator28" runat="server" 
                                                ControlToValidate="txtCRegistrationNo" ErrorMessage="Enter Registration No." 
                                                ForeColor="Red" ValidationGroup="a"></asp:RequiredFieldValidator>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="style12">
                                            VAT Number:</td>
                                        <td class="style7">
                                            <asp:TextBox ID="txtCVatNo" runat="server"></asp:TextBox>
                                        </td>
                                        <td class="style14">
                                            &nbsp;</td>
                                    </tr>
                                    <tr>
                                        <td class="style12">
                                            Service Tax Number:</td>
                                        <td class="style7">
                                            <asp:TextBox ID="txtCServiceTaxNo" runat="server"></asp:TextBox>
                                        </td>
                                        <td class="style14">
                                            &nbsp;</td>
                                    </tr>
                                    <tr>
                                        <td class="style12">
                                            Establish Year:</td>
                                        <td class="style7">
                                            <asp:TextBox ID="txtCEstablishYear" runat="server"></asp:TextBox>
                                        </td>
                                        <td class="style14">
                                            &nbsp;</td>
                                    </tr>
                                    <tr>
                                        <td class="style12">
                                            Type of Company:</td>
                                        <td class="style7">
                                            <asp:RadioButtonList ID="rbTypeOfCompany" runat="server" 
                                                RepeatDirection="Horizontal">
                                                <asp:ListItem>Private Ltd.</asp:ListItem>
                                                <asp:ListItem>Partnership</asp:ListItem>
                                                <asp:ListItem>Govt.</asp:ListItem>
                                            </asp:RadioButtonList>
                                            &nbsp;&nbsp;&nbsp;
                                        </td>
                                        <td class="style14">
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator32" runat="server" 
                                                ControlToValidate="rbTypeOfCompany" ErrorMessage="Select Proper Type" 
                                                ForeColor="Red"></asp:RequiredFieldValidator>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="style12">
                                            ISO Certified:</td>
                                        <td class="style7">
                                            <asp:RadioButtonList ID="rbISO" runat="server" RepeatDirection="Horizontal">
                                                <asp:ListItem>Yes</asp:ListItem>
                                                <asp:ListItem>No</asp:ListItem>
                                            </asp:RadioButtonList>
                                        </td>
                                        <td class="style14">
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator33" runat="server" 
                                                ControlToValidate="rbISO" ErrorMessage="Select proper type" ForeColor="Red"></asp:RequiredFieldValidator>
                                        </td>
                                    </tr>
                                </table>
                            </ContentTemplate>
                        </asp:TabPanel>
                        <asp:TabPanel ID="TabPanel4" runat="server" HeaderText="TabPanel4">
                            <HeaderTemplate>
                                Bank Detail
                            </HeaderTemplate>
                            <ContentTemplate>
                                <table class="style1">
                                    <tr>
                                        <td class="style12">
                                            Bank Name:</td>
                                        <td class="style7">
                                            <asp:TextBox ID="txtCBankName1" runat="server"></asp:TextBox>
                                            <span class="style11">*</span></td>
                                        <td class="style14">
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator29" runat="server" 
                                                ControlToValidate="txtCBankName1" ErrorMessage="Enter Bank Name" 
                                                ForeColor="Red" ValidationGroup="a"></asp:RequiredFieldValidator>
                                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                            <asp:RegularExpressionValidator ID="RegularExpressionValidator14" 
                                                runat="server" ControlToValidate="txtCBankName1" 
                                                ErrorMessage="Enter valid name" ForeColor="Red" 
                                                ValidationExpression="^[a-z A-Z]{0,50}" ValidationGroup="a"></asp:RegularExpressionValidator>
                                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="style12">
                                            Branch Name:</td>
                                        <td class="style7">
                                            <asp:TextBox ID="txtCBranchName1" runat="server"></asp:TextBox>
                                            <span class="style11">*</span></td>
                                        <td class="style14">
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator30" runat="server" 
                                                ControlToValidate="txtCBranchName1" ErrorMessage="Enter Branch Name" 
                                                ForeColor="Red" ValidationGroup="a"></asp:RequiredFieldValidator>
                                            &nbsp;&nbsp;&nbsp;&nbsp;<asp:RegularExpressionValidator ID="RegularExpressionValidator15" 
                                                runat="server" ControlToValidate="txtCBranchName1" 
                                                ErrorMessage="Enter branch name" ForeColor="Red" 
                                                ValidationExpression="^[a-z A-Z]{0,50}" ValidationGroup="a"></asp:RegularExpressionValidator>
                                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="style12">
                                            Branch Address:</td>
                                        <td class="style7">
                                            <asp:TextBox ID="txtBranchAddress1" runat="server" TextMode="MultiLine"></asp:TextBox>
                                        </td>
                                        <td class="style14">
                                            &nbsp;</td>
                                    </tr>
                                    <tr>
                                        <td class="style12">
                                            Bank Account No:</td>
                                        <td class="style7">
                                            <asp:TextBox ID="txtAccountNo1" runat="server"></asp:TextBox>
                                            <span class="style11">*</span></td>
                                        <td class="style14">
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator31" runat="server" 
                                                ControlToValidate="txtAccountNo1" ErrorMessage="Enter Bank Account No." 
                                                ForeColor="Red" ValidationGroup="a"></asp:RequiredFieldValidator>
                                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="style17">
                                        </td>
                                        <td class="style18">
                                        </td>
                                        <td class="style19">
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="style17">
                                            <asp:Button ID="btnAddAnother" runat="server" onclick="btnAddAnother_Click" 
                                                Text="Add Another Detail" />
                                        </td>
                                        <td class="style18">
                                            &nbsp;</td>
                                        <td class="style19">
                                            &nbsp;</td>
                                    </tr>
                                    <tr>
                                        <td class="style17">
                                        </td>
                                        <td class="style17">
                                        </td>
                                        <td class="style19">
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="style17" colspan="3">
                                            <asp:Panel ID="Panel1" runat="server" Visible="False">
                                                <table class="style1">
                                                    <tr>
                                                        <td class="style12">
                                                            Bank Name:</td>
                                                        <td class="style7">
                                                            <asp:TextBox ID="txtCBankName2" runat="server"></asp:TextBox>
                                                        </td>
                                                        <td class="style14">
                                                            &nbsp;</td>
                                                    </tr>
                                                    <tr>
                                                        <td class="style12">
                                                            Branch Name:</td>
                                                        <td class="style7">
                                                            <asp:TextBox ID="txtCBranchName2" runat="server"></asp:TextBox>
                                                        </td>
                                                        <td class="style14">
                                                            &nbsp;</td>
                                                    </tr>
                                                    <tr>
                                                        <td class="style12">
                                                            Branch Address:</td>
                                                        <td class="style7">
                                                            <asp:TextBox ID="txtBranchAddress2" runat="server" TextMode="MultiLine"></asp:TextBox>
                                                        </td>
                                                        <td class="style14">
                                                            &nbsp;</td>
                                                    </tr>
                                                    <tr>
                                                        <td class="style20">
                                                            Bank Account No:</td>
                                                        <td class="style21">
                                                            <asp:TextBox ID="txtAccountNo2" runat="server"></asp:TextBox>
                                                        </td>
                                                        <td class="style22">
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="style12">
                                                            &nbsp;</td>
                                                        <td class="style7">
                                                            &nbsp;</td>
                                                        <td class="style14">
                                                            &nbsp;</td>
                                                    </tr>
                                                    <tr>
                                                        <td class="style12">
                                                            Bank Name:</td>
                                                        <td class="style7">
                                                            <asp:TextBox ID="txtCBankName3" runat="server"></asp:TextBox>
                                                        </td>
                                                        <td class="style14">
                                                            &nbsp;</td>
                                                    </tr>
                                                    <tr>
                                                        <td class="style12">
                                                            Branch Name:</td>
                                                        <td class="style7">
                                                            <asp:TextBox ID="txtCBranchName3" runat="server"></asp:TextBox>
                                                        </td>
                                                        <td class="style14">
                                                            &nbsp;</td>
                                                    </tr>
                                                    <tr>
                                                        <td class="style12">
                                                            Branch Address:</td>
                                                        <td class="style7">
                                                            <asp:TextBox ID="txtBranchAddress3" runat="server" TextMode="MultiLine"></asp:TextBox>
                                                        </td>
                                                        <td class="style14">
                                                            &nbsp;</td>
                                                    </tr>
                                                    <tr>
                                                        <td class="style12">
                                                            Bank Account No:</td>
                                                        <td class="style7">
                                                            <asp:TextBox ID="txtAccountNo3" runat="server"></asp:TextBox>
                                                        </td>
                                                        <td class="style14">
                                                            &nbsp;</td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            &nbsp;</td>
                                                        <td>
                                                            &nbsp;</td>
                                                        <td>
                                                            &nbsp;</td>
                                                    </tr>
                                                </table>
                                            </asp:Panel>
                                        </td>
                                    </tr>
                                </table>
                            </ContentTemplate>
                        </asp:TabPanel>
                        <asp:TabPanel ID="TabPanel5" runat="server" HeaderText="TabPanel5">
                            <HeaderTemplate>
                                Document Upload
                            </HeaderTemplate>
                            <ContentTemplate>
                                <table class="style1">
                                    <tr>
                                        <td class="style12" rowspan="2">
                                            Upload Document:</td>
                                        <td class="style7">
                                            <asp:FileUpload ID="Updoc1" runat="server" />
                                            &nbsp;</td>
                                        <td class="style14">
                                            <asp:RegularExpressionValidator ID="RegularExpressionValidator16" 
                                                runat="server" ControlToValidate="Updoc1" 
                                                ErrorMessage="RegularExpressionValidator" ForeColor="Red" 
                                                ValidationExpression="(.*?)\.(doc|pdf)$"></asp:RegularExpressionValidator>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="style7">
                                            <asp:FileUpload ID="Updoc2" runat="server" />
                                            <br />
                                            <asp:FileUpload ID="Updoc3" runat="server" />
                                            <br />
                                            <asp:FileUpload ID="Updoc4" runat="server" />
                                            <br />
                                            <asp:FileUpload ID="Updoc5" runat="server" />
                                        </td>
                                        <td class="style14">
                                            &nbsp;</td>
                                    </tr>
                                    <tr>
                                        <td class="style12">
                                            &nbsp;</td>
                                        <td class="style7">
                                            &nbsp;</td>
                                        <td class="style14">
                                            &nbsp;</td>
                                    </tr>
                                    <tr>
                                        <td class="style12">
                                            Any Other Certificate:</td>
                                        <td class="style7">
                                            <asp:FileUpload ID="Certi1" runat="server" />
                                            <br />
                                            <asp:FileUpload ID="Certi2" runat="server" />
                                            <br />
                                            <asp:FileUpload ID="Certi3" runat="server" />
                                        </td>
                                        <td class="style14">
                                            <asp:RegularExpressionValidator ID="RegularExpressionValidator18" 
                                                runat="server" ControlToValidate="Certi1" 
                                                ErrorMessage="RegularExpressionValidator" ForeColor="Red" 
                                                ValidationExpression="(.*?)\.(doc|pdf)$"></asp:RegularExpressionValidator>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="style12">
                                            Other Rewards:</td>
                                        <td class="style7">
                                            <asp:FileUpload ID="Reward1" runat="server" />
                                            <br />
                                            <asp:FileUpload ID="Reward2" runat="server" />
                                            <br />
                                            <asp:FileUpload ID="Reward3" runat="server" />
                                        </td>
                                        <td class="style14">
                                            &nbsp;</td>
                                    </tr>
                                    <tr>
                                        <td class="style12">
                                            &nbsp;</td>
                                        <td class="style7">
                                            &nbsp;</td>
                                        <td class="style14">
                                            &nbsp;</td>
                                    </tr>
                                    <tr>
                                        <td class="style12">
                                            <asp:Button ID="btnSubmit1" runat="server" OnClick="btnSubmit_Click1" 
                                                Text="Submit" />
                                        </td>
                                        <td class="style7">
                                            <asp:Button ID="btnUpdate1" runat="server" OnClick="Button2_Click" 
                                                Text="Update" ValidationGroup="a" />
                                        </td>
                                        <td class="style14">
                                            <asp:Label ID="Label1" runat="server" ForeColor="#CC0000" Visible="False"></asp:Label>
                                        </td>
                                    </tr>
                                </table>
                            </ContentTemplate>
                        </asp:TabPanel>
                    </asp:TabContainer>
                </td>
            </tr>
            <tr>
                <td class="style16">
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style16">
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style16">
                    &nbsp;</td>
            </tr>
            </table>
        <br />
        <br />
        <br />
    
    </div>
                    <asp:GridView ID="GridView1" runat="server" 
                        onrowcommand="GridView1_RowCommand1">
                        <Columns>
                            <asp:TemplateField HeaderText="Edit">
                                <ItemTemplate>
                                    <asp:LinkButton ID="LinkButton1"   CommandName="Edite" CausesValidation="false" CommandArgument='<%#Eval("Vendor_Id") %>' runat="server">Edit</asp:LinkButton>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Delete">
                                <ItemTemplate>
                                    <asp:LinkButton ID="LinkButton2"   CommandName="Deletee" CausesValidation="false" CommandArgument='<%#Eval("Vendor_Id") %>' runat="server">Delete</asp:LinkButton>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                    </asp:GridView>
    </form>
</body>
</html>
