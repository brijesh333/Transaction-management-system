<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Customer_Reg.aspx.cs" Inherits="Customer_Reg" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .style1
        {
            width: 100%;
        }
        .style2
        {
        }
        .style13
        {
            color: #FF0000;
        }
        .style14
        {
            height: 23px;
            text-align: center;
            font-size: x-large;
            text-decoration: underline;
        }
        .style15
        {
            width: 246px;
        }
        .style16
        {
            width: 232px;
        }
        .style17
        {
            width: 204px;
        }
        .style18
        {
            width: 204px;
            height: 30px;
        }
        .style19
        {
            width: 232px;
            height: 30px;
        }
        .style20
        {
            width: 246px;
            height: 30px;
        }
        .style21
        {
            height: 30px;
        }
        .style22
        {
            width: 204px;
            height: 26px;
        }
        .style23
        {
            width: 232px;
            height: 26px;
        }
        .style24
        {
            width: 246px;
            height: 26px;
        }
        .style25
        {
            height: 26px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <table class="style1">
        <tr>
            <td class="style2" colspan="4">
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style2" colspan="4">
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style14" colspan="4">
                <strong>Customer Regestration</strong></td>
        </tr>
        <tr>
            <td class="style2" colspan="4">
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style2" colspan="4">
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style17">
                Customer Name :
            </td>
            <td class="style16">
                <asp:TextBox ID="txtCustomerName" runat="server"></asp:TextBox>
            &nbsp;<span class="style13">*</span></td>
            <td class="style15">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                    ControlToValidate="txtCustomerName" ErrorMessage="Enter Proper Name" 
                    ForeColor="Red"></asp:RequiredFieldValidator>
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style17">
                Address :</td>
            <td class="style16">
                <asp:TextBox ID="txtCustomerAddress" runat="server" TextMode="MultiLine"></asp:TextBox>
            &nbsp;<span class="style13">*</span></td>
            <td class="style15">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                    ControlToValidate="txtCustomerAddress" ErrorMessage="Enter Proper Address" 
                    ForeColor="Red"></asp:RequiredFieldValidator>
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
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
                Country :</td>
            <td class="style16">
                <asp:DropDownList ID="ddCountry" runat="server" AutoPostBack="True" 
                    onselectedindexchanged="ddCountry_SelectedIndexChanged">
                </asp:DropDownList>
            &nbsp;<span class="style13">*</span></td>
            <td class="style15">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                    ControlToValidate="ddCountry" ErrorMessage="Select Country" ForeColor="Red"></asp:RequiredFieldValidator>
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style17">
                State :</td>
            <td class="style16">
                <asp:DropDownList ID="ddState" runat="server" AutoPostBack="True" 
                    onselectedindexchanged="ddState_SelectedIndexChanged">
                </asp:DropDownList>
            &nbsp;<span class="style13">*</span></td>
            <td class="style15">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                    ControlToValidate="ddState" ErrorMessage="Select State" ForeColor="Red"></asp:RequiredFieldValidator>
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style17">
                City :</td>
            <td class="style16">
                <asp:DropDownList ID="ddCity" runat="server" AutoPostBack="True" 
                    onselectedindexchanged="ddCity_SelectedIndexChanged">
                </asp:DropDownList>
            &nbsp;<span class="style13">*</span></td>
            <td class="style15">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" 
                    ControlToValidate="ddCity" ErrorMessage="Select City" ForeColor="Red"></asp:RequiredFieldValidator>
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style17">
                Branch :</td>
            <td class="style16">
                <asp:DropDownList ID="ddBranch" runat="server">
                </asp:DropDownList>
            &nbsp;<span class="style13">*</span></td>
            <td class="style15">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" 
                    ControlToValidate="ddBranch" ErrorMessage="Select Branch" ForeColor="Red"></asp:RequiredFieldValidator>
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style18">
                Contact :</td>
            <td class="style19">
                <asp:TextBox ID="txtContact" runat="server"></asp:TextBox>
            &nbsp;<span class="style13">*</span></td>
            <td class="style20">
                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
                    ControlToValidate="txtContact" ErrorMessage="Enter 10 digit Mobile No" 
                    ForeColor="Red" ValidationExpression="\d{10}"></asp:RegularExpressionValidator>
            </td>
            <td class="style21">
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style22">
                Mob No. :</td>
            <td class="style23">
                <asp:TextBox ID="txtMobileNo" runat="server"></asp:TextBox>
            &nbsp;<span class="style13">*</span></td>
            <td class="style24">
                <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" 
                    ControlToValidate="txtMobileNo" ErrorMessage="Enter 10 digit Mobile No" 
                    ForeColor="Red" ValidationExpression="^[789]\d{9}$"></asp:RegularExpressionValidator>
            </td>
            <td class="style25">
                </td>
        </tr>
        <tr>
            <td class="style17">
                Email ID :</td>
            <td class="style16">
                <asp:TextBox ID="txtEmailID" runat="server"></asp:TextBox>
            &nbsp;<span class="style13">*</span></td>
            <td class="style15">
                <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" 
                    ControlToValidate="txtEmailID" ErrorMessage="Enter Proper Email ID" 
                    ForeColor="Red" 
                    ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
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
            <td class="style17">
                Date Of Birth :</td>
            <td class="style16">
                <asp:TextBox ID="txtDOB" runat="server"></asp:TextBox>
            &nbsp;</td>
            <td class="style15">
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style17">
                FingerPrint :</td>
            <td class="style16">
                <asp:TextBox ID="txtFingerPrint" runat="server"></asp:TextBox>
            </td>
            <td class="style15">
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style17">
                &nbsp;</td>
            <td class="style16">
                &nbsp;</td>
            <td class="style15">
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style17">
                <asp:Button ID="btnInsert" runat="server" Text="Insert" 
                    onclick="btnInsert_Click" />
            </td>
            <td class="style16">
                <asp:Button ID="btnUpdate" runat="server" Text="Update" 
                    onclick="btnUpdate_Click" />
            </td>
            <td class="style15">
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        </table>
    <div>
    
    </div>
    <asp:GridView ID="GridView1" runat="server" onrowcommand="GridView1_RowCommand">
        <Columns>
            <asp:TemplateField HeaderText="Edit">
                <ItemTemplate>
                    <asp:LinkButton ID="LinkButton1" CommandName="Editt" CausesValidation="false" CommandArgument='<%#Eval("Customer_ID") %>' runat="server">Edit</asp:LinkButton>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Delete">
                <ItemTemplate>
                    <asp:LinkButton ID="LinkButton2" CommandName="Deletee" CausesValidation="false" CommandArgument='<%#Eval("Customer_ID") %>' runat="server">Delete</asp:LinkButton>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </asp:GridView>
    </form>
</body>
</html>
