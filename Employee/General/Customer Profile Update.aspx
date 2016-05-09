<%@ Page Title="" Language="C#" MasterPageFile="~/Employee/General/General_Employee.master" AutoEventWireup="true" CodeFile="Customer Profile Update.aspx.cs" Inherits="Employee_General_Customer_Profile_Update" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .style1
        {
            width: 100%;
        }
        .style2
        {
            text-decoration: underline;
            text-align: center;
        }
        .style3
        {
            text-align: center;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table class="style1">
        <tr>
            <td class="style2" colspan="4">
                <strong>Customer Profile Update</strong></td>
        </tr>
        <tr>
            <td class="style3" colspan="4">
                &nbsp;</td>
        </tr>
        <tr>
            <td>
                Enter Customer ID :</td>
            <td>
                <asp:TextBox ID="txtCustomerID" runat="server"></asp:TextBox>
            </td>
            <td>
                <asp:Button ID="btnProceed" runat="server" onclick="btnProceed_Click" 
                    Text="Proceed" />
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td colspan="3">
                <asp:Panel ID="Panel1" runat="server">
                    <table class="style1">
                        <tr>
                            <td class="style17">
                                &nbsp;</td>
                            <td class="style17">
                                Customer Name :</td>
                            <td class="style16">
                                <asp:Label ID="lblCustomerName" runat="server" Text="Label"></asp:Label>
                            </td>
                            <td class="style15">
                                &nbsp;</td>
                            <td>
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td class="style17">
                                &nbsp;</td>
                            <td class="style17">
                                Address :</td>
                            <td class="style16">
                                <asp:TextBox ID="txtCustomerAddress" runat="server" TextMode="MultiLine"></asp:TextBox>
                                &nbsp;<span class="style13">*</span></td>
                            <td class="style15">
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" 
                                    ControlToValidate="txtCustomerAddress" ErrorMessage="Enter Proper Address" 
                                    ForeColor="Red"></asp:RequiredFieldValidator>
                            </td>
                            <td>
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td class="style17">
                                &nbsp;</td>
                            <td class="style17">
                                Pin Code :</td>
                            <td class="style16">
                                <asp:TextBox ID="txtPinCode" runat="server"></asp:TextBox>
                            </td>
                            <td class="style15">
                                &nbsp;</td>
                            <td>
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td class="style17">
                                &nbsp;</td>
                            <td class="style17">
                                Country :</td>
                            <td class="style16">
                                <asp:DropDownList ID="ddCountry" runat="server" AutoPostBack="True" 
                                    OnSelectedIndexChanged="ddCountry_SelectedIndexChanged">
                                </asp:DropDownList>
                                &nbsp;<span class="style13">*</span></td>
                            <td class="style15">
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" 
                                    ControlToValidate="ddCountry" ErrorMessage="Select Country" ForeColor="Red"></asp:RequiredFieldValidator>
                            </td>
                            <td>
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td class="style17">
                                &nbsp;</td>
                            <td class="style17">
                                State :</td>
                            <td class="style16">
                                <asp:DropDownList ID="ddState" runat="server" AutoPostBack="True" 
                                    OnSelectedIndexChanged="ddState_SelectedIndexChanged">
                                </asp:DropDownList>
                                &nbsp;<span class="style13">*</span></td>
                            <td class="style15">
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" 
                                    ControlToValidate="ddState" ErrorMessage="Select State" ForeColor="Red"></asp:RequiredFieldValidator>
                            </td>
                            <td>
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td class="style17">
                                &nbsp;</td>
                            <td class="style17">
                                City :</td>
                            <td class="style16">
                                <asp:DropDownList ID="ddCity" runat="server" AutoPostBack="True" 
                                    OnSelectedIndexChanged="ddCity_SelectedIndexChanged">
                                </asp:DropDownList>
                                &nbsp;<span class="style13">*</span></td>
                            <td class="style15">
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" 
                                    ControlToValidate="ddCity" ErrorMessage="Select City" ForeColor="Red"></asp:RequiredFieldValidator>
                            </td>
                            <td>
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td class="style17">
                                &nbsp;</td>
                            <td class="style17">
                                Branch :</td>
                            <td class="style16">
                                <asp:DropDownList ID="ddBranch" runat="server">
                                </asp:DropDownList>
                                &nbsp;<span class="style13">*</span></td>
                            <td class="style15">
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator12" runat="server" 
                                    ControlToValidate="ddBranch" ErrorMessage="Select Branch" ForeColor="Red"></asp:RequiredFieldValidator>
                            </td>
                            <td>
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td class="style18">
                                &nbsp;</td>
                            <td class="style18">
                                Contact :</td>
                            <td class="style19">
                                <asp:TextBox ID="txtContact" runat="server"></asp:TextBox>
                                &nbsp;<span class="style13">*</span></td>
                            <td class="style20">
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator5" runat="server" 
                                    ControlToValidate="txtContact" ErrorMessage="Enter 10 digit Mobile No" 
                                    ForeColor="Red" ValidationExpression="\d{10}"></asp:RegularExpressionValidator>
                            </td>
                            <td>
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td class="style22">
                                &nbsp;</td>
                            <td class="style22">
                                Mob No. :</td>
                            <td class="style23">
                                <asp:TextBox ID="txtMobileNo" runat="server"></asp:TextBox>
                                &nbsp;<span class="style13">*</span></td>
                            <td class="style24">
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator6" runat="server" 
                                    ControlToValidate="txtMobileNo" ErrorMessage="Enter 10 digit Mobile No" 
                                    ForeColor="Red" ValidationExpression="^[789]\d{9}$"></asp:RegularExpressionValidator>
                            </td>
                            <td>
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td class="style17">
                                &nbsp;</td>
                            <td class="style17">
                                Email ID :</td>
                            <td class="style16">
                                <asp:TextBox ID="txtEmailID" runat="server"></asp:TextBox>
                                &nbsp;<span class="style13">*</span></td>
                            <td class="style15">
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator7" runat="server" 
                                    ControlToValidate="txtEmailID" ErrorMessage="Enter Proper Email ID" 
                                    ForeColor="Red" 
                                    ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                            </td>
                            <td>
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td class="style17">
                                &nbsp;</td>
                            <td class="style17">
                                Occuption :</td>
                            <td class="style16">
                                <asp:TextBox ID="txtOccupation" runat="server"></asp:TextBox>
                            </td>
                            <td class="style15">
                                &nbsp;</td>
                            <td>
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td class="style17">
                                &nbsp;</td>
                            <td class="style17">
                                Gender :</td>
                            <td class="style16">
                                <asp:RadioButtonList ID="rbGender" runat="server" RepeatDirection="Horizontal">
                                    <asp:ListItem>Male</asp:ListItem>
                                    <asp:ListItem>Female</asp:ListItem>
                                </asp:RadioButtonList>
                                &nbsp;</td>
                            <td class="style15">
                                &nbsp;</td>
                            <td>
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td class="style17">
                                &nbsp;</td>
                            <td class="style17">
                                Marital Status :</td>
                            <td class="style16">
                                <asp:RadioButtonList ID="rbMaritalStatus" runat="server" 
                                    RepeatDirection="Horizontal">
                                    <asp:ListItem>Married</asp:ListItem>
                                    <asp:ListItem>Unmarried</asp:ListItem>
                                </asp:RadioButtonList>
                            </td>
                            <td class="style15">
                                &nbsp;</td>
                            <td>
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td>
                                &nbsp;</td>
                            <td>
                                &nbsp;</td>
                            <td>
                                &nbsp;</td>
                            <td>
                                &nbsp;</td>
                            <td>
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td>
                                &nbsp;</td>
                            <td>
                                <asp:Button ID="btnUpdate" runat="server" onclick="btnUpdate_Click" 
                                    Text="Update" />
                            </td>
                            <td>
                                &nbsp;</td>
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
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
    </table>
</asp:Content>

