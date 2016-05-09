<%@ Page Title="" Language="C#" MasterPageFile="~/Employee/Purchase/Purchase_Employee.master" AutoEventWireup="true" CodeFile="QAQC.aspx.cs" Inherits="Employee_Purchase_QAQC" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
    .style1
    {
        width: 100%;
    }
        .style2
        {
            width: 416px;
        }
        .style3
        {
            width: 416px;
            height: 23px;
        }
        .style4
        {
            height: 23px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table class="style1">
    <tr>
                <td class="style2">
                    Enter Order No :</td>
                <td>
                    <asp:TextBox ID="txtOrderNo" runat="server"></asp:TextBox>
&nbsp;
                <asp:Button ID="btnViewDetail" runat="server" Text="View Detail" 
                    onclick="btnViewDetail_Click" />
                </td>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
    </tr>
    <tr>
                <td class="style2">
                    Order Date :</td>
                <td>
                    <asp:Label ID="lblOrderDate" runat="server" Text="Label"></asp:Label>
                </td>
                <td>
                    <asp:Label ID="Label1" runat="server" Visible="False"></asp:Label>
                </td>
                <td>
                    &nbsp;</td>
    </tr>
    <tr>
                <td class="style2">
                    Vendor Name :</td>
                <td>
                    <asp:Label ID="lblVendorName" runat="server" Text="Label"></asp:Label>
                </td>
                <td>
                    <asp:Label ID="Label2" runat="server" Visible="False"></asp:Label>
                </td>
                <td>
                    &nbsp;</td>
    </tr>
    <tr>
                <td class="style2">
                    Product Main Category :</td>
                <td>
                    <asp:Label ID="lblProductMainCategory" runat="server" Text="Label"></asp:Label>
                </td>
                <td>
                    <asp:Label ID="Label3" runat="server" Visible="False"></asp:Label>
                </td>
                <td>
                    &nbsp;</td>
    </tr>
    <tr>
                <td class="style2">
                    Product sub Category :</td>
                <td>
                    <asp:Label ID="lblProductSubCategory" runat="server" Text="Label"></asp:Label>
                </td>
                <td>
                    <asp:Label ID="Label4" runat="server" Visible="False"></asp:Label>
                </td>
                <td>
                    &nbsp;</td>
    </tr>
    <tr>
                <td class="style2">
                    Product Name :</td>
                <td>
                    <asp:Label ID="lblProductName" runat="server" Text="Label"></asp:Label>
                </td>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
    </tr>
    <tr>
                <td class="style2">
                    Color :</td>
                <td>
                    <asp:Label ID="lblColor" runat="server" Text="Label"></asp:Label>
                </td>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
    </tr>
    <tr>
                <td class="style2">
                    Ordered Quantity :</td>
                <td>
                    <asp:Label ID="lblOrderQuantity" runat="server" Text="Label"></asp:Label>
                </td>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
    </tr>
    <tr>
                <td class="style2">
                    Damadged Quantity :</td>
                <td>
                    <asp:TextBox ID="txtDamadgedQuantity" runat="server" AutoPostBack="True" 
                        ontextchanged="txtDamadgedQuantity_TextChanged"></asp:TextBox>
                </td>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
    </tr>
    <tr>
                <td class="style2">
                    Damadged description :</td>
                <td>
                    <asp:TextBox ID="txtDamadgedDescription" runat="server"></asp:TextBox>
                </td>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
    </tr>
    <tr>
                <td class="style2">
                    Received Quantity :</td>
                <td>
                    <asp:Label ID="lblReceivedQuantity" runat="server" Text="Label"></asp:Label>
                </td>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
    </tr>
    <tr>
                <td class="style3">
                    Purchase Price :</td>
                <td class="style4">
                    <asp:Label ID="lblPurchasePrice" runat="server" Text="Label"></asp:Label>
                </td>
                <td class="style4">
                    </td>
                <td>
                    &nbsp;</td>
    </tr>
    <tr>
                <td class="style2">
                    Sale price :</td>
                <td>
                    <asp:TextBox ID="txtSalePrice" runat="server"></asp:TextBox>
                </td>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
    </tr>
    <tr>
                <td class="style2">
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
    </tr>
    <tr>
                <td class="style2">
                    <asp:Button ID="btnApprove" runat="server" onclick="btnApprove_Click" 
                        Text="Approve" />
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
    </tr>
</table>
</asp:Content>

