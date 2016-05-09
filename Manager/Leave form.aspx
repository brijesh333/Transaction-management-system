<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Leave Form.aspx.cs" Inherits="Leave" %><%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .style1
        {
            width: 100%;
        }
        .style2
        {
        }
        .style3
        {
            width: 421px;
            height: 23px;
        }
        .style4
        {
            height: 23px;
        }
        .style5
        {
            width: 421px;
            height: 30px;
        }
        .style6
        {
            height: 30px;
        }
        .style10
        {
            height: 30px;
            width: 235px;
        }
        .style11
        {
            width: 235px;
        }
        .style12
        {
            height: 23px;
            width: 235px;
        }
        .style13
        {
            color: #FF0000;
        }
        .style14
        {
            height: 30px;
            width: 249px;
        }
        .style15
        {
            width: 249px;
        }
        .style16
        {
            height: 23px;
            width: 249px;
        }
        .style19
        {
            width: 419px;
        }
        .style20
        {
            width: 234px;
        }
        .style21
        {
            width: 338px;
        }
        .style22
        {
            width: 421px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <strong>Leave Form</strong></div>
    <table class="style1">
        <tr>
            <td class="style5">
                </td>
            <td class="style10">
                </td>
            <td class="style14">
            </td>
            <td class="style6">
                </td>
        </tr>
        <tr>
            <td class="style5">
                &nbsp;</td>
            <td class="style10">
                &nbsp;</td>
            <td class="style14">
                &nbsp;</td>
            <td class="style6">
                <asp:Label ID="Label3" runat="server" Text="Label"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="style5">
                Subject Of Leave :</td>
            <td class="style10">
                <asp:TextBox ID="txtSubOfLeave" runat="server"></asp:TextBox>
            &nbsp;<span class="style13">*</span></td>
            <td class="style14">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                    ControlToValidate="txtSubOfLeave" ErrorMessage="Enter Proper Subject of leave" 
                    ForeColor="Red"></asp:RequiredFieldValidator>
            </td>
            <td class="style6">
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style22">
                Type :</td>
            <td class="style11">
                <asp:DropDownList ID="ddType" runat="server">
                </asp:DropDownList>
            &nbsp;<span class="style13">*</span></td>
            <td class="style15">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                    ControlToValidate="ddType" ErrorMessage="Select Proper Type" ForeColor="Red"></asp:RequiredFieldValidator>
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style22">
                Leave For :</td>
            <td class="style11">
                <asp:RadioButtonList ID="rbLeave" runat="server" RepeatDirection="Horizontal" 
                    AutoPostBack="True" onselectedindexchanged="rbLeave_SelectedIndexChanged">
                    <asp:ListItem>Full</asp:ListItem>
                    <asp:ListItem>Half</asp:ListItem>
                    <asp:ListItem>More than 1 day</asp:ListItem>
                </asp:RadioButtonList>
            </td>
            <td class="style15">
                &nbsp;</td>
            <td>
                <asp:Label ID="Label2" runat="server" Text="Label"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="style2" colspan="4">
                <asp:Panel ID="Panel1" runat="server">
                    <table class="style1">
                        <tr>
                            <td class="style19">
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
            <td class="style2" colspan="4">
                <asp:Panel ID="Panel2" runat="server">
                    <table class="style1">
                        <tr>
                            <td class="style19">
                                Date From :</td>
                            <td class="style20">
                                <asp:TextBox ID="txtDateFrom" runat="server" style="margin-left: 0px"></asp:TextBox>
                                <asp:CalendarExtender ID="txtDateFrom_CalendarExtender" runat="server" 
                                    TargetControlID="txtDateFrom" Format="dd/MM/yyyy">
                                </asp:CalendarExtender>
                            </td>
                            <td>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                                    ControlToValidate="txtDateFrom" ErrorMessage="Enter The Starting Date" 
                                    ForeColor="Red"></asp:RequiredFieldValidator>
                            </td>
                            <td>
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td class="style19">
                                Date To :</td>
                            <td class="style20">
                                <asp:TextBox ID="txtDateTo" runat="server"></asp:TextBox>
                                <asp:CalendarExtender ID="txtDateTo_CalendarExtender" runat="server" 
                                    TargetControlID="txtDateTo" Format="dd/MM/yyyy">
                                </asp:CalendarExtender>
                            </td>
                            <td>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                                    ControlToValidate="txtDateTo" ErrorMessage="Enter The End Date" ForeColor="Red"></asp:RequiredFieldValidator>
                            </td>
                            <td>
                                &nbsp;</td>
                        </tr>
                    </table>
                </asp:Panel>
            </td>
        </tr>
        <tr>
            <td class="style2" colspan="4">
                <asp:Panel ID="Panel3" runat="server">
                    <table class="style1">
                        <tr>
                            <td class="style21">
                                Shift :</td>
                            <td>
                                <asp:RadioButtonList ID="rbShift" runat="server" RepeatDirection="Horizontal" 
                                    style="margin-left: 83px" AutoPostBack="True">
                                    <asp:ListItem>1st</asp:ListItem>
                                    <asp:ListItem>2nd</asp:ListItem>
                                </asp:RadioButtonList>
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
            <td class="style22">
                Upload Document :</td>
            <td class="style11">
                <asp:FileUpload ID="fuDocument" runat="server" />
            </td>
            <td class="style15">
                <asp:Label ID="Label1" runat="server" ForeColor="Red"></asp:Label>
            </td>
            <td>
                <asp:ScriptManager ID="ScriptManager1" runat="server">
                </asp:ScriptManager>
            </td>
        </tr>
        <tr>
            <td class="style22">
                Other Details :</td>
            <td class="style11">
                <asp:TextBox ID="txtOtherDetails" runat="server"></asp:TextBox>
            </td>
            <td class="style15">
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style3">
                </td>
            <td class="style12">
                </td>
            <td class="style16">
                </td>
            <td class="style4">
                </td>
        </tr>
        <tr>
            <td class="style22">
                <asp:Button ID="btnInsert" runat="server" Text="Insert" 
                    onclick="btnInsert_Click" />
            </td>
            <td class="style11">
                <asp:Button ID="btnUpdate" runat="server" Text="Update" 
                    onclick="btnUpdate_Click" />
            </td>
            <td class="style15">
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style22">
                &nbsp;</td>
            <td class="style11">
                &nbsp;</td>
            <td class="style15">
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        </table>
    <asp:GridView ID="GridView1" runat="server" onrowcommand="GridView1_RowCommand" 
        onselectedindexchanged="GridView1_SelectedIndexChanged">
        <Columns>
            <asp:TemplateField HeaderText="Edit">
                <ItemTemplate>
                    <asp:LinkButton ID="LinkButton1" CommandName="Editt" CausesValidation="false" CommandArgument='<%#Eval("Leave_Form_ID") %>' runat="server">Edit</asp:LinkButton>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Delete">
                <ItemTemplate>
                    <asp:LinkButton ID="LinkButton2" CommandName="Deletee" CausesValidation="false" CommandArgument='<%#Eval("Leave_Form_ID") %>' runat="server">Delete</asp:LinkButton>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </asp:GridView>
    </form>
</body>
</html>
