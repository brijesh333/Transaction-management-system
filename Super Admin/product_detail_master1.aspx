<%@ Page Title="" Language="C#" MasterPageFile="~/Super Admin/admin.master" AutoEventWireup="true" CodeFile="product_detail_master1.aspx.cs" Inherits="product_detail_master1" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">

        .style1
        {
            width: 100%;
        }
        .style4
        {
            text-align: center;
            font-size: x-large;
        }
        .style3
        {
        }
        .style2
        {
            width: 224px;
        }
        .style5
        {
            text-align: center;
            font-size: x-large;
            width: 37px;
        }
        .style6
        {
        }
        .style7
        {
            width: 352px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table class="style1">
        <tr>
            <td class="style5" style="text-align: center; font-size: x-large">
                &nbsp;</td>
            <td class="style4" colspan="3" style="text-align: center; font-size: x-large">
                <strong>Product Master Form</strong></td>
        </tr>
        <tr>
            <td class="style5" style="text-align: center; font-size: x-large">
                &nbsp;</td>
            <td class="style4" colspan="3" style="text-align: center; font-size: x-large">
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style6">
                &nbsp;</td>
            <td class="style7">
                    Select&nbsp; Product Main Category:
                </td>
            <td class="style2">
                <asp:DropDownList ID="ddMainProduct" runat="server" AutoPostBack="True" 
                    onselectedindexchanged="ddMainProduct_SelectedIndexChanged1">
                </asp:DropDownList>
            </td>
            <td>
                    &nbsp;</td>
        </tr>
        <tr>
            <td class="style6">
                &nbsp;</td>
            <td class="style7">
                    Select Product Sub Category:</td>
            <td class="style2">
                <asp:DropDownList ID="ddSubProduct" runat="server">
                </asp:DropDownList>
            </td>
            <td>
                    &nbsp;</td>
        </tr>
        <tr>
            <td class="style6">
                &nbsp;</td>
            <td class="style7">
                    Enter Product Name:</td>
            <td class="style2">
                <asp:TextBox ID="txtProductname" runat="server"></asp:TextBox>
            </td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                        ControlToValidate="txtProductname" ErrorMessage="Enter Product Name"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="style6">
                &nbsp;</td>
            <td class="style7">
                    Enter Product Description:</td>
            <td class="style2">
                <asp:TextBox ID="txtDes" runat="server"></asp:TextBox>
            </td>
            <td>
                    &nbsp;</td>
        </tr>
        <tr>
            <td class="style6">
                &nbsp;</td>
            <td class="style7">
                    Enter Product Code:</td>
            <td class="style2">
                <asp:TextBox ID="txtProductCode" runat="server"></asp:TextBox>
            </td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                        ControlToValidate="txtProductCode" ErrorMessage="Enter Product Code"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="style6">
                &nbsp;</td>
            <td class="style7">
                    Enter Product Model Name/No:</td>
            <td class="style2">
                <asp:TextBox ID="txtProductModel" runat="server"></asp:TextBox>
            </td>
            <td>
                    &nbsp;</td>
        </tr>
        <tr>
            <td class="style6">
                &nbsp;</td>
            <td class="style7">
                    Select From Available Product Colours:</td>
            <td class="style2">
                <asp:CheckBoxList ID="cbProductcolor" runat="server" AutoPostBack="True" 
                        onselectedindexchanged="cbProductcolor_SelectedIndexChanged1" 
                        RepeatDirection="Horizontal">
                    <asp:ListItem>Black</asp:ListItem>
                    <asp:ListItem>Blue</asp:ListItem>
                    <asp:ListItem>Pink</asp:ListItem>
                    <asp:ListItem>White</asp:ListItem>
                    <asp:ListItem>Red</asp:ListItem>
                    <asp:ListItem>Other</asp:ListItem>
                </asp:CheckBoxList>
            </td>
            <td>
                <asp:Label ID="Label2" runat="server" Visible="False"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="style6">
                &nbsp;</td>
            <td class="style7">
                <asp:Label ID="othercolour" runat="server" Text="Enter Other Colour" 
                        Visible="False"></asp:Label>
            </td>
            <td class="style2">
                <asp:TextBox ID="txtOtherProductColour" runat="server" Visible="False"></asp:TextBox>
            </td>
            <td>
                    &nbsp;</td>
        </tr>
        <tr>
            <td class="style6">
                &nbsp;</td>
            <td class="style7">
                    Enter Product Price(In 
                    Rs. ):</td>
            <td class="style2">
                <asp:TextBox ID="txtProductPrice" runat="server"></asp:TextBox>
            </td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                        ControlToValidate="txtProductPrice" ErrorMessage="Enter Price Of Product"></asp:RequiredFieldValidator>
&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
                        ControlToValidate="txtProductPrice" 
                        ErrorMessage="Enter valid expression in minimumX.XX format" 
                        ValidationExpression="(\d{1,3}(\,\d{3})*|(\d+))(\.\d{2})?$"></asp:RegularExpressionValidator>
            </td>
        </tr>
        <tr>
            <td class="style6">
                &nbsp;</td>
            <td class="style7">
                    Company Name :</td>
            <td class="style2">
                <asp:TextBox ID="txtCompanyName" runat="server"></asp:TextBox>
            </td>
            <td>
                    &nbsp;</td>
        </tr>
        <tr>
            <td class="style6">
                &nbsp;</td>
            <td class="style7">
                    Company Address :</td>
            <td class="style2">
                <asp:TextBox ID="txtCompanyAddress" runat="server"></asp:TextBox>
            </td>
            <td>
                    &nbsp;</td>
        </tr>
        <tr>
            <td class="style6">
                &nbsp;</td>
            <td class="style7">
                &nbsp;</td>
            <td class="style2">
                    &nbsp;</td>
            <td>
                <asp:Label ID="Label4" runat="server"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="style6">
                &nbsp;</td>
            <td class="style7">
                <asp:Button ID="btnSubmit" runat="server" Text="Submit" 
                        onclick="btnSubmit_Click" />
            </td>
            <td class="style2">
                <asp:Button ID="btnUpdate" runat="server" Text="Update" 
                        onclick="btnUpdate_Click" />
            </td>
            <td>
                <asp:Label ID="Label1" runat="server"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="style6">
                &nbsp;</td>
            <td class="style7">
                &nbsp;</td>
            <td class="style2">
                    <asp:ScriptManager ID="ScriptManager1" runat="server">
                    </asp:ScriptManager>
            </td>
            <td>
                    &nbsp;</td>
        </tr>
        <tr>
            <td class="style6" colspan="4">
                <asp:TabContainer ID="TabContainer1" runat="server" ActiveTabIndex="0" 
                    Height="238px" ScrollBars="Both" Width="957px">
                    <asp:TabPanel ID="TabPanel1" runat="server" HeaderText="TabPanel1">
                        <HeaderTemplate>
                            Details
                        </HeaderTemplate>
                        <ContentTemplate>
                            <asp:GridView ID="GridView1" runat="server" onrowcommand="GridView1_RowCommand">
                                <Columns>
                                    <asp:TemplateField HeaderText="Edit">
                                        <ItemTemplate>
                                            <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="false" 
                                                CommandArgument='<%#Eval("Product_ID") %>' CommandName="editt">Edit</asp:LinkButton>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Delete">
                                        <ItemTemplate>
                                            <asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="false" 
                                                CommandArgument='<%#Eval("Product_ID") %>' CommandName="deletee">Delete</asp:LinkButton>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                </Columns>
                            </asp:GridView>
                        </ContentTemplate>
                    </asp:TabPanel>
                </asp:TabContainer>
            </td>
        </tr>
        <tr>
            <td class="style6">
                &nbsp;</td>
            <td class="style7">
                &nbsp;</td>
            <td class="style2">
                    &nbsp;</td>
            <td>
                    &nbsp;</td>
        </tr>
        <tr>
            <td class="style6">
                &nbsp;</td>
            <td class="style3" colspan="3">
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style6">
                &nbsp;</td>
            <td class="style7">
                &nbsp;</td>
            <td class="style2">
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
    </table>
</asp:Content>

