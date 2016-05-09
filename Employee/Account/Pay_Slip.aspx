<%@ Page Title="" Language="C#" MasterPageFile="~/Employee/Account/Account_Employee.master" AutoEventWireup="true" CodeFile="Pay_Slip.aspx.cs" Inherits="Employee_Account_Pay_Slip" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
    .style1
    {
        width: 100%;
    }
    .style2
    {
        }
</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table class="style1">
    <tr>
        <td class="style2">
            &nbsp;</td>
        <td>
            &nbsp;</td>
    </tr>
    <tr>
                <td class="style2">
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
            </tr>
    <tr>
                <td class="style2">
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
            </tr>
    <tr>
                <td class="style2">
                    Department Name :</td>
                <td>
                    <asp:DropDownList ID="ddDepartment" runat="server" AutoPostBack="True" 
                        onselectedindexchanged="ddDepartment_SelectedIndexChanged">
                    </asp:DropDownList>
                </td>
            </tr>
    <tr>
                <td class="style2">
                    Designation :</td>
                <td>
                    <asp:DropDownList ID="ddDesignation" runat="server" AutoPostBack="True" 
                        onselectedindexchanged="ddDesignation_SelectedIndexChanged">
                    </asp:DropDownList>
                </td>
            </tr>
    <tr>
                <td class="style2">
                    Employe Name :</td>
                <td>
                    <asp:DropDownList ID="ddEmployee" runat="server">
                    </asp:DropDownList>
                </td>
            </tr>
    <tr>
        <td class="style2">
            &nbsp;</td>
        <td>
            <asp:Button ID="btnProceed" runat="server" onclick="btnProceed_Click" 
                Text="Proceed" />
        </td>
    </tr>
    <tr>
        <td class="style2" colspan="2">
            <asp:Panel ID="Panel1" runat="server">
                <table class="style1">
                    <tr>
                        <td class="style2">
                            Time Period :</td>
                        <td>
                            <asp:Label ID="lblFrom" runat="server" Text="Label"></asp:Label>
                            &nbsp;&nbsp;&nbsp; to&nbsp;&nbsp;
                            <asp:Label ID="lblTo" runat="server" Text="Label"></asp:Label>
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <asp:Label ID="lblFullName" runat="server" Text="Label" Visible="False"></asp:Label>
                            <asp:Label ID="lblDepartment" runat="server" Text="Label" Visible="False"></asp:Label>
                            <asp:Label ID="lblDesignation" runat="server" Text="Label" Visible="False"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="style2">
                            Basic Salary :</td>
                        <td>
                            <asp:Label ID="lblBasicSalary" runat="server" Text="Label"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="style2">
                            Payable Date :</td>
                        <td>
                            <asp:Label ID="lblDate" runat="server" Text="Label"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="style2">
                            Payable Salary :</td>
                        <td>
                            <asp:Label ID="lblPaySalary" runat="server" Text="Label"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="style2">
                            &nbsp;</td>
                        <td>
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td class="style2">
                            &nbsp;</td>
                        <td>
                            <asp:Button ID="btnPrint" runat="server" onclick="btnPrint_Click" 
                                Text="Print" />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            &nbsp;</td>
                        <td>
                            &nbsp;</td>
                    </tr>
                </table>
            </asp:Panel>
        </td>
    </tr>
    </table>
</asp:Content>

