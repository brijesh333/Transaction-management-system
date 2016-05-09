<%@ Page Title="" Language="C#" MasterPageFile="~/Employee/Account/Account_Employee.master" AutoEventWireup="true" CodeFile="vend_reg.aspx.cs" Inherits="Employee_Account_vend_reg" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .style1
    {
        width: 100%;
    }
        .style12
        {
    }
        .style11
        {
            color: #FF3300;
        }
        .style14
        {
            width: 571px;
        }
        .style15
        {
            width: 198px;
        }
        .style16
        {
            width: 189px;
        }
        .style17
        {
            width: 280px;
        }
        .style18
        {
            width: 323px;
        }
        .style21
        {
            width: 244px;
        }
        .style22
        {
            width: 243px;
        }
        .style23
        {
            width: 354px;
        }
        .style24
        {
            width: 369px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table class="style1">
    <tr>
        <td>
            <asp:ScriptManager ID="ScriptManager1" runat="server">
            </asp:ScriptManager>
        </td>
        <td>
            &nbsp;</td>
    </tr>
    <tr>
        <td>
            &nbsp;</td>
        <td>
            &nbsp;</td>
    </tr>
    <tr>
        <td>
            &nbsp;</td>
        <td>
            &nbsp;</td>
    </tr>
    <tr>
        <td colspan="2">
            <asp:TabContainer ID="TabContainer2" runat="server" ActiveTabIndex="4" 
                Height="547px" ScrollBars="Both" Width="966px">
                <asp:TabPanel ID="TabPanel1" runat="server" HeaderText="TabPanel1"><HeaderTemplate>Basic Detail</HeaderTemplate><ContentTemplate><table class="style1"><tr><td><table class="style1"><tr>
                    <td class="style21">Company Name:</td><td class="style22"><asp:TextBox ID="txtCompanyName" runat="server"></asp:TextBox><span class="style11">*</span></td><td class="style14"><asp:RequiredFieldValidator ID="RequiredFieldValidator18" runat="server" 
                                                ControlToValidate="txtCompanyName" ErrorMessage="Enter Company Name" 
                                                ForeColor="Red"></asp:RequiredFieldValidator>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <asp:RegularExpressionValidator ID="RegularExpressionValidator9" runat="server" 
                                                ControlToValidate="txtCompanyName" ErrorMessage="Enter Valid Name" 
                                                ForeColor="Red" ValidationExpression="^[a-z A-Z]{0,50}"></asp:RegularExpressionValidator></td></tr><tr>
                        <td class="style21">Type Of Bussiness:</td><td class="style22"><asp:DropDownList ID="ddTypeOfBusiness" runat="server"></asp:DropDownList></td><td class="style14">
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </td></tr><tr><td class="style21">Main Company Head Office Address:</td>
                        <td class="style22"><asp:TextBox ID="txtHeadAddress" runat="server" TextMode="MultiLine"></asp:TextBox><span class="style11">*</span></td><td class="style14">
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator20" runat="server" 
                                                ControlToValidate="txtHeadAddress" 
                            ErrorMessage="Enter Address" ForeColor="Red"></asp:RequiredFieldValidator></td></tr><tr>
                        <td class="style21">Head Office Contact No:</td><td class="style22"><asp:TextBox ID="txtCHOfficeContact" runat="server"></asp:TextBox><span class="style11">*</span></td><td class="style14">
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator21" runat="server" 
                                                ControlToValidate="txtCHOfficeContact" ErrorMessage="Enter Contact No." 
                                                ForeColor="Red"></asp:RequiredFieldValidator>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </td></tr><tr>
                        <td class="style21">Head Office E-mail Id:</td><td class="style22"><asp:TextBox ID="txtCHOfficeEmail" runat="server"></asp:TextBox><span class="style11">*</span></td><td class="style14">
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator22" runat="server" 
                                                ControlToValidate="txtCHOfficeEmail" ErrorMessage="Enter emailID" 
                                                ForeColor="Red"></asp:RequiredFieldValidator>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <asp:RegularExpressionValidator ID="RegularExpressionValidator10" 
                                                runat="server" ControlToValidate="txtCHOfficeEmail" 
                                                ErrorMessage="Enter valid emailID" ForeColor="Red" 
                                                
                            ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>&nbsp;&nbsp;</td></tr><tr>
                        <td class="style21">Head Office Web-Site:</td><td class="style22"><asp:TextBox ID="txtCHOfficeWebsite" runat="server"></asp:TextBox></td><td class="style14">&nbsp;</td></tr>
                    <tr>
                        <td class="style21">
                            &nbsp;</td>
                        <td class="style22">
                            &nbsp;</td>
                        <td class="style14">
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td class="style21">
                            <asp:Button ID="Button7" runat="server" onclick="Button7_Click" Text="Next" />
                        </td>
                        <td class="style22">
                            &nbsp;</td>
                        <td class="style14">
                            &nbsp;</td>
                    </tr>
                    </table></td><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td></tr></table></ContentTemplate></asp:TabPanel>
                <asp:TabPanel ID="TabPanel2" runat="server" HeaderText="TabPanel2"><HeaderTemplate>Contact Person Detail</HeaderTemplate><ContentTemplate><table class="style1"><tr><td><table class="style1"><tr>
                    <td class="style15">Contact Person Name:</td><td class="style7"><asp:TextBox ID="txtCPersonName" runat="server"></asp:TextBox><span class="style11">*</span></td><td class="style14">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator23" runat="server" 
                                                ControlToValidate="txtCPersonName" ErrorMessage="Enter Person Name" 
                                                ForeColor="Red"></asp:RequiredFieldValidator>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator11" 
                                                runat="server" ControlToValidate="txtCPersonName" 
                                                ErrorMessage="Enter Valid Name" ForeColor="Red" 
                                                ValidationExpression="^[a-z A-Z]{0,50}"></asp:RegularExpressionValidator>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </td></tr><tr>
                        <td class="style15">Contact Person Department:</td><td class="style7"><asp:DropDownList ID="ddCPersonDepartment" runat="server" AutoPostBack="True" 
                                                OnSelectedIndexChanged="ddCPersonDepartment_SelectedIndexChanged"></asp:DropDownList></td><td class="style14">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </td></tr><tr>
                    <td class="style15">Contact Person Designation:</td><td class="style7"><asp:DropDownList ID="ddCPersonDesignation" runat="server"></asp:DropDownList></td><td class="style14">
                    &nbsp;</td></tr><tr><td class="style15">Contact Person E-mail Id:</td><td class="style7"><asp:TextBox ID="txtCPersonEmail" runat="server"></asp:TextBox><span class="style11">*</span></td><td class="style14">
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator26" runat="server" 
                                                ControlToValidate="txtCPersonEmail" ErrorMessage="Enter Person EmailID" 
                                                ForeColor="Red"></asp:RequiredFieldValidator>&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:RegularExpressionValidator ID="RegularExpressionValidator12" 
                                                runat="server" ControlToValidate="txtCPersonEmail" 
                                                ErrorMessage="Enter Valid EmailID" ForeColor="Red" 
                                                
                            ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </td></tr><tr>
                        <td class="style15">Contact Person Mobile No:</td><td class="style7"><asp:TextBox ID="txtCPersonMobile" runat="server"></asp:TextBox><span class="style11">*</span></td><td class="style14">&nbsp;<asp:RequiredFieldValidator 
                            ID="RequiredFieldValidator27" runat="server" 
                                                ControlToValidate="txtCPersonMobile" ErrorMessage="Enter Mob. No" 
                                                ForeColor="Red"></asp:RequiredFieldValidator>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp; 
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator13" 
                                                runat="server" ControlToValidate="txtCPersonMobile" 
                                                ErrorMessage="Enter Valid Mob. No" ForeColor="Red" 
                                                ValidationExpression="^[789]\d{9}$"></asp:RegularExpressionValidator>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </td></tr><tr>
                        <td class="style15">Contact Person Contact No:</td><td class="style7"><asp:TextBox ID="txtCPersonContact" runat="server"></asp:TextBox></td><td class="style14">
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator17" 
                            runat="server" ControlToValidate="txtCPersonContact" 
                            ErrorMessage="Enter Valid Mob. No" ForeColor="Red" 
                            ValidationExpression="^[789]\d{9}$"></asp:RegularExpressionValidator>
                        </td></tr><tr>
                    <td class="style15">Contact Person Address:</td><td class="style7"><asp:TextBox ID="txtCPersonAddress" runat="server" TextMode="MultiLine"></asp:TextBox>
                        <span class="style11">*</span></td><td class="style14">
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator34" runat="server" 
                                ControlToValidate="txtCPersonAddress" ErrorMessage="Enter Address" 
                                ForeColor="Red"></asp:RequiredFieldValidator>
                        </td></tr>
                    <tr>
                        <td class="style15">
                            &nbsp;</td>
                        <td class="style7">
                            &nbsp;</td>
                        <td class="style14">
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td class="style15">
                            <asp:Button ID="Button3" runat="server" onclick="Button3_Click" 
                                Text="Previous" />
                        </td>
                        <td class="style7">
                            <asp:Button ID="Button4" runat="server" onclick="Button4_Click" Text="Next" />
                        </td>
                        <td class="style14">
                            &nbsp;</td>
                    </tr>
                    </table></td><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td></tr></table></ContentTemplate></asp:TabPanel>
                <asp:TabPanel ID="TabPanel3" runat="server" HeaderText="TabPanel3"><HeaderTemplate>Company Registration Detail</HeaderTemplate><ContentTemplate><table class="style1"><tr><td><table class="style1"><tr>
                    <td class="style16">Registration Number:</td><td class="style17"><asp:TextBox ID="txtCRegistrationNo" runat="server"></asp:TextBox><span class="style11">*</span></td><td class="style14">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator28" runat="server" 
                                                ControlToValidate="txtCRegistrationNo" ErrorMessage="Enter Registration No." 
                                                ForeColor="Red"></asp:RequiredFieldValidator></td></tr><tr>
                        <td class="style16">VAT Number:</td><td class="style17"><asp:TextBox ID="txtCVatNo" runat="server"></asp:TextBox></td><td class="style14">&nbsp;</td></tr><tr>
                    <td class="style16">Service Tax Number:</td><td class="style17"><asp:TextBox ID="txtCServiceTaxNo" runat="server"></asp:TextBox></td><td class="style14">&nbsp;</td></tr><tr>
                    <td class="style16">Establish Year:</td><td class="style17"><asp:TextBox ID="txtCEstablishYear" runat="server"></asp:TextBox></td><td class="style14">&nbsp;</td></tr><tr>
                    <td class="style16">Type of Company:</td><td class="style17"><asp:RadioButtonList ID="rbTypeOfCompany" runat="server" 
                                                RepeatDirection="Horizontal"><asp:ListItem>Private Ltd.</asp:ListItem><asp:ListItem>Partnership</asp:ListItem><asp:ListItem>Govt.</asp:ListItem></asp:RadioButtonList>&nbsp;&nbsp;&nbsp; </td><td class="style14"><asp:RequiredFieldValidator ID="RequiredFieldValidator32" runat="server" 
                                                ControlToValidate="rbTypeOfCompany" ErrorMessage="Select Proper Type" 
                                                ForeColor="Red"></asp:RequiredFieldValidator></td></tr><tr>
                        <td class="style16">ISO Certified:</td><td class="style17"><asp:RadioButtonList ID="rbISO" runat="server" RepeatDirection="Horizontal"><asp:ListItem>Yes</asp:ListItem><asp:ListItem>No</asp:ListItem></asp:RadioButtonList></td><td class="style14"><asp:RequiredFieldValidator ID="RequiredFieldValidator33" runat="server" 
                                                ControlToValidate="rbISO" ErrorMessage="Select proper type" ForeColor="Red"></asp:RequiredFieldValidator></td></tr>
                    <tr>
                        <td class="style16">
                            &nbsp;</td>
                        <td class="style17">
                            &nbsp;</td>
                        <td class="style14">
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td class="style16">
                            <asp:Button ID="Button5" runat="server" onclick="Button5_Click" 
                                Text="Previous" />
                        </td>
                        <td class="style17">
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <asp:Button ID="Button6" runat="server" onclick="Button6_Click" Text="Next" />
                        </td>
                        <td class="style14">
                            &nbsp;</td>
                    </tr>
                    </table></td><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td></tr></table></ContentTemplate></asp:TabPanel>
                <asp:TabPanel ID="TabPanel4" runat="server" HeaderText="TabPanel4"><HeaderTemplate>Bank Detail</HeaderTemplate><ContentTemplate><table class="style1"><tr><td class="style12">Bank Name:</td><td class="style7"><asp:TextBox ID="txtCBankName1" runat="server"></asp:TextBox><span class="style11">*</span></td><td class="style14">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator29" runat="server" 
                                                ControlToValidate="txtCBankName1" ErrorMessage="Enter Bank Name" 
                                                ForeColor="Red"></asp:RequiredFieldValidator>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator14" 
                                                runat="server" ControlToValidate="txtCBankName1" 
                                                ErrorMessage="Enter valid name" ForeColor="Red" 
                                                ValidationExpression="^[a-z A-Z]{0,50}"></asp:RegularExpressionValidator>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </td></tr><tr><td class="style12">Branch Name:</td><td class="style7"><asp:TextBox ID="txtCBranchName1" runat="server"></asp:TextBox><span class="style11">*</span></td><td class="style14">
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator30" runat="server" 
                                                ControlToValidate="txtCBranchName1" ErrorMessage="Enter Branch Name" 
                                                ForeColor="Red"></asp:RequiredFieldValidator>&nbsp;&nbsp;&nbsp;&nbsp;<asp:RegularExpressionValidator ID="RegularExpressionValidator15" 
                                                runat="server" ControlToValidate="txtCBranchName1" 
                                                ErrorMessage="Enter branch name" ForeColor="Red" 
                                                ValidationExpression="^[a-z A-Z]{0,50}"></asp:RegularExpressionValidator>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp; </td></tr><tr><td class="style12">Branch Address:</td><td class="style7"><asp:TextBox ID="txtBranchAddress1" runat="server" TextMode="MultiLine"></asp:TextBox></td><td class="style14">&nbsp;</td></tr><tr><td class="style12">Bank Account No:</td><td class="style7"><asp:TextBox ID="txtAccountNo1" runat="server"></asp:TextBox><span class="style11">*</span></td><td class="style14">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator31" runat="server" 
                                                ControlToValidate="txtAccountNo1" ErrorMessage="Enter Bank Account No." 
                                                ForeColor="Red"></asp:RequiredFieldValidator>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </td></tr><tr><td class="style12">&nbsp;</td><td class="style7">&nbsp;</td><td class="style14">&nbsp;</td></tr><tr><td class="style12">
                    <asp:Button ID="Button9" runat="server" onclick="Button9_Click" 
                        Text="Previous" />
                    </td><td class="style7">
                        <asp:Button ID="Button8" runat="server" onclick="Button8_Click" Text="Next" />
                    </td><td class="style14">&nbsp;</td></tr><tr><td 
                    class="style12" colspan="3"><table class="style1"><tr><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td></tr></table></td></tr></table></ContentTemplate></asp:TabPanel>
                <asp:TabPanel ID="TabPanel5" runat="server" HeaderText="TabPanel5"><HeaderTemplate>Document Upload</HeaderTemplate><ContentTemplate><table class="style1"><tr><td><table class="style1"><tr>
                    <td class="style23">Upload Licence Document</td><td class="style24"><asp:FileUpload ID="Updoc1" runat="server"></asp:FileUpload>
                    &nbsp;(.pdf)&nbsp;</td><td class="style14">
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator18" runat="server" 
                                                ControlToValidate="Updoc1" ErrorMessage="Upload Certificate in correct format" 
                                                ForeColor="Red" ValidationExpression="(.*?)\.(|pdf)$"></asp:RegularExpressionValidator></td></tr><tr>
                        <td class="style23">
                            &nbsp;</td>
                        <td class="style24">&nbsp;<br /> </td><td class="style14">&nbsp;</td></tr><tr>
                    <td class="style23">Certificate :</td><td class="style24">
                    <asp:FileUpload ID="Updoc2" runat="server" />
                    &nbsp;(.pdf)</td><td class="style14">
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator5" runat="server" 
                            ControlToValidate="Updoc2" ErrorMessage="Upload Certificate in correct format" 
                            ForeColor="Red" ValidationExpression="(.*?)\.(|pdf)$"></asp:RegularExpressionValidator>
                    </td></tr>
                    <tr>
                        <td class="style23">
                            &nbsp;</td>
                        <td class="style24">
                            &nbsp;</td>
                        <td class="style14">
                            &nbsp;</td>
                    </tr>
                    <tr><td class="style23">Organization/Person Photograph:</td><td class="style24" 
                            rowspan="2"><asp:FileUpload ID="Reward1" runat="server"></asp:FileUpload>
                        &nbsp;(.jpg or .gif)<br /> <br /></td><td class="style14" rowspan="2"><asp:RegularExpressionValidator ID="RegularExpressionValidator7" runat="server" 
                                                ControlToValidate="Reward1" ErrorMessage="Upload Photo in Correct Format" 
                                                ForeColor="Red" ValidationExpression="(.*?)\.(jpg|JPG|gif|GIF)$"></asp:RegularExpressionValidator></td></tr>
                    <tr>
                        <td class="style23">
                            &nbsp;</td>
                    </tr>
                    <tr><td class="style23">&nbsp;</td><td class="style24">&nbsp;</td><td class="style14">&nbsp;</td></tr><tr>
                    <td class="style23"><asp:Button ID="btnSubmit1" runat="server" OnClick="btnSubmit_Click1" 
                                                Text="Submit"></asp:Button></td><td class="style24"><asp:Button ID="btnUpdate1" runat="server" OnClick="Button2_Click" 
                                                Text="Update" ValidationGroup="a"></asp:Button></td><td class="style14">
                        <asp:Button ID="Button10" runat="server" onclick="Button10_Click" 
                            Text="Previous" />
                        &nbsp;<asp:Label ID="Label1" runat="server" ForeColor="#CC0000" Visible="False"></asp:Label></td></tr><tr>
                        <td class="style23">&nbsp;</td><td class="style24">&nbsp;</td><td class="style14">&nbsp;</td></tr><tr><td class="style12" colspan="3"><asp:GridView ID="GridView1" runat="server" onrowcommand="GridView1_RowCommand1"><Columns><asp:TemplateField HeaderText="Edit"><ItemTemplate><asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="false" 
                                        CommandArgument='<%#Eval("Vendor_Id") %>' CommandName="Edite">Edit</asp:LinkButton></ItemTemplate></asp:TemplateField><asp:TemplateField HeaderText="Delete"><ItemTemplate><asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="false" 
                                        CommandArgument='<%#Eval("Vendor_Id") %>' CommandName="Deletee">Delete</asp:LinkButton></ItemTemplate></asp:TemplateField></Columns></asp:GridView></td></tr><tr>
                        <td class="style23">&nbsp;</td><td class="style24">&nbsp;</td><td class="style14">&nbsp;</td></tr></table></td><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td></tr></table></ContentTemplate></asp:TabPanel>
            </asp:TabContainer>
        </td>
    </tr>
    </table>
</asp:Content>

