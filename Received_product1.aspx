<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Received_product1.aspx.cs" Inherits="Received_product1" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .style1
        {
            width: 100%;
        }
        
* {
	margin: 0;
	padding: 0;
}

        .style2
        {
            height: 22px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <table class="style1">
            <tr>
                <td>
                    Product Main Category :</td>
                <td>
                                <asp:DropDownList ID="ddProductMainCategory" runat="server" AutoPostBack="True" 
                                    
                        onselectedindexchanged="ddProductMainCategory_SelectedIndexChanged">
                                </asp:DropDownList>
                            </td>
                <td>
                    <asp:Label ID="lblMainProduct" runat="server" Text="Label"></asp:Label>
                </td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style2">
                    Product Sub Catedory :</td>
                <td class="style2">
                                <asp:DropDownList ID="ddProductSubCategory" runat="server" AutoPostBack="True" 
                                    
                        onselectedindexchanged="ddProductSubCategory_SelectedIndexChanged">
                                </asp:DropDownList>
                            </td>
                <td class="style2">
                    <asp:Label ID="lblSubProduct" runat="server" Text="Label"></asp:Label>
                </td>
                <td class="style2">
                </td>
            </tr>
            <tr>
                <td class="style2">
                    Product Name :</td>
                <td class="style2">
                                <asp:DropDownList ID="ddProductName" runat="server" 
                                    onselectedindexchanged="ddProductName_SelectedIndexChanged">
                                </asp:DropDownList>
                            </td>
                <td class="style2">
                    <asp:Label ID="lblProduct" runat="server" Text="Label"></asp:Label>
                </td>
                <td class="style2">
                </td>
            </tr>
            <tr>
                <td class="style2">
                    Color :</td>
                <td class="style2">
                    <asp:TextBox ID="txtColor" runat="server"></asp:TextBox>
                </td>
                <td class="style2">
                    &nbsp;</td>
                <td class="style2">
                </td>
            </tr>
            <tr>
                <td>
                    Quantity :</td>
                <td>
                    <asp:TextBox ID="txtQuantity" runat="server"></asp:TextBox>
                </td>
                <td>
                    <asp:Label ID="Label9" runat="server" Text="Label"></asp:Label>
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
                    <asp:Label ID="lblItemCode" runat="server" Text="Label"></asp:Label>
                </td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td>
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
        </table>
    
    </div>
    </form>
</body>
</html>
