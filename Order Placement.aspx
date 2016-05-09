<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Order Placement.aspx.cs" Inherits="Order_Placement" %>

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
            height: 23px;
        }
        .style3
        {
            height: 23px;
            text-decoration: underline;
            text-align: center;
            font-size: x-large;
        }
        .style4
        {
        }
        .style5
        {
            height: 23px;
        }
        .style6
        {
        }
        .style7
        {
            width: 117px;
        }
        .style8
        {
            width: 160px;
        }
        .style9
        {
            width: 154px;
        }
        .style11
        {
            height: 23px;
            width: 142px;
        }
        .style12
        {
            width: 142px;
        }
        
* {
	margin: 0;
	padding: 0;
}

        .style16
        {
            width: 410px;
        }

        .style18
        {
            height: 23px;
            width: 73px;
        }
        .style19
        {
            height: 23px;
            text-align: center;
            font-size: x-large;
            width: 73px;
        }
        .style20
        {
            width: 73px;
        }

        .style21
        {
            width: 142px;
            height: 21px;
        }
        .style22
        {
            height: 21px;
        }

    </style>
</head>
<body>
    <form id="form1" runat="server">
    <table class="style1">
        <tr>
            <td class="style18">
                &nbsp;</td>
            <td class="style5" colspan="2">
                &nbsp;</td>
            <td class="style2">
                &nbsp;</td>
            <td class="style2">
                &nbsp;</td>
            <td class="style2">
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style19">
                &nbsp;</td>
            <td class="style3" colspan="5">
                <strong>Order Placement Form</strong></td>
        </tr>
        <tr>
            <td class="style18">
                &nbsp;</td>
            <td class="style5" colspan="5">
                <asp:Panel ID="Panel2" runat="server">
                    <table class="style1">
                        <tr>
                            <td class="style16">
                                &nbsp;</td>
                            <td>
                                &nbsp;</td>
                            <td>
                                &nbsp;</td>
                            <td>
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td class="style16">
                                &nbsp;</td>
                            <td>
                                &nbsp;</td>
                            <td>
                                &nbsp;</td>
                            <td>
                                <asp:Label ID="lblDate" runat="server"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td class="style16">
                                Select Vendor :</td>
                            <td>
                                <asp:DropDownList ID="ddVendorName" runat="server">
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
                            <td>
                                &nbsp;</td>
                            <td>
                                &nbsp;</td>
                            <td>
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td class="style16">
                                Select Product Main Category :</td>
                            <td>
                                <asp:DropDownList ID="ddProductMainCategory" runat="server" AutoPostBack="True" 
                                    onselectedindexchanged="ddProductMainCategory_SelectedIndexChanged">
                                </asp:DropDownList>
                            </td>
                            <td>
                                &nbsp;</td>
                            <td>
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td class="style16">
                                Select Sub Product Category :</td>
                            <td>
                                <asp:DropDownList ID="ddProductSubCategory" runat="server" AutoPostBack="True" 
                                    onselectedindexchanged="ddProductSubCategory_SelectedIndexChanged">
                                </asp:DropDownList>
                            </td>
                            <td>
                                &nbsp;</td>
                            <td>
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td class="style16">
                                Select Product Name :</td>
                            <td>
                                <asp:DropDownList ID="ddProductName" runat="server" 
                                    onselectedindexchanged="ddProductName_SelectedIndexChanged">
                                </asp:DropDownList>
                            </td>
                            <td>
                                &nbsp;</td>
                            <td>
                                <asp:Label ID="Label6" runat="server" Text="Label"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td class="style16">
                                &nbsp;</td>
                            <td>
                                &nbsp;</td>
                            <td>
                                &nbsp;</td>
                            <td>
                                <asp:Label ID="Label8" runat="server" Text="Label"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td class="style16">
                                <asp:Button ID="btnSubmit" runat="server" Text="Submit" 
                                    onclick="btnSubmit_Click" />
                            </td>
                            <td>
                                <asp:Button ID="btnCancel" runat="server" Text="Cancel" />
                            </td>
                            <td>
                                &nbsp;</td>
                            <td>
                                &nbsp;</td>
                        </tr>
                    </table>
                </asp:Panel>
            </td>
        </tr>
        <tr>
            <td class="style20">
                &nbsp;</td>
            <td class="style6" colspan="2">
                &nbsp;</td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style20">
                                    &nbsp;</td>
            <td colspan="5">
                                    <asp:GridView ID="GridView1" runat="server" onrowcommand="GridView1_RowCommand" 
                                        
                    onselectedindexchanged="GridView1_SelectedIndexChanged">
                                        <Columns>
                                            <asp:TemplateField HeaderText="Order">
                                                <ItemTemplate>
                                                    <asp:LinkButton ID="LinkButton1" runat="server" CommandArgument='<%#Eval("Prod_Supp_ID") %>' CommandName="Orderr">Order</asp:LinkButton>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                        </Columns>
                                    </asp:GridView>
                                </td>
        </tr>
        <tr>
            <td class="style20">
                &nbsp;</td>
            <td colspan="5">
                <asp:Panel ID="Panel1" runat="server">
                    <table class="style1">
                        <tr>
                            <td class="style21">
                                <asp:Label ID="lblVendorID" runat="server"></asp:Label>
                            </td>
                            <td colspan="6" class="style22">
                                </td>
                            <td class="style22">
                                </td>
                        </tr>
                        <tr>
                            <td class="style11">
                                Order No :</td>
                            <td class="style2" colspan="6">
                                <asp:Label ID="Label3" runat="server" Text="Label"></asp:Label>
                            </td>
                            <td class="style2">
                            </td>
                        </tr>
                        <tr>
                            <td class="style12">
                                Vendor Name :</td>
                            <td colspan="6">
                                <asp:Label ID="lblVendorName" runat="server" Text="Label"></asp:Label>
                            </td>
                            <td>
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td class="style12">
                                Contact No :</td>
                            <td colspan="6">
                                <asp:Label ID="lblVendorContactNo" runat="server" Text="Label"></asp:Label>
                            </td>
                            <td>
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td class="style11">
                            </td>
                            <td class="style2" colspan="6">
                            </td>
                            <td class="style2">
                            </td>
                        </tr>
                        <tr>
                            <td class="style4" colspan="2">
                                Product ID</td>
                            <td class="style7">
                                Unit Price</td>
                            <td class="style8">
                                Description</td>
                            <td class="style8">
                                Color
                            </td>
                            <td class="style9">
                                Quantity</td>
                            <td>
                                Total</td>
                            <td>
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td class="style4" colspan="2">
                                <asp:Label ID="lblProductID" runat="server"></asp:Label>
                            </td>
                            <td class="style7">
                                <asp:Label ID="lblUnitPrice" runat="server" Text="Label"></asp:Label>
                            </td>
                            <td class="style8">
                                <asp:TextBox ID="txtDescription" runat="server"></asp:TextBox>
                            </td>
                            <td class="style8">
                                <asp:TextBox ID="txtColor" runat="server"></asp:TextBox>
                            </td>
                            <td class="style9">
                                <asp:TextBox ID="txtQuantity" runat="server"></asp:TextBox>
                            </td>
                            <td>
                                <asp:Label ID="lblTotal" runat="server"></asp:Label>
                            </td>
                            <td>
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td class="style4" colspan="2">
                                &nbsp;</td>
                            <td class="style7">
                                &nbsp;</td>
                            <td class="style8">
                                &nbsp;</td>
                            <td class="style8">
                                &nbsp;</td>
                            <td class="style9">
                                &nbsp;</td>
                            <td>
                                &nbsp;</td>
                            <td>
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td class="style12">
                                <asp:Button ID="btnOrderSubmit" runat="server" Text="Submit Order" 
                                    onclick="btnOrderSubmit_Click" />
                            </td>
                            <td colspan="6">
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <asp:Button ID="btnCancelOrder" runat="server" Text="Cancel" />
                            </td>
                            <td>
                                &nbsp;</td>
                        </tr>
                    </table>
                </asp:Panel>
            </td>
        </tr>
        <tr>
            <td class="style20">
                &nbsp;</td>
            <td class="style6">
                &nbsp;</td>
            <td class="style6">
                &nbsp;</td>
            <td>
                <asp:Button ID="btnAddNewOrder" runat="server" onclick="btnAddNewOrder_Click" 
                    Text="Add New Order" Height="27px" Width="134px" />
            </td>
            <td>
                <asp:Label ID="Label5" runat="server"></asp:Label>
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style20">
                &nbsp;</td>
            <td class="style6">
                &nbsp;</td>
            <td class="style6">
                &nbsp;</td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style20">
                &nbsp;</td>
            <td class="style6">
                &nbsp;</td>
            <td class="style6">
                &nbsp;</td>
            <td>
                &nbsp;</td>
            <td>
                Total Payable Price :
                <asp:Label ID="Label4" runat="server"></asp:Label>
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style20">
                &nbsp;</td>
            <td class="style6" colspan="4">
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style20">
                &nbsp;</td>
            <td class="style6">
                &nbsp;</td>
            <td class="style6">
                &nbsp;</td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
    </table>
    <div>
    
        <br />
    
    </div>
    </form>
</body>
</html>
