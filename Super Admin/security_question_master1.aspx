﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Super Admin/admin.master" AutoEventWireup="true" CodeFile="security_question_master1.aspx.cs" Inherits="security_question_master1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .style14
        {
            font-size: x-large;
            text-align: center;
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
            width: 72px;
        }
        .style16
        {
            width: 72px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table class="style1">
        <tr>
            <td class="style15">
                &nbsp;</td>
            <td class="style14" colspan="3">
                <strong>Security Question Master</strong></td>
        </tr>
        <tr>
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
            <td class="style16">
                &nbsp;</td>
            <td>
                Enter security Question : 
            </td>
            <td>
                <asp:TextBox ID="txtSecurityQuestion" runat="server" Width="200px"></asp:TextBox>
                &nbsp;<span class="style13">*</span></td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                    ErrorMessage="Enter Security Question" 
                    ControlToValidate="txtSecurityQuestion" ForeColor="Red"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="style16">
                &nbsp;</td>
            <td>
                Description :</td>
            <td>
                <asp:TextBox ID="txtDescription" runat="server" TextMode="MultiLine"></asp:TextBox>
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style16">
                &nbsp;</td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
            <td>
                <asp:Label ID="Label1" runat="server" ForeColor="Red"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="style16">
                &nbsp;</td>
            <td>
                <asp:Button ID="Button1" runat="server" onclick="Button1_Click" Text="Insert" />
            </td>
            <td>
                <asp:Button ID="Button2" runat="server" onclick="Button2_Click" Text="Update" />
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
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
            <td class="style16">
                &nbsp;</td>
            <td colspan="3">
    <asp:GridView ID="GridView1" runat="server" onrowcommand="GridView1_RowCommand" 
        onselectedindexchanged="GridView1_SelectedIndexChanged">
        <Columns>
            <asp:TemplateField HeaderText="Edit">
                <ItemTemplate>
                    <asp:LinkButton ID="LinkButton1" CommandName="Editt" CausesValidation="false" CommandArgument='<%#Eval("Security_ID") %>' runat="server">Edit</asp:LinkButton>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Delete">
                <ItemTemplate>
                    <asp:LinkButton ID="LinkButton2" CommandName="Deletee" CausesValidation="false" CommandArgument='<%#Eval("Security_ID") %>' runat="server">Delete</asp:LinkButton>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </asp:GridView>
            </td>
        </tr>
        <tr>
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

