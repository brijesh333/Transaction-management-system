<%@ Page Title="" Language="C#" MasterPageFile="~/HOD/Purchase/Purchase_HOD.master" AutoEventWireup="true" CodeFile="Order Placement.aspx.cs" Inherits="HOD_Purchase_Order_Placement" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
    .style1
    {
        width: 100%;
    }
    .style2
    {
        width: 556px;
    }
    .style3
    {
        width: 270px;
    }
    .style5
    {
        width: 18px;
    }
        .style11
        {
            width: 13%;
        }
        .style12
        {
            height: 28px;
            width: 13%;
        }
        .style13
        {
            height: 28px;
            width: 1%;
        }
        .style14
        {
            width: 1%;
        }
        .style15
        {
            width: 21%;
            height: 28px;
        }
        .style16
        {
            width: 6%;
        }
        .style17
        {
            width: 124px;
            height: 28px;
        }
        .style18
        {
            width: 15%;
        }
        .style19
        {
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table class="style1">
    <tr>
        <td class="style5">
            &nbsp;</td>
        <td>
                    <table class="style1" __designer:mapid="54">
                        <tr __designer:mapid="84">
                            <td class="style16" __designer:mapid="85">
                                &nbsp;</td>
                            <td class="style3" __designer:mapid="85">
                                &nbsp;</td>
                            <td __designer:mapid="87">
                                &nbsp;</td>
                            <td __designer:mapid="89">
                                &nbsp;</td>
                            <td __designer:mapid="8a">
                                &nbsp;</td>
                        </tr>
                    </table>
                </td>
    </tr>
    <tr>
        <td class="style5">
            &nbsp;</td>
        <td>
            <asp:Panel ID="Panel2" runat="server">
                <table class="style1">
                    <tr>
                        <td class="style3">
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
                        <td class="style3">
                            &nbsp;</td>
                        <td>
                            &nbsp;</td>
                        <td>
                            &nbsp;</td>
                        <td>
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td class="style3">
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
                        <td class="style3">
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
                        <td class="style3">
                            Select Product Name :</td>
                        <td>
                            <asp:DropDownList ID="ddProductName" runat="server" 
                                onselectedindexchanged="ddProductName_SelectedIndexChanged">
                            </asp:DropDownList>
                        </td>
                        <td>
                            &nbsp;</td>
                        <td>
                            <asp:Label ID="Label6" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="style3">
                            &nbsp;</td>
                        <td>
                            &nbsp;</td>
                        <td>
                            &nbsp;</td>
                        <td>
                            <asp:Label ID="Label8" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="style3">
                            <asp:Button ID="btnSubmit" runat="server" onclick="btnSubmit_Click" 
                                Text="Submit" />
                        </td>
                        <td>
                            <asp:Button ID="btnCancel" runat="server" Text="Cancel" />
                        </td>
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
            </asp:Panel>
        </td>
    </tr>
    <tr>
        <td class="style5">
            &nbsp;</td>
        <td>
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
        <td class="style5">
            &nbsp;</td>
        <td>
            &nbsp;</td>
    </tr>
    <tr>
        <td class="style5">
            &nbsp;</td>
        <td>
            <asp:Panel ID="Panel1" runat="server">
                <table class="style1">
                    <tr>
                        <td class="style21">
                            &nbsp;</td>
                        <td class="style11">
                            Order date :</td>
                        <td class="style22" colspan="6">
                            <asp:Label ID="lblDate1" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="style13">
                            &nbsp;</td>
                        <td class="style12">
                            Vendor Name :</td>
                        <td colspan="6">
                            <asp:Label ID="lblVendorName" runat="server" Text="Label"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="style13">
                            &nbsp;</td>
                        <td class="style12">
                            Vendor ID :</td>
                        <td colspan="6">
                            <asp:Label ID="lblVendorID" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="style13">
                            &nbsp;</td>
                        <td class="style12">
                            Contact No :</td>
                        <td colspan="6">
                            <asp:Label ID="lblVendorContactNo" runat="server" Text="Label"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="style14">
                            &nbsp;</td>
                        <td class="style11">
                        </td>
                        <td class="style2" colspan="6">
                        </td>
                    </tr>
                    <tr>
                        <td class="style14">
                            &nbsp;</td>
                        <td class="style19" colspan="2">
                            Product ID</td>
                        <td class="style12">
                            Unit Price</td>
                        <td class="style15">
                            Description</td>
                        <td class="style15">
                            Color
                        </td>
                        <td class="style17">
                            Quantity</td>
                        <td class="style18">
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td class="style14">
                            &nbsp;</td>
                        <td class="style19" colspan="2">
                            <asp:Label ID="lblProductID" runat="server"></asp:Label>
                        </td>
                        <td class="style12">
                            <asp:Label ID="lblUnitPrice" runat="server" Text="Label"></asp:Label>
                        </td>
                        <td class="style15">
                            <asp:TextBox ID="txtDescription" runat="server"></asp:TextBox>
                        </td>
                        <td class="style15">
                            <asp:TextBox ID="txtColor" runat="server"></asp:TextBox>
                        </td>
                        <td class="style17">
                            <asp:TextBox ID="txtQuantity" runat="server" 
                                ontextchanged="txtQuantity_TextChanged"></asp:TextBox>
                        </td>
                        <td class="style18">
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td class="style14">
                            &nbsp;</td>
                        <td class="style19" colspan="2">
                            &nbsp;</td>
                        <td class="style12">
                            &nbsp;</td>
                        <td class="style15">
                            &nbsp;</td>
                        <td class="style15">
                            &nbsp;</td>
                        <td class="style17">
                            &nbsp;</td>
                        <td class="style18">
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td class="style14">
                            &nbsp;</td>
                        <td class="style19" colspan="3">
                            &nbsp;</td>
                        <td class="style15">
                            <asp:Label ID="Label4" runat="server"></asp:Label>
                        </td>
                        <td class="style15">
                            &nbsp;</td>
                        <td class="style17">
                            &nbsp;</td>
                        <td class="style18">
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td class="style14">
                            &nbsp;</td>
                        <td class="style19" colspan="2">
                            &nbsp;</td>
                        <td class="style12">
                            &nbsp;</td>
                        <td class="style15">
                            &nbsp;</td>
                        <td class="style15">
                            &nbsp;</td>
                        <td class="style17">
                            &nbsp;</td>
                        <td class="style18">
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td class="style13">
                            &nbsp;</td>
                        <td class="style12">
                            <asp:Button ID="btnOrderSubmit" runat="server" Text="Submit Order" 
                                onclick="btnOrderSubmit_Click" />
                        </td>
                        <td colspan="6">
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <asp:Button ID="btnCancelOrder" runat="server" Text="Cancel" />
                        </td>
                    </tr>
                </table>
            </asp:Panel>
        </td>
    </tr>
    <tr>
        <td class="style5">
            &nbsp;</td>
        <td>
            &nbsp;</td>
    </tr>
    <tr>
            <td class="style5">
                &nbsp;</td>
            <td>
                <asp:Button ID="btnAddNewOrder" runat="server" onclick="btnAddNewOrder_Click" 
                    Text="Add New Order" Height="27px" Width="134px" />
            </td>
            </tr>
    <tr>
            <td class="style5">
                &nbsp;</td>
            <td>
                &nbsp;</td>
            </tr>
    <tr>
            <td class="style5">
                &nbsp;</td>
            <td>
                &nbsp;</td>
            </tr>
    <tr>
        <td class="style5">
            &nbsp;</td>
        <td>
            &nbsp;</td>
    </tr>
    <tr>
        <td class="style5">
            &nbsp;</td>
        <td>
                <asp:Label ID="Label5" runat="server"></asp:Label>
            </td>
    </tr>
    <tr>
        <td class="style5">
            &nbsp;</td>
        <td>
            &nbsp;</td>
    </tr>
    <tr>
        <td class="style5">
            &nbsp;</td>
        <td>
            &nbsp;</td>
    </tr>
</table>
</asp:Content>

