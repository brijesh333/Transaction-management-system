<%@ Page Title="" Language="C#" MasterPageFile="~/Super Admin/admin.master" AutoEventWireup="true" CodeFile="tax_master1.aspx.cs" Inherits="tax_master1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">

        .style1
        {
            width: 100%;
        }
        .style2
        {
            width: 315px;
        }
        .style3
        {
            color: #FF0000;
        }
        .style5
        {
            width: 178px;
        }
        .style6
        {
            font-size: x-large;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table class="style1">
        <tr>
            <td class="style5">
                &nbsp;</td>
            <td class="style6" colspan="2">
                <strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Tax Master</strong></td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style5">
                &nbsp;</td>
            <td>
                &nbsp;</td>
            <td class="style2">
                    &nbsp;</td>
            <td>
                    &nbsp;</td>
        </tr>
        <tr>
            <td class="style5">
                &nbsp;</td>
            <td>
                    Enter Tax Name :</td>
            <td class="style2">
                <asp:TextBox ID="txtTaxName" runat="server"></asp:TextBox>
                &nbsp;<span class="style3">*</span></td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                        ControlToValidate="txtTaxName" ErrorMessage="Enter Tax Name" ForeColor="Red"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="style5">
                &nbsp;</td>
            <td>
                    Enter Tax Description :</td>
            <td class="style2">
                <asp:TextBox ID="txtDescription" runat="server" TextMode="MultiLine"></asp:TextBox>
            </td>
            <td>
                    &nbsp;</td>
        </tr>
        <tr>
            <td class="style5">
                &nbsp;</td>
            <td>
                    Service Tax Applied Date :</td>
            <td class="style2">
                <asp:TextBox ID="txtTaxAppliedDate" runat="server"></asp:TextBox>
                &nbsp;<span class="style3">*</span></td>
            <td>
                    &nbsp;</td>
        </tr>
        <tr>
            <td class="style5">
                &nbsp;</td>
            <td>
                    Enter Tax Rate ( in % ) :</td>
            <td class="style2">
                <asp:TextBox ID="txtTaxRate" runat="server"></asp:TextBox>
                &nbsp;<span class="style3">*</span></td>
            <td>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
                        ControlToValidate="txtTaxRate" ErrorMessage="Enter Proper Rate in % ( XX.XXX )" 
                        ForeColor="Red" ValidationExpression="\d{2}.\d{3}"></asp:RegularExpressionValidator>
            </td>
        </tr>
        <tr>
            <td class="style5">
                &nbsp;</td>
            <td>
                &nbsp;</td>
            <td class="style2">
                    &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style5">
                &nbsp;</td>
            <td>
                <asp:Button ID="btnInsert" runat="server" Text="Insert" 
                        onclick="btnInsert_Click" />
            </td>
            <td class="style2">
                <asp:Button ID="btnUpdate" runat="server" Text="Update" 
                        onclick="btnUpdate_Click" />
            </td>
            <td>
                <asp:Label ID="Label1" runat="server" ForeColor="Red"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="style5">
                &nbsp;</td>
            <td>
                &nbsp;</td>
            <td class="style2">
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style5">
                &nbsp;</td>
            <td colspan="3">
    <asp:GridView ID="GridView1" runat="server" onrowcommand="GridView1_RowCommand">
        <Columns>
            <asp:TemplateField HeaderText="Edit">
                <ItemTemplate>
                    <asp:LinkButton ID="LinkButton1" CommandName="Editt" CausesValidation="false" CommandArgument='<%#Eval("Tax_ID") %>' runat="server">Edit</asp:LinkButton>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Delete">
                <ItemTemplate>
                    <asp:LinkButton ID="LinkButton2" CommandName="Deletee" CausesValidation="false" CommandArgument='<%#Eval("Tax_ID") %>' runat="server">Delete</asp:LinkButton>
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
            <td class="style2">
                    &nbsp;</td>
            <td>
                    &nbsp;</td>
        </tr>
    </table>
</asp:Content>

