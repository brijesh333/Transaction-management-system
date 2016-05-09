﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="billing.aspx.cs" Inherits="billing" %>

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
            width: 139px;
        }
        .style4
        {
            width: 189px;
        }
        .style6
        {
        }
        .style7
        {
            width: 196px;
        }
        .style8
        {
            width: 139px;
            font-weight: bold;
            height: 23px;
        }
        .style9
        {
            width: 196px;
            font-weight: bold;
            height: 23px;
        }
        .style10
        {
            width: 189px;
            font-weight: bold;
            height: 23px;
        }
        .style11
        {
            font-weight: bold;
            height: 23px;
        }
        .style12
        {
            width: 131px;
        }
        .style14
        {
        }
        .style15
        {
        }
    
* {
	padding: 0;
    margin-left: 0;
    margin-right: 0;
    }

a {
	text-decoration: underline;
	color: #0F8C8C;
}

    </style>
</head>
<body>
    <form id="form1" runat="server">
    <table class="style1">
        <tr>
            <td>
                &nbsp;</td>
            <td class="style15">
                Enter Customer ID :</td>
            <td class="style12">
                <asp:TextBox ID="txtCustomerID" runat="server"></asp:TextBox>
            </td>
            <td>
                <asp:Button ID="btnProceed" runat="server" onclick="btnProceed_Click" 
                    style="margin-left: 0px" Text="Proceed" />
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
            <td class="style12" colspan="2">
                &nbsp;</td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
            <td class="style12">
                Name : 
                <asp:Label ID="lblName" runat="server" Text="Label"></asp:Label>
            </td>
            <td class="style12">
                &nbsp;</td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
            <td class="style15">
                Contact No : 
                <asp:Label ID="lblContactNo" runat="server" Text="Label"></asp:Label>
            </td>
            <td class="style12">
                &nbsp;</td>
            <td>
                Email ID :
                <asp:Label ID="lblEmailID" runat="server" Text="Label"></asp:Label>
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
            <td class="style15" colspan="2">
                Address :
                <asp:Label ID="lblAddress" runat="server" Text="Label"></asp:Label>
            </td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
            <td class="style15" colspan="2">
                Available Balance :&nbsp;
                <asp:Label ID="lblAvailBalance" runat="server" Text="Label"></asp:Label>
            </td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
            <td colspan="3">
                <asp:Panel ID="Panel1" runat="server">
                    <table class="style1" style="border-style: double">
                        <tr>
                            <td class="style11">
                                Item Name</td>
                            <td class="style10">
                                Item Code</td>
                            <td class="style9">
                                Price (Per unit)</td>
                            <td class="style8">
                                Quantity</td>
                            <td class="style14">
                                <b>Price</b></td>
                            <td class="style14">
                                <b>Discount</b></td>
                            <td class="style14">
                                <b>Payable Price</b></td>
                            <td class="style14" rowspan="3">
                                &nbsp;&nbsp;
                                <asp:Button ID="btnAdd" runat="server" onclick="btnAdd_Click" Text="Add" />
                            </td>
                        </tr>
                        <tr>
                            <td class="style6">
                                <asp:DropDownList ID="ddProductName" runat="server" AutoPostBack="True" 
                                    onselectedindexchanged="ddProductName_SelectedIndexChanged">
                                </asp:DropDownList>
                            </td>
                            <td class="style4">
                                <asp:Label ID="lblItemCode" runat="server" Text="Label"></asp:Label>
                            </td>
                            <td class="style7">
                                <asp:Label ID="lblPerUnitPrice" runat="server" Text="Label"></asp:Label>
                            </td>
                            <td class="style2">
                                <asp:TextBox ID="txtQuantity" runat="server" AutoPostBack="True" 
                                    ontextchanged="txtQuantity_TextChanged"></asp:TextBox>
                            </td>
                            <td>
                                <asp:Label ID="lblPrice" runat="server" Text="Label"></asp:Label>
                            </td>
                            <td>
                                <asp:Label ID="lblDiscount" runat="server" Text="Label"></asp:Label>
                            </td>
                            <td>
                                <asp:Label ID="lblPayablePrice" runat="server" Text="Label"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td class="style6">
                                &nbsp;</td>
                            <td class="style4">
                                &nbsp;</td>
                            <td class="style7">
                                &nbsp;</td>
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
                            <td class="style6" colspan="8">
                                <asp:Panel ID="Panel2" runat="server">
                                    <asp:GridView ID="GridView1" runat="server" onrowcommand="GridView1_RowCommand" 
                                        onselectedindexchanged="GridView1_SelectedIndexChanged">
                                        <Columns>
                                            <asp:TemplateField HeaderText="Delete">
                                                <ItemTemplate>
                                                    <asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="false" 
                                                        CommandArgument='<%#Eval("Product_ID") %>' CommandName="Deletee">Delete</asp:LinkButton>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                        </Columns>
                                    </asp:GridView>
                                </asp:Panel>
                            </td>
                        </tr>
                        <tr>
                            <td class="style6">
                                &nbsp;</td>
                            <td class="style4">
                                &nbsp;</td>
                            <td class="style7">
                                &nbsp;</td>
                            <td class="style2">
                                &nbsp;</td>
                            <td>
                                &nbsp;</td>
                            <td>
                                &nbsp;</td>
                            <td colspan="2">
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td class="style6">
                                &nbsp;</td>
                            <td class="style4">
                                &nbsp;</td>
                            <td class="style7">
                                &nbsp;</td>
                            <td class="style2">
                                &nbsp;</td>
                            <td>
                                &nbsp;</td>
                            <td>
                                Total Price</td>
                            <td colspan="2">
                                <asp:Label ID="lblTotalAmount" runat="server" Text="Label"></asp:Label>
                            </td>
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
            <td class="style12" colspan="2">
                &nbsp;</td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
            <td class="style12" colspan="2">
                <asp:Button ID="btnProceedPayment" runat="server" Text="Proceed for Payment" 
                    onclick="btnProceedPayment_Click" />
            </td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
            <td class="style12" colspan="2">
                &nbsp;</td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
    </table>
    <div>
    
    </div>
    </form>
</body>
</html>