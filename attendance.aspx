<%@ Page Language="C#" AutoEventWireup="true" CodeFile="attendance.aspx.cs" Inherits="attendance" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>

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

* {
	padding: 0;
    margin-left: 0;
    margin-right: 0;
    margin-top: 4px;
}

a {
	text-decoration: underline;
	color: #0F8C8C;
}

        .style3
        {
            height: 32px;
        }

    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <table class="style1">
            <tr>
                <td class="style2">
                    &nbsp;</td>
                <td colspan="2">
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style2">
                    Select Date :</td>
                <td colspan="2">
                    <asp:TextBox ID="txtDate" runat="server"></asp:TextBox>
                    <asp:CalendarExtender ID="txtDate_CalendarExtender" runat="server" 
                        TargetControlID="txtDate">
                    </asp:CalendarExtender>
                    <asp:ScriptManager ID="ScriptManager1" runat="server">
                    </asp:ScriptManager>
                </td>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style2">
                    Select Department :</td>
                <td colspan="2">
                    <asp:DropDownList ID="ddDepartment" runat="server" AutoPostBack="True" 
                        onselectedindexchanged="ddDepartment_SelectedIndexChanged">
                    </asp:DropDownList>
                </td>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style2">
                    Select Designation :</td>
                <td colspan="2">
                    <asp:DropDownList ID="ddDesignation" runat="server" AutoPostBack="True" 
                        onselectedindexchanged="ddDesignation_SelectedIndexChanged">
                    </asp:DropDownList>
                </td>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style2">
                    Select Employee :</td>
                <td colspan="2">
                    <asp:DropDownList ID="ddEmployeeName" runat="server">
                    </asp:DropDownList>
                </td>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style2">
                    Presence :</td>
                <td colspan="2">
                    <asp:RadioButtonList ID="rblPresent" runat="server" 
                        RepeatDirection="Horizontal">
                        <asp:ListItem>Present</asp:ListItem>
                        <asp:ListItem>Absent</asp:ListItem>
                    </asp:RadioButtonList>
                </td>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style2">
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
                <td>
                    <asp:Label ID="lblMessage" runat="server"></asp:Label>
                </td>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style3">
                    <asp:Button ID="btnSubmit" runat="server" onclick="btnSubmit_Click" 
                        Text="Submit" />
                </td>
                <td class="style3" colspan="2">
                    <asp:Button ID="Button1" runat="server" Text="Button" />
                </td>
                <td class="style3">
                    </td>
                <td class="style3">
                    </td>
            </tr>
            <tr>
                <td class="style2" colspan="5">
    <asp:GridView ID="GridView1" runat="server" onrowcommand="GridView1_RowCommand" 
                    onselectedindexchanged="GridView1_SelectedIndexChanged">
        <Columns>
            <asp:TemplateField HeaderText="Present">
                <ItemTemplate>
                    <asp:LinkButton ID="LinkButton1" CommandName="Present" CausesValidation="false" CommandArgument='<%#Eval("_ID") %>' runat="server">Present</asp:LinkButton>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Absent">
                <ItemTemplate>
                    <asp:LinkButton ID="LinkButton2" CommandName="Absent" CausesValidation="false" CommandArgument='<%#Eval("Country_ID") %>' runat="server">Absent</asp:LinkButton>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </asp:GridView>
                </td>
            </tr>
            <tr>
                <td class="style2">
                    &nbsp;</td>
                <td colspan="2">
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style2">
                    &nbsp;</td>
                <td colspan="2">
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
            </tr>
        </table>
    
    </div>
    </form>
</body>
</html>
