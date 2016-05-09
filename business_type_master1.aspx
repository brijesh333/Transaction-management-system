<%@ Page Title="" Language="C#" MasterPageFile="~/Admin MasterPage.master" AutoEventWireup="true" CodeFile="business_type_master1.aspx.cs" Inherits="business_type_master1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">

        .style2
        {
            font-size: x-large;
            text-align: center;
        }
        .style6
        {
            width: 246px;
        }
        .style5
        {
            width: 343px;
        }
        .style7
        {
            color: #FF0000;
        }
        .style1
        {
            width: 100%;
        }
        .style8
        {
            font-size: x-large;
            text-align: center;
            width: 25px;
        }
        .style9
        {
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table class="style1">
        <tr>
            <td class="style8">
                &nbsp;</td>
            <td class="style2" colspan="3">
                <strong>Business Type Master</strong></td>
        </tr>
        <tr>
            <td class="style9">
                &nbsp;</td>
            <td class="style6">
                &nbsp;</td>
            <td colspan="2">
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style9">
                &nbsp;</td>
            <td class="style6">
                Business Type Name :</td>
            <td class="style5">
                <asp:TextBox ID="txtBusinessType" runat="server"></asp:TextBox>
                <span class="style7">*</span></td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                    ControlToValidate="txtBusinessType" 
                    ErrorMessage="Enter Proper Business Type Name" ForeColor="Red"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="style9">
                &nbsp;</td>
            <td class="style6">
                Descrption :</td>
            <td class="style5">
                <asp:TextBox ID="txtBusinessDes" runat="server"></asp:TextBox>
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style9">
                &nbsp;</td>
            <td class="style6">
                &nbsp;</td>
            <td class="style5">
                &nbsp;</td>
            <td>
                <asp:Label ID="Label1" runat="server" style="color: #FF0000" Text="Label"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="style9">
                &nbsp;</td>
            <td class="style6">
                <asp:Button ID="btnInsert" runat="server" onclick="btnInsert_Click" 
                    Text="Insert" />
            </td>
            <td colspan="2">
                <asp:Button ID="btnUpdate" runat="server" onclick="btnUpdate_Click" 
                    Text="Update" />
            </td>
        </tr>
        <tr>
            <td class="style9">
                &nbsp;</td>
            <td class="style6">
                &nbsp;</td>
            <td class="style5">
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style9">
                &nbsp;</td>
            <td class="style9" colspan="3">
    <asp:GridView ID="GridView1" runat="server" onrowcommand="GridView1_RowCommand" 
        onselectedindexchanged="GridView1_SelectedIndexChanged">
        <Columns>
            <asp:TemplateField HeaderText="Edit">
                <ItemTemplate>
                    <asp:LinkButton ID="LinkButton1" CommandName="Editt" CausesValidation="false" CommandArgument='<%#Eval("Bus_Type_ID") %>' runat="server">Edit</asp:LinkButton>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Delete">
                <ItemTemplate>
                    <asp:LinkButton ID="LinkButton2" CommandName="Deletee" CausesValidation="false" CommandArgument='<%#Eval("Bus_Type_ID") %>' runat="server">Delete</asp:LinkButton>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </asp:GridView>
                </td>
        </tr>
        <tr>
            <td class="style9">
                &nbsp;</td>
            <td class="style6">
                &nbsp;</td>
            <td class="style5">
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
    </table>
</asp:Content>

