<%@ Page Title="" Language="C#" MasterPageFile="~/Employee/Purchase/Purchase_Employee.master" AutoEventWireup="true" CodeFile="Apply For Leave.aspx.cs" Inherits="Employee_Account_Apply_For_Leave" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>

<%--<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
</asp:Content>
--%><asp:Content ID="Content2" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .style1
    {
        width: 89%;
    }
        .style10
        {
            height: 30px;
            width: 235px;
        }
        .style13
        {
            color: #FF0000;
        }
        .style6
        {
            height: 30px;
        }
        .style22
        {
    }
        .style11
        {
            width: 235px;
        }
        .style20
        {
            width: 234px;
        }
        .style21
        {
        }
        .style23
    {
        width: 297px;
    }
        .style24
        {
            height: 30px;
            width: 183px;
        }
        .style25
        {
            width: 183px;
        }
        .style26
        {
            width: 406px;
        }
        .style27
        {
            width: 406px;
            height: 30px;
        }
        .style28
        {
            width: 298px;
        }
        .style29
        {
            width: 696px;
            height: 30px;
        }
        .style30
        {
            width: 696px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <p>
    <br />
    <table class="style1">
        <tr>
            <td class="style24">
                &nbsp;</td>
            <td class="style29">
                Subject Of Leave :</td>
            <td class="style10">
                <asp:TextBox ID="txtSubOfLeave" runat="server"></asp:TextBox>
            &nbsp;<span class="style13">*</span></td>
            <td class="style27">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                    ControlToValidate="txtSubOfLeave" ErrorMessage="Enter Proper Subject of leave" 
                    ForeColor="Red"></asp:RequiredFieldValidator>
            </td>
            <td class="style6">
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style25">
                &nbsp;</td>
            <td class="style30">
                Type :</td>
            <td class="style11">
                <asp:DropDownList ID="ddType" runat="server">
                </asp:DropDownList>
            &nbsp;<span class="style13">*</span></td>
            <td class="style26">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                    ControlToValidate="ddType" ErrorMessage="Select Proper Type" ForeColor="Red"></asp:RequiredFieldValidator>
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style25">
                &nbsp;</td>
            <td class="style30">
                Leave For :</td>
            <td class="style11">
                <asp:RadioButtonList ID="rbLeave" runat="server" RepeatDirection="Horizontal" 
                    AutoPostBack="True" onselectedindexchanged="rbLeave_SelectedIndexChanged">
                    <asp:ListItem>Full</asp:ListItem>
                    <asp:ListItem>Half</asp:ListItem>
                    <asp:ListItem>More than 1 day</asp:ListItem>
                </asp:RadioButtonList>
            </td>
            <td class="style26">
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style25">
                &nbsp;</td>
            <td class="style22" colspan="4">
                <asp:Panel ID="Panel3" runat="server">
                    <table class="style1">
                        <tr>
                            <td class="style23">
                                Date</td>
                            <td>
                                <asp:TextBox ID="txtDate" runat="server" style="margin-left: 0px"></asp:TextBox>
                                <asp:CalendarExtender ID="txtDate_CalendarExtender" runat="server" 
                                    TargetControlID="txtDate" Format="dd/MM/yyyy">
                                </asp:CalendarExtender>
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
            <td class="style25">
                &nbsp;</td>
            <td class="style22" colspan="4">
                <asp:Panel ID="Panel4" runat="server">
                    <table class="style1">
                        <tr>
                            <td class="style28">
                                Date From :</td>
                            <td class="style20">
                                <asp:TextBox ID="txtDateFrom" runat="server" style="margin-left: 0px"></asp:TextBox>
                                
                                <asp:CalendarExtender ID="txtDateFrom_CalendarExtender" runat="server" 
                                    Format="dd/MM/yyyy" TargetControlID="txtDateFrom">
                                </asp:CalendarExtender>
                                
                            </td>
                            <td>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" 
                                    ControlToValidate="txtDateFrom" ErrorMessage="Enter The Starting Date" 
                                    ForeColor="Red"></asp:RequiredFieldValidator>
                            </td>
                            <td>
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td class="style28">
                                Date To :</td>
                            <td class="style20">
                                <asp:TextBox ID="txtDateTo" runat="server"></asp:TextBox>
                                
                                <asp:CalendarExtender ID="txtDateTo_CalendarExtender" runat="server" 
                                    Format="dd/MM/yyyy" TargetControlID="txtDateTo">
                                </asp:CalendarExtender>
                                
                            </td>
                            <td>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" 
                                    ControlToValidate="txtDateTo" ErrorMessage="Enter The End Date" 
                                    ForeColor="Red"></asp:RequiredFieldValidator>
                            </td>
                            <td>
                                &nbsp;</td>
                        </tr>
                    </table>
                </asp:Panel>
            </td>
            </tr>
        <tr>
            <td class="style25">
                &nbsp;</td>
            <td class="style30">
                    <table class="style1" __designer:mapid="14d">
                        <tr __designer:mapid="14e">
                            <td class="style21" __designer:mapid="14f">
                                Shift :</td>
                        </tr>
                    </table>
                </td>
            <td class="style11">
                                <asp:RadioButtonList ID="rbShift" runat="server" RepeatDirection="Horizontal" 
                                    style="margin-left: 108px" Width="97px">
                                    <asp:ListItem>1st</asp:ListItem>
                                    <asp:ListItem>2nd</asp:ListItem>
                                </asp:RadioButtonList>
                            </td>
            <td class="style26">
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style25">
                &nbsp;</td>
            <td class="style30">
                Upload Document :</td>
            <td class="style11">
                <asp:FileUpload ID="fuDocument" runat="server" />
            </td>
            <td class="style26">
                <asp:Label ID="Label1" runat="server" ForeColor="Red"></asp:Label>
            </td>
            <td>
                <asp:ScriptManager ID="ScriptManager1" runat="server">
                </asp:ScriptManager>
            </td>
        </tr>
        <tr>
            <td class="style25">
                &nbsp;</td>
            <td class="style30">
                Other Details :</td>
            <td class="style11">
                <asp:TextBox ID="txtOtherDetails" runat="server"></asp:TextBox>
            </td>
            <td class="style26">
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style25">
                &nbsp;</td>
            <td class="style30">
                &nbsp;</td>
            <td class="style11">
                &nbsp;</td>
            <td class="style26">
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style25">
                &nbsp;</td>
            <td class="style30">
                <asp:Button ID="btnInsert" runat="server" Text="Insert" 
                    onclick="btnInsert_Click" />
            </td>
            <td class="style11">
                <asp:Button ID="btnUpdate" runat="server" Text="Update" 
                    onclick="btnUpdate_Click" />
            </td>
            <td class="style26">
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style22" colspan="5">
                <asp:TabContainer ID="TabContainer1" runat="server" ActiveTabIndex="0" 
                    Height="314px" ScrollBars="Both" Width="969px">
                    <asp:TabPanel ID="TabPanel1" runat="server" HeaderText="TabPanel1">
                        <ContentTemplate>
                            <asp:GridView ID="GridView1" runat="server" onrowcommand="GridView1_RowCommand" 
                                onselectedindexchanged="GridView1_SelectedIndexChanged">
                                <Columns>
                                    <asp:TemplateField HeaderText="Edit">
                                        <ItemTemplate>
                                            <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="false" 
                                                CommandArgument='<%#Eval("Leave_Form_ID") %>' CommandName="Editt">Edit</asp:LinkButton>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Delete">
                                        <ItemTemplate>
                                            <asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="false" 
                                                CommandArgument='<%#Eval("Leave_Form_ID") %>' CommandName="Deletee">Delete</asp:LinkButton>
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
            <td class="style25">
                &nbsp;</td>
            <td class="style22" colspan="4">
                &nbsp;</td>
            </tr>
    </table>
</p>

</asp:Content>

