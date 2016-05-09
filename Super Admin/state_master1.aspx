<%@ Page Title="" Language="C#" MasterPageFile="~/Super Admin/admin.master" AutoEventWireup="true" CodeFile="state_master1.aspx.cs" Inherits="state_master1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">

        .style1
        {
            width: 100%;
        }
        .style14
        {
            height: 23px;
            font-size: x-large;
            text-align: center;
        }
        .style13
        {
            color: #FF0000;
        }
        .style2
        {
            height: 23px;
        }
        .style15
        {
            width: 162px;
        }
        .style16
        {
            height: 23px;
            width: 162px;
        }
        .style17
        {
            height: 23px;
            font-size: x-large;
            text-align: left;
        }
        </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table class="style1">
        <tr>
            <td class="style15">
                &nbsp;</td>
            <td colspan="3">
                <table class="style1">
                    <tr>
                        <td class="style17">
                            <strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; State Master</strong></td>
                    </tr>
                    <tr>
                        <td class="style14">
                            &nbsp;</td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td class="style15">
                &nbsp;</td>
            <td>
                Select Country Name :</td>
            <td>
                <asp:DropDownList ID="ddCountryName" runat="server" 
                    onselectedindexchanged="ddCountryName_SelectedIndexChanged" 
                    AutoPostBack="True">
                </asp:DropDownList>
                &nbsp;<span class="style13">*</span></td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                    ErrorMessage="Select Country Name" ControlToValidate="ddCountryName" 
                    ForeColor="Red"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="style15">
                &nbsp;</td>
            <td>
                Enter State Name :</td>
            <td>
                <asp:TextBox ID="txtStateName" runat="server"></asp:TextBox>
                &nbsp;<span class="style13">*</span></td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" 
                    ErrorMessage="Enter State Name" ControlToValidate="txtStateName" 
                    ForeColor="Red"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="style15">
                &nbsp;</td>
            <td>
                State Description :</td>
            <td>
                <asp:TextBox ID="txtDescription" runat="server" TextMode="MultiLine"></asp:TextBox>
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style16">
                &nbsp;</td>
            <td class="style2">
            </td>
            <td class="style2">
                &nbsp;</td>
            <td class="style2">
                <asp:Label ID="Label1" runat="server" ForeColor="Red"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="style15">
                &nbsp;</td>
            <td>
                <asp:Button ID="Button1" runat="server" Text="Insert" onclick="Button1_Click" 
                    style="height: 26px" />
            </td>
            <td>
                <asp:Button ID="Button2" runat="server" Text="Update" onclick="Button2_Click" />
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style15">
                &nbsp;</td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style15">
                &nbsp;</td>
            <td colspan="3">
    <asp:GridView ID="GridView1" runat="server" 
        onselectedindexchanged="GridView1_SelectedIndexChanged" 
        onrowcommand="GridView1_RowCommand">
        <Columns>
            <asp:TemplateField HeaderText="Edit">
                <ItemTemplate>
                    <asp:LinkButton ID="LinkButton1" CommandName="Editt" CausesValidation="false" CommandArgument='<%#Eval("State_ID") %>' runat="server">Edit</asp:LinkButton>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Delete">
                <ItemTemplate>
                    <asp:LinkButton ID="LinkButton2" CommandName="Deletee" CausesValidation="false" CommandArgument='<%#Eval("State_ID") %>' runat="server">Delete</asp:LinkButton>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </asp:GridView>
            </td>
        </tr>
        <tr>
            <td class="style15">
                &nbsp;</td>
            <td colspan="3">
                &nbsp;</td>
        </tr>
    </table>
</asp:Content>

