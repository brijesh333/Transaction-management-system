<%@ Page Title="" Language="C#" MasterPageFile="~/HR MasterPage.master" AutoEventWireup="true" CodeFile="HR_employee_activation1.aspx.cs" Inherits="HR_employee_activation" %><%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
    .style1
    {
        width: 100%;
        height: 243px;
    }
        .style2
        {
            width: 100%;
        }
        .style3
        {
            width: 280px;
        }
        .style4
        {
            height: 29px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <p>
    <br />
    <table class="style1">
        <tr>
            <td>
                <asp:TabContainer ID="TabContainer1" runat="server" ActiveTabIndex="0" 
                    Height="221px" ScrollBars="Both" Width="971px">
                    <asp:TabPanel ID="TabPanel1" runat="server" HeaderText="TabPanel1">
                        <HeaderTemplate>
                            Employee Request
                        </HeaderTemplate>
                        <ContentTemplate>
                            <asp:GridView ID="GridView1" runat="server" onrowcommand="GridView1_RowCommand" 
                                onselectedindexchanged="GridView1_SelectedIndexChanged">
                                <Columns>
                                    <asp:TemplateField HeaderText="Activate">
                                        <ItemTemplate>
                                            <asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="false" 
                                                CommandArgument='<%#Eval("Employee_ID") %>' CommandName="Activee">Active</asp:LinkButton>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Deactivate">
                                        <ItemTemplate>
                                            <asp:LinkButton ID="LinkButton3" runat="server" CausesValidation="false" 
                                                CommandArgument='<%#Eval("Employee_ID") %>' CommandName="Deactivee">Deactive</asp:LinkButton>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                </Columns>
                            </asp:GridView>
                            <br />
                        </ContentTemplate>
                    </asp:TabPanel>
                </asp:TabContainer>
            </td>
        </tr>
        <tr>
            <td>
                <br />
                <table class="style2">
                    <tr>
                        <td colspan="2">
                            <asp:Panel ID="Panel1" runat="server">
                                <table class="style2">
                                    <tr>
                                        <td>
                                            &nbsp;</td>
                                        <td class="style3">
                                            Employee ID :
                                            <asp:Label ID="lblEmpID" runat="server"></asp:Label>
                                        </td>
                                        <td colspan="10">
                                            &nbsp;</td>
                                        <td>
                                            &nbsp;</td>
                                        <td>
                                            &nbsp;</td>
                                        <td>
                                            &nbsp;</td>
                                    </tr>
                                    <tr>
                                        <td>
                                            &nbsp;</td>
                                        <td class="style3">
                                            Employee Name :
                                            <asp:Label ID="lblEmployeeName" runat="server"></asp:Label>
                                        </td>
                                        <td colspan="10">
                                            &nbsp;</td>
                                        <td>
                                            &nbsp;</td>
                                        <td>
                                            &nbsp;</td>
                                        <td>
                                            &nbsp;</td>
                                    </tr>
                                    <tr>
                                        <td>
                                            &nbsp;</td>
                                        <td colspan="3">
                                            &nbsp;</td>
                                        <td colspan="2">
                                            &nbsp;</td>
                                        <td colspan="3">
                                            &nbsp;</td>
                                        <td colspan="2">
                                            &nbsp;</td>
                                        <td>
                                            &nbsp;</td>
                                        <td>
                                            &nbsp;</td>
                                        <td>
                                            &nbsp;</td>
                                        <td>
                                            &nbsp;</td>
                                    </tr>
                                    <tr>
                                        <td class="style4">
                                        </td>
                                        <td class="style4" colspan="3">
                                            Type :&nbsp;&nbsp;&nbsp;
                                            <asp:DropDownList ID="ddEmp_Type" runat="server">
                                            </asp:DropDownList>
                                        </td>
                                        <td class="style4" colspan="2">
                                            &nbsp;</td>
                                        <td class="style4" colspan="3">
                                        </td>
                                        <td class="style4" colspan="2">
                                        </td>
                                        <td class="style4">
                                        </td>
                                        <td class="style4">
                                        </td>
                                        <td class="style4">
                                        </td>
                                        <td class="style4">
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            &nbsp;</td>
                                        <td class="style3">
                                            Salary :</td>
                                        <td colspan="6">
                                            <asp:TextBox ID="txtSalary" runat="server"></asp:TextBox>
                                        </td>
                                        <td colspan="2">
                                            &nbsp;</td>
                                        <td colspan="3">
                                            &nbsp;</td>
                                        <td>
                                            &nbsp;</td>
                                        <td>
                                            &nbsp;</td>
                                    </tr>
                                    <tr>
                                        <td>
                                            &nbsp;</td>
                                        <td colspan="2">
                                            Working Branch :</td>
                                        <td colspan="2">
                                            <asp:DropDownList ID="ddWorkingBranch" runat="server" 
                                                onselectedindexchanged="ddWorkingBranch0_SelectedIndexChanged">
                                            </asp:DropDownList>
                                        </td>
                                        <td colspan="2">
                                            &nbsp;</td>
                                        <td colspan="3">
                                            &nbsp;</td>
                                        <td colspan="3">
                                            &nbsp;</td>
                                        <td>
                                            &nbsp;</td>
                                        <td>
                                            &nbsp;</td>
                                    </tr>
                                    <tr>
                                        <td>
                                            &nbsp;</td>
                                        <td colspan="2">
                                            Department :</td>
                                        <td colspan="2">
                                            <asp:DropDownList ID="ddDepartment" runat="server">
                                            </asp:DropDownList>
                                        </td>
                                        <td colspan="2">
                                            &nbsp;</td>
                                        <td colspan="3">
                                            &nbsp;</td>
                                        <td colspan="3">
                                            &nbsp;</td>
                                        <td>
                                            &nbsp;</td>
                                        <td>
                                            &nbsp;</td>
                                    </tr>
                                    <tr>
                                        <td>
                                            &nbsp;</td>
                                        <td colspan="2">
                                            Designation :</td>
                                        <td colspan="2">
                                            <asp:DropDownList ID="ddDesignation" runat="server">
                                            </asp:DropDownList>
                                        </td>
                                        <td colspan="2">
                                            &nbsp;</td>
                                        <td colspan="3">
                                            &nbsp;</td>
                                        <td colspan="3">
                                            &nbsp;</td>
                                        <td>
                                            &nbsp;</td>
                                        <td>
                                            &nbsp;</td>
                                    </tr>
                                    <tr>
                                        <td>
                                            &nbsp;</td>
                                        <td colspan="2">
                                            &nbsp;</td>
                                        <td colspan="2">
                                            &nbsp;</td>
                                        <td colspan="2">
                                            &nbsp;</td>
                                        <td colspan="3">
                                            &nbsp;</td>
                                        <td colspan="3">
                                            &nbsp;</td>
                                        <td>
                                            &nbsp;</td>
                                        <td>
                                            &nbsp;</td>
                                    </tr>
                                    <tr>
                                        <td>
                                            &nbsp;</td>
                                        <td colspan="2">
                                            <asp:Button ID="btnSubmit" runat="server" onclick="btnSubmit_Click" 
                                                Text="Activate" />
                                        </td>
                                        <td colspan="2">
                                            <asp:Button ID="btnCancel" runat="server" onclick="btnCancel_Click" 
                                                Text="Cancel" />
                                        </td>
                                        <td colspan="2">
                                            &nbsp;</td>
                                        <td colspan="3">
                                            &nbsp;</td>
                                        <td colspan="3">
                                            &nbsp;</td>
                                        <td>
                                            &nbsp;</td>
                                        <td>
                                            &nbsp;</td>
                                    </tr>
                                    <tr>
                                        <td>
                                            &nbsp;</td>
                                        <td colspan="12">
                                            <asp:Label ID="lblTemp" runat="server" Visible="False"></asp:Label>
                                        </td>
                                        <td>
                                            &nbsp;</td>
                                        <td>
                                            &nbsp;</td>
                                    </tr>
                                </table>
                            </asp:Panel>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            &nbsp;</td>
                        <td>
                            &nbsp;</td>
                    </tr>
                </table>
                <asp:ScriptManager ID="ScriptManager1" runat="server">
                </asp:ScriptManager>
            </td>
        </tr>
    </table>
</p>
</asp:Content>

