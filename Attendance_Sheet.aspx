<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Attendance_Sheet.aspx.cs" Inherits="Attendance_Sheet" %>

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
            width: 360px;
        }

        .style4
        {
            width: 360px;
            height: 21px;
        }
        .style5
        {
            height: 21px;
        }

        </style>
</head>
<body>
<form id="form1" runat="server">
    <div>
    
        <table class="style1">
            <tr>
                <td class="style3">
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style3">
                    Employe Name :</td>
                <td>
                    <asp:DropDownList ID="ddEmployee" runat="server">
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td class="style3">
                    Date From :</td>
                <td>
                    <asp:TextBox ID="txtFrom" runat="server"></asp:TextBox>
                    <asp:CalendarExtender ID="txtFrom_CalendarExtender" runat="server" 
                        Format="dd/MM/yyyy" TargetControlID="txtFrom">
                    </asp:CalendarExtender>
                </td>
            </tr>
            <tr>
                <td class="style3">
                    Date To:</td>
                <td>
                    <asp:TextBox ID="txtTo" runat="server"></asp:TextBox>
                    <asp:CalendarExtender ID="txtTo_CalendarExtender" runat="server" 
                        Format="dd/MM/yyyy" TargetControlID="txtTo">
                    </asp:CalendarExtender>
                </td>
            </tr>
            <tr>
                <td class="style3">
                    &nbsp;</td>
                <td>
                    <asp:ScriptManager ID="ScriptManager1" runat="server">
                    </asp:ScriptManager>
                </td>
            </tr>
            <tr>
                <td class="style3">
                    <asp:Label ID="lblDepartmentID" runat="server" Text="Label" Visible="False"></asp:Label>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:Label ID="lblDesignationID" runat="server" Text="Label" Visible="False"></asp:Label>
                </td>
                <td>
                    <asp:Button ID="btnOk" runat="server" Text="Ok" onclick="btnOk_Click" />
                </td>
            </tr>
            <tr>
                <td class="style3">
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style3">
                    Total Absent :</td>
                <td>
                    <asp:Label ID="lblAbsent" runat="server" Text="Label"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="style3">
                    Total Present :</td>
                <td>
                    <asp:Label ID="lblPresent" runat="server" Text="Label"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="style3">
                    Total Leave :</td>
                <td>
                    <asp:Label ID="lblLeave" runat="server" Text="Label"></asp:Label>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style3">
                    Festival Count : </td>
                <td>
                    <asp:Label ID="lblFestival" runat="server" Text="Label"></asp:Label>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    </td>
            </tr>
            <tr>
                <td class="style4">
                    Weekly Off&nbsp;:</td>
                <td class="style5">
                    <asp:Label ID="lblWorkoff" runat="server" Text="Label"></asp:Label>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    </td>
            </tr>
            <tr>
                <td class="style2" colspan="2">
    <asp:GridView ID="GridView1" runat="server" onrowcommand="GridView1_RowCommand" 
                    onselectedindexchanged="GridView1_SelectedIndexChanged1">
    </asp:GridView>
                </td>
            </tr>
            <tr>
                <td class="style2" colspan="2">
                    &nbsp;</td>
            </tr>
        </table>
    
    </div>
    </form>
</body>
</html>
