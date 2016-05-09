<%@ Page Language="C#" AutoEventWireup="true" CodeFile="stock of product.aspx.cs" Inherits="stock_of_product" %>

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

        </style>
</head>
<body>
    <form id="form1" runat="server">
    <table class="style1">
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
                Product Main Category :</td>
            <td>
                                <asp:DropDownList ID="ddProductMainCategory" runat="server" AutoPostBack="True" 
                                    
                    onselectedindexchanged="ddProductMainCategory_SelectedIndexChanged">
                                </asp:DropDownList>
                            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
            <td>
                Product Sub Category :</td>
            <td>
                                <asp:DropDownList ID="ddProductSubCategory" runat="server" AutoPostBack="True" 
                                    
                    onselectedindexchanged="ddProductSubCategory_SelectedIndexChanged">
                                </asp:DropDownList>
                            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
            <td>
                Product Name :</td>
            <td>
                                <asp:DropDownList ID="ddProductName" runat="server" 
                                    
                    onselectedindexchanged="ddProductName_SelectedIndexChanged">
                                </asp:DropDownList>
                            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
            <td>
                <asp:Button ID="btnSubmit" runat="server" onclick="btnSubmit_Click" 
                    Text="Submit" />
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
        <tr>
            <td>
                &nbsp;</td>
            <td>
                Total Quantity available :</td>
            <td>
                <asp:Label ID="lblQuantity" runat="server" Text="Label"></asp:Label>
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
    <div>
    
    </div>
    </form>
</body>
</html>
