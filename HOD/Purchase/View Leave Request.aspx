<%@ Page Title="" Language="C#" MasterPageFile="~/HOD/Purchase/Purchase_HOD.master" AutoEventWireup="true" CodeFile="View Leave Request.aspx.cs" Inherits="HOD_Purchase_View_Leave_Request" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .style1
        {
            width: 100%;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table class="style1">
        <tr>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td colspan="2">
                                        <asp:GridView runat="server" Width="463px" 
                    ID="GridView1" OnRowCommand="GridView1_RowCommand" 
                    OnSelectedIndexChanged="GridView1_SelectedIndexChanged"><Columns>
<asp:TemplateField HeaderText="Approve"><ItemTemplate>
                                                        <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="false" 
                                                            CommandArgument='<%#Eval("Leave_Form_ID") %>' CommandName="Approve">Approve</asp:LinkButton>
                                                    
</ItemTemplate>
</asp:TemplateField>
<asp:TemplateField HeaderText="Reject"><ItemTemplate>
                                                        <asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="false" 
                                                            CommandArgument='<%#Eval("Leave_Form_ID") %>' CommandName="Reject">Reject</asp:LinkButton>
                                                    
</ItemTemplate>
</asp:TemplateField>
</Columns>
</asp:GridView>

                                    </td>
        </tr>
        <tr>
            <td>
                <asp:ScriptManager ID="ScriptManager1" runat="server">
                </asp:ScriptManager>
            </td>
            <td>
                &nbsp;</td>
        </tr>
    </table>
</asp:Content>

