<%@ Page Title="" Language="C#" MasterPageFile="~/Super Admin/admin.master" AutoEventWireup="true" CodeFile="Country_Master.aspx.cs" Inherits="Super_Admin_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .style14
        {
            font-size: x-large;
            text-align: left;
        }
        .style13
        {
            color: #FF0000;
        }
        .style1
        {
            width: 100%;
        }
        .style15
        {
            font-size: x-large;
            text-align: center;
            width: 12px;
        }
        .style16
        {
            width: 12px;
        }
        .style17
        {
            font-size: x-large;
            text-align: center;
            width: 149px;
        }
        .style18
        {
            width: 149px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <table class="style1">
        <tr>
            <td class="style17">
                &nbsp;</td>
            <td class="style15">
                &nbsp;</td>
            <td class="style14" colspan="3">
                <strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Country Master</strong></td>
        </tr>
        <tr>
            <td class="style18">
                &nbsp;</td>
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
            <td class="style18">
                &nbsp;</td>
            <td class="style16">
                &nbsp;</td>
            <td>
                Country Name</td>
            <td>
                <asp:TextBox ID="txtCountryName" runat="server"></asp:TextBox>
                &nbsp;<span class="style13">*</span></td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                    ErrorMessage="Enter Proper Country Name" 
                    ControlToValidate="txtCountryName" ForeColor="Red"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="style18">
                &nbsp;</td>
            <td class="style16">
                &nbsp;</td>
            <td>
                Country Description :</td>
            <td>
                <asp:TextBox ID="txtDescription" runat="server" Height="33px" 
                    TextMode="MultiLine" Width="179px"></asp:TextBox>
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style18">
                &nbsp;</td>
            <td class="style16">
                &nbsp;</td>
            <td>
                &nbsp;</td>
            <td>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:DatabaseConnectionString %>" 
                    DeleteCommand="DELETE FROM [Country_Master] WHERE [Country_ID] = @Country_ID" 
                    InsertCommand="INSERT INTO [Country_Master] ([Country_Name], [Country_Description]) VALUES (@Country_Name, @Country_Description)" 
                    SelectCommand="SELECT * FROM [Country_Master]" 
                    UpdateCommand="UPDATE [Country_Master] SET [Country_Name] = @Country_Name, [Country_Description] = @Country_Description WHERE [Country_ID] = @Country_ID">
                    <DeleteParameters>
                        <asp:Parameter Name="Country_ID" Type="Int32" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="Country_Name" Type="String" />
                        <asp:Parameter Name="Country_Description" Type="String" />
                    </InsertParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="Country_Name" Type="String" />
                        <asp:Parameter Name="Country_Description" Type="String" />
                        <asp:Parameter Name="Country_ID" Type="Int32" />
                    </UpdateParameters>
                </asp:SqlDataSource>
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style18">
                &nbsp;</td>
            <td class="style16">
                &nbsp;</td>
            <td>
                <asp:Button ID="Button1" runat="server" Text="Insert" onclick="Button1_Click" />
            </td>
            <td>
                <asp:Button ID="Button2" runat="server" Text="Update" onclick="Button2_Click" />
            </td>
            <td>
                <asp:Label ID="Label1" runat="server" ForeColor="Red"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="style18">
                &nbsp;</td>
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
            <td class="style18">
                &nbsp;</td>
            <td colspan="4">
    <asp:GridView ID="GridView1" runat="server" onrowcommand="GridView1_RowCommand" 
                    onselectedindexchanged="GridView1_SelectedIndexChanged">
        <Columns>
            <asp:TemplateField HeaderText="Edit">
                <ItemTemplate>
                    <asp:LinkButton ID="LinkButton1" CommandName="Editt" CausesValidation="false" CommandArgument='<%#Eval("Country_ID") %>' runat="server">Edit</asp:LinkButton>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Delete">
                <ItemTemplate>
                    <asp:LinkButton ID="LinkButton2" CommandName="Deletee" CausesValidation="false" CommandArgument='<%#Eval("Country_ID") %>' runat="server">Delete</asp:LinkButton>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </asp:GridView>
            </td>
        </tr>
        <tr>
            <td class="style18">
                &nbsp;</td>
            <td class="style16">
                &nbsp;</td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>

    </table>
</asp:Content>


