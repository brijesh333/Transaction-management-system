<%@ Page Title="" Language="C#" MasterPageFile="~/Super Admin/admin.master" AutoEventWireup="true" CodeFile="branch_master1.aspx.cs" Inherits="branch_master1" %>

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
        .style2
        {
            height: 26px;
        }
        .style3
        {
            height: 40px;
        }
        .style1
        {
            width: 100%;
        }
        .style15
        {
            font-size: x-large;
            text-align: center;
            width: 127px;
        }
        .style16
        {
            width: 127px;
        }
        .style17
        {
            height: 26px;
            width: 127px;
        }
        .style18
        {
            height: 40px;
            width: 127px;
        }
        </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table class="style1">
        <tr>
            <td class="style15">
                &nbsp;</td>
            <td class="style14" colspan="3">
                <strong>Branch Master</strong></td>
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
                Select Country :</td>
            <td>
                <asp:DropDownList ID="ddCountryName" runat="server" AutoPostBack="True" 
                    onselectedindexchanged="ddCountryName_SelectedIndexChanged">
                </asp:DropDownList>
                &nbsp;<span class="style13">*</span></td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                    ErrorMessage="Select Country Name" ControlToValidate="ddCountryName" 
                    ForeColor="Red"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="style16">
                &nbsp;</td>
            <td>
                Select State :</td>
            <td>
                <asp:DropDownList ID="ddStateName" runat="server" AutoPostBack="True" 
                    onselectedindexchanged="ddStateName_SelectedIndexChanged">
                </asp:DropDownList>
                &nbsp;<span class="style13">*</span></td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                    ErrorMessage="Select State Name" ControlToValidate="ddStateName" 
                    ForeColor="Red"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="style16">
                &nbsp;</td>
            <td>
                Select City :</td>
            <td>
                <asp:DropDownList ID="ddCityName" runat="server" 
                    onselectedindexchanged="ddCityName_SelectedIndexChanged">
                </asp:DropDownList>
                &nbsp;<span class="style13">*</span></td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                    ErrorMessage="Select City Name" ControlToValidate="txtBranchName" 
                    ForeColor="Red"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="style17">
                &nbsp;</td>
            <td class="style2">
                Enter Branch Name :</td>
            <td class="style2">
                <asp:TextBox ID="txtBranchName" runat="server"></asp:TextBox>
                &nbsp;<span class="style13">*</span></td>
            <td class="style2">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                    ErrorMessage="Enter Branch Name" ControlToValidate="txtBranchName" 
                    ForeColor="Red"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="style18">
                &nbsp;</td>
            <td class="style3">
                Description :</td>
            <td class="style3">
                <asp:TextBox ID="txtDescription" runat="server" TextMode="MultiLine"></asp:TextBox>
            </td>
            <td class="style3">
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
                <asp:Label ID="Label1" runat="server" ForeColor="Red"></asp:Label>
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
        <tr>
            <td class="style16">
                &nbsp;</td>
            <td>
                <asp:Button ID="Button1" runat="server" Text="Insert" onclick="Button1_Click" 
                    style="width: 48px" />
            </td>
            <td>
                <asp:Button ID="Button2" runat="server" Text="Update" onclick="Button2_Click" />
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
                    <asp:LinkButton ID="LinkButton1" CommandName="Editt" CausesValidation="false" CommandArgument='<%#Eval("Branch_ID") %>' runat="server">Edit</asp:LinkButton>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Delete">
                <ItemTemplate>
                    <asp:LinkButton ID="LinkButton2" CommandName="Deletee" CausesValidation="false" CommandArgument='<%#Eval("Branch_ID") %>' runat="server">Delete</asp:LinkButton>
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

