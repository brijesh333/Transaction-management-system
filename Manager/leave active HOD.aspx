<%@ Page Language="C#" AutoEventWireup="true" CodeFile="leave active HOD.aspx.cs" Inherits="leave_avtivate_HOD" %>

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
            <asp:TemplateField HeaderText="Approve">
                <ItemTemplate>
                    <asp:LinkButton ID="LinkButton1" CommandName="Approve" CausesValidation="false" CommandArgument='<%#Eval("Leave_Form_ID") %>' runat="server">Approve</asp:LinkButton>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Reject">
                <ItemTemplate>
                    <asp:LinkButton ID="LinkButton2" CommandName="Reject" CausesValidation="false" CommandArgument='<%#Eval("Leave_Form_ID") %>' runat="server">Reject</asp:LinkButton>
                </ItemTemplate>
            </asp:TemplateField>
            
        </Columns>
    </asp:GridView>
    </form>
</body>
</html>
