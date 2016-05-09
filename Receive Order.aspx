<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Receive Order.aspx.cs" Inherits="QAQC" %>

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
        .style2
        {
            text-decoration: underline;
            text-align: center;
            font-size: x-large;
        }
        .style3
        {
        }
        .style4
        {
            width: 201px;
        }
        .style6
        {
            width: 173px;
        }
        .style9
        {
            width: 123px;
        }
        .style10
        {
            width: 146px;
        }
        .style11
        {
            width: 142px;
        }
        .style12
        {
            width: 123px;
            font-weight: bold;
        }
        .style14
        {
        }
        .style15
        {
            width: 6px;
        }
        .style16
        {
            width: 274px;
        }
        .style17
        {
            width: 202px;
        }
        .style18
        {
            height: 59px;
        }
        .style19
        {
            height: 33px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <table class="style1">
        <tr>
            <td class="style2" colspan="5">
                <strong>Received Order Form</strong></td>
        </tr>
        <tr>
            <td class="style14">
                Select Date :</td>
            <td colspan="2">
                <asp:TextBox ID="txtDate" runat="server"></asp:TextBox>
                <asp:ScriptManager ID="ScriptManager1" runat="server">
                </asp:ScriptManager>
            </td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style14">
                Enter the Order No :</td>
            <td class="style15">
                <asp:TextBox ID="txtOrderNo" runat="server"></asp:TextBox>
            </td>
            <td>
                <asp:Button ID="btnViewDetail" runat="server" Text="View Detail" 
                    onclick="btnViewDetail_Click" />
            </td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style14">
                &nbsp;</td>
            <td colspan="2">
                &nbsp;</td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style14">
                <asp:Label ID="lbltemp" runat="server"></asp:Label>
            </td>
            <td colspan="2">
                <asp:Button ID="btnCancel" runat="server" Text="Cancel" />
            </td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style14">
                &nbsp;</td>
            <td colspan="2">
                &nbsp;</td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td colspan="5">
                <asp:Panel ID="Panel1" runat="server">
                    <table class="style1">
                        <tr>
                            <td class="style3" colspan="2">
                                Order No :</td>
                            <td class="style3" colspan="3">
                                <asp:Label ID="lblOrderNo" runat="server" Text="Label"></asp:Label>
                            </td>
                            <td class="style3" colspan="3">
                                &nbsp;</td>
                            <td class="style3">
                                &nbsp;</td>
                            <td class="style3">
                                &nbsp;</td>
                            <td class="style3">
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td class="style3" colspan="2">
                                Order Date :</td>
                            <td class="style3" colspan="3">
                                <asp:Label ID="lblOrderDate" runat="server"></asp:Label>
                            </td>
                            <td class="style3" colspan="3">
                                &nbsp;</td>
                            <td class="style3">
                                &nbsp;</td>
                            <td class="style3">
                            </td>
                            <td class="style3">
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2" class="style19">
                                Vendor ID :</td>
                            <td colspan="3" class="style19">
                                <asp:Label ID="lblVendorID" runat="server"></asp:Label>
                            </td>
                            <td colspan="3" class="style19">
                                </td>
                            <td class="style19">
                                </td>
                            <td class="style19">
                                </td>
                            <td class="style19">
                                </td>
                        </tr>
                        <tr>
                            <td colspan="8">
                                <asp:Label ID="lblRQ" runat="server" Text="Label"></asp:Label>
&nbsp;&nbsp;<asp:Label ID="lblDQ" runat="server" Text="Label"></asp:Label>
                                &nbsp;&nbsp;
                                <asp:Label ID="lblDD" runat="server" Text="Label"></asp:Label>
                                &nbsp; </td>
                            <td>
                                &nbsp;</td>
                            <td>
                                &nbsp;</td>
                            <td>
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td class="style12">
                                <b>sr. no</b></td>
                            <td class="style10" colspan="2">
                                <b>Product ID</b></td>
                            <td colspan="2">
                                <b>Color</b></td>
                            <td class="style11">
                                <b>Description</b></td>
                            <td class="style6">
                                <b>Ordered Quantity</b></td>
                            <td class="style4">
                                <b>Received Quantity</b></td>
                            <td class="style4">
                                <strong>Ramining Quantity</strong></td>
                            <td rowspan="2">
                                <asp:Button ID="btnOK" runat="server" onclick="btnOK_Click" Text="OK" />
                            </td>
                            <td>
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td class="style9">
                                <asp:Label ID="Label8" runat="server"></asp:Label>
                            </td>
                            <td class="style10" colspan="2">
                                <asp:Label ID="lblProductID" runat="server"></asp:Label>
                            </td>
                            <td colspan="2">
                                <asp:Label ID="lblColor" runat="server"></asp:Label>
                            </td>
                            <td class="style11">
                                <asp:Label ID="lblDescription" runat="server"></asp:Label>
                            </td>
                            <td class="style6">
                                <asp:Label ID="lblOrderQuantity" runat="server"></asp:Label>
                            </td>
                            <td class="style4">
                                <asp:TextBox ID="txtReceivedQuantity" runat="server" AutoPostBack="True" 
                                    ontextchanged="txtReceivedQuantity_TextChanged"></asp:TextBox>
                            </td>
                            <td class="style4">
                                <asp:Label ID="lblRemainingQuantity" runat="server" Text="Label"></asp:Label>
                            </td>
                            <td>
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td class="style3" colspan="3">
                                <asp:Label ID="Label9" runat="server" Text="Label"></asp:Label>
                                &nbsp;<asp:Label ID="Label10" runat="server" Text="Label"></asp:Label>
                                &nbsp;<asp:Label ID="Label11" runat="server" Text="Label"></asp:Label>
                                &nbsp;<asp:Label ID="Label12" runat="server" Text="Label"></asp:Label>
                                &nbsp;<asp:Label ID="Label13" runat="server" Text="Label"></asp:Label>
                                </td>
                            <td class="style3" colspan="5">
                            </td>
                            <td class="style3">
                                &nbsp;</td>
                            <td class="style3">
                                &nbsp;</td>
                            <td class="style3">
                                </td>
                        </tr>
                        <tr>
                            <td class="style3" colspan="3">
                                &nbsp;</td>
                            <td class="style3" colspan="5">
                                &nbsp;</td>
                            <td class="style3">
                                &nbsp;</td>
                            <td class="style3">
                                &nbsp;</td>
                            <td class="style3">
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td class="style3" colspan="8" rowspan="2">
                                <asp:Panel ID="Panel2" runat="server">
                                    <table class="style1">
                                        <tr>
                                            <td class="style16">
                                                &nbsp;</td>
                                            <td class="style17">
                                                <strong>Damadged Quantity </strong>
                                            </td>
                                            <td>
                                                <asp:TextBox ID="txtDamagedQuantity" runat="server"></asp:TextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="style16">
                                                &nbsp;</td>
                                            <td class="style17">
                                                <strong>Description :</strong></td>
                                            <td>
                                                <asp:TextBox ID="txtDamadgesDescription" runat="server"></asp:TextBox>
                                            </td>
                                        </tr>
                                    </table>
                                </asp:Panel>
                            </td>
                            <td class="style3">
                                &nbsp;</td>
                            <td class="style3">
                                &nbsp;</td>
                            <td class="style3">
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td class="style3">
                                &nbsp;</td>
                            <td class="style3">
                                &nbsp;</td>
                            <td class="style3">
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td colspan="8">
                                &nbsp;&nbsp;</td>
                            <td>
                                &nbsp;</td>
                            <td>
                                &nbsp;</td>
                            <td>
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td colspan="4">
                                &nbsp;</td>
                            <td colspan="4">
                                <asp:Button ID="btnSubmit" runat="server" onclick="Button1_Click" 
                                    Text="Submit" />
                            </td>
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
            <td class="style14" colspan="5">
    <asp:GridView ID="GridView1" runat="server" onrowcommand="GridView1_RowCommand" 
                    onselectedindexchanged="GridView1_SelectedIndexChanged">
        <Columns>
            <asp:TemplateField HeaderText="Edit">
                <ItemTemplate>
                    <asp:LinkButton ID="LinkButton1" CommandName="Editt" CausesValidation="false" CommandArgument='<%#Eval("Received_Order_ID") %>' runat="server">Edit</asp:LinkButton>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Delete">
                <ItemTemplate>
                    <asp:LinkButton ID="LinkButton2" CommandName="Deletee" CausesValidation="false" CommandArgument='<%#Eval("Received_Order_ID") %>' runat="server">Delete</asp:LinkButton>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </asp:GridView>
            </td>
        </tr>
        <tr>
            <td class="style14">
                &nbsp;</td>
            <td colspan="2">
                &nbsp;</td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style14">
                &nbsp;</td>
            <td colspan="2">
                &nbsp;</td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style14">
                &nbsp;</td>
            <td colspan="2">
                &nbsp;</td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style14">
                &nbsp;</td>
            <td colspan="2">
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
