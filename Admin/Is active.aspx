<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Is active.aspx.cs" Inherits="Is_active" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
    </div>
    <asp:GridView ID="GridView1" runat="server" onrowcommand="GridView1_RowCommand" 
        onselectedindexchanged="GridView1_SelectedIndexChanged">
        <Columns>
            <asp:TemplateField HeaderText="Activate">
                <ItemTemplate>
                    <asp:LinkButton ID="LinkButton2" CommandName="Activee" CommandArgument='<%#Eval("Employee_ID") %>' runat="server" CausesValidation="false">Active</asp:LinkButton>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Deactivate">
            <ItemTemplate>
                    <asp:LinkButton ID="LinkButton3" CommandName="Deactivee" CommandArgument='<%#Eval("Employee_ID") %>' runat="server" CausesValidation="false">Deactive</asp:LinkButton>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </asp:GridView>
    </form>
</body>
</html>
