<%@ Page Title="" Language="C#" MasterPageFile="~/Employee/General/General_Employee.master" AutoEventWireup="true" CodeFile="Billing.aspx.cs" Inherits="Employee_General_Billing" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
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
        .style14
        {
        }
        .style15
        {
        }
    
* {
	padding: 0;
    margin-left: 98;
    margin-right: 0;
    }

a {
	text-decoration: underline;
	color: #0F8C8C;
}

     .style17
     {
         width: 1%;
     }
     .style20
     {
         width: 20%;
     }
     .style21
     {
     }
     .style22
     {
         width: 57%;
     }
     .style23
     {
         width: 517px;
     }

    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <form id="form1">
    <table class="style1">
        <tr>
            <td class="style17">
                &nbsp;</td>
            <td class="style15">
                &nbsp;</td>
            <td class="style21">
                &nbsp;</td>
            <td class="style22">
                &nbsp;</td>
            <td class="style17">
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style17">
                &nbsp;</td>
            <td class="style15">
                <asp:Button ID="btnFingerPrint" runat="server" onclick="btnFingerPrint_Click" 
                    Text="FingerPrint Scan" />
            </td>
            <td class="style21">
                <asp:TextBox ID="txtFingerPrint" runat="server"></asp:TextBox>
            </td>
            <td class="style22">
                &nbsp;</td>
            <td class="style17">
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style17">
                &nbsp;</td>
            <td class="style15">
                &nbsp;</td>
            <td class="style21">
                &nbsp;</td>
            <td class="style22">
                &nbsp;</td>
            <td class="style17">
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style17">
                &nbsp;</td>
            <td class="style15">
                Enter Customer ID :</td>
            <td class="style21">
                <asp:TextBox ID="txtCustomerID" runat="server"></asp:TextBox>
            </td>
            <td class="style22">
                <asp:Button ID="btnProceed" runat="server" onclick="btnProceed_Click" 
                    style="margin-left: 0px" Text="Proceed" />
            </td>
            <td class="style17">
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style17">
                &nbsp;</td>
            <td class="style23" colspan="2">
                &nbsp;</td>
            <td class="style22">
                &nbsp;</td>
            <td class="style17">
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style17">
                &nbsp;</td>
            <td class="style20">
                Name : 
                <asp:Label ID="lblName" runat="server" Text="Label"></asp:Label>
            </td>
            <td class="style21">
                &nbsp;</td>
            <td class="style22">
                &nbsp;</td>
            <td class="style17">
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style17">
                &nbsp;</td>
            <td class="style15">
                Contact No : 
                <asp:Label ID="lblContactNo" runat="server" Text="Label"></asp:Label>
            </td>
            <td class="style21">
                &nbsp;</td>
            <td class="style22">
                Email ID :
                <asp:Label ID="lblEmailID" runat="server" Text="Label"></asp:Label>
            </td>
            <td class="style17">
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style17">
                &nbsp;</td>
            <td class="style15" colspan="2">
                Address :
                <asp:Label ID="lblAddress" runat="server" Text="Label"></asp:Label>
            </td>
            <td class="style22">
                &nbsp;</td>
            <td class="style17">
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style17">
                &nbsp;</td>
            <td class="style15" colspan="2">
                Available Balance :&nbsp;
                <asp:Label ID="lblAvailBalance" runat="server" Text="Label"></asp:Label>
            </td>
            <td class="style22">
                <asp:Label ID="lblBenBal" runat="server"></asp:Label>
            </td>
            <td class="style17">
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style17">
                &nbsp;</td>
            <td class="style15" colspan="2">
                &nbsp;</td>
            <td class="style22">
                &nbsp;</td>
            <td class="style17">
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style17">
                &nbsp;</td>
            <td class="style15" colspan="2">
    <table class="style1">
        <tr>
            <td class="style17">
                &nbsp;</td>
            <td class="style15">
                <asp:Button ID="btnSMS" runat="server" onclick="btnSMS_Click" Text="SMS Code" />
            </td>
            <td class="style21">
                <asp:Label ID="lblSMSCode" runat="server" Text="Enter SMS Code :- "></asp:Label>
&nbsp;<asp:TextBox ID="txtSMSCode" runat="server"></asp:TextBox>
            </td>
            <td class="style17">
                &nbsp;</td>
        </tr>
    </table>
            </td>
            <td class="style22">
                <asp:Button ID="btnSend" runat="server" onclick="btnSend_Click" Text="Send" />
            </td>
            <td class="style17">
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style17">
                &nbsp;</td>
            <td class="style15" colspan="2">
                &nbsp;</td>
            <td class="style22">
                &nbsp;</td>
            <td class="style17">
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style17">
                &nbsp;</td>
            <td colspan="3">
                <asp:Panel ID="Panel1" runat="server">
                    <table class="style1" style="border-style: double">
                        <tr>
                            <td class="style11">
                                Item Name</td>
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
                            <td class="style6" colspan="7">
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
            <td class="style17">
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style17">
                &nbsp;</td>
            <td class="style23" colspan="2">
                &nbsp;</td>
            <td class="style22">
                &nbsp;</td>
            <td class="style17">
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style17">
                &nbsp;</td>
            <td class="style23" colspan="2">
                <asp:Button ID="btnProceedPayment" runat="server" Text="Proceed for Payment" 
                    onclick="btnProceedPayment_Click" />
            </td>
            <td class="style22">
                &nbsp;</td>
            <td class="style17">
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style17">
                &nbsp;</td>
            <td class="style23" colspan="2">
                &nbsp;</td>
            <td class="style22">
                &nbsp;</td>
            <td class="style17">
                &nbsp;</td>
        </tr>
    </table>
    <div>
    
    </div>
    </form>
</asp:Content>

