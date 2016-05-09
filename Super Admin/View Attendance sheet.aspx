<%@ Page Title="" Language="C#" MasterPageFile="~/Super Admin/admin.master" AutoEventWireup="true" CodeFile="View Attendance sheet.aspx.cs" Inherits="HR_View_Attendance_sheet" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
    .style1
    {
        width: 100%;
    }
    .style2
    {
        height: 11px;
    }
</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table class="style1">
    <tr>
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
                <td class="style3">
                    Department Name :</td>
                <td>
                    <asp:DropDownList ID="ddDepartment" runat="server" AutoPostBack="True" 
                        onselectedindexchanged="ddDepartment_SelectedIndexChanged">
                    </asp:DropDownList>
                </td>
            </tr>
    <tr>
                <td class="style3">
                    Designation :</td>
                <td>
                    <asp:DropDownList ID="ddDesignation" runat="server" AutoPostBack="True" 
                        onselectedindexchanged="ddDesignation_SelectedIndexChanged">
                    </asp:DropDownList>
                </td>
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
                <td class="style2">
                    </td>
                <td class="style2">
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
                <td class="style3" colspan="2">
                    <asp:Panel ID="Panel1" runat="server">
                        <table class="style1">
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
                                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;</td>
                            </tr>
                            <tr>
                                <td class="style3">
                                    Festival Count :
                                </td>
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
                                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                </td>
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
        <td>
            &nbsp;</td>
        <td>
            &nbsp;</td>
    </tr>
    <tr>
        <td colspan="4">
    <asp:GridView ID="GridView1" runat="server" onrowcommand="GridView1_RowCommand" 
                    onselectedindexchanged="GridView1_SelectedIndexChanged1">
    </asp:GridView>
                </td>
    </tr>
    <tr>
        <td>
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

