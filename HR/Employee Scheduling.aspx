<%@ Page Title="" Language="C#" MasterPageFile="~/HR/HR.master" AutoEventWireup="true" CodeFile="Employee Scheduling.aspx.cs" Inherits="HR_Employee_Scheduling" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
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
        font-size: large;
    }
    .style4
    {
        width: 164px;
    }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table class="style1">
        <tr>
            <td class="style4">
                &nbsp;</td>
            <td class="style3" colspan="2">
                <strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
                Employee Scheduling</strong></td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style4">
                &nbsp;</td>
            <td class="style2">
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
                &nbsp;</td>
            <td class="style2">
                Select Department :</td>
            <td>
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
            <td class="style4">
                &nbsp;</td>
            <td class="style2">
                Select Shift :</td>
            <td>
                <asp:DropDownList ID="ddShift" runat="server">
                </asp:DropDownList>
            </td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style4">
                &nbsp;</td>
            <td class="style2">
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
                &nbsp;</td>
            <td class="style2">
                <asp:Button ID="btnViewEmployee" runat="server" onclick="btnViewEmployee_Click" 
                    Text="View Employee" />
            </td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style4">
                &nbsp;</td>
            <td class="style2">
                Shift Timing :</td>
            <td>
                <asp:Label ID="lblFrom" runat="server" Text="Label"></asp:Label>
&nbsp;To
                <asp:Label ID="lblTo" runat="server" Text="Label"></asp:Label>
            </td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style4">
                &nbsp;</td>
            <td class="style2" colspan="3">
                <asp:GridView runat="server" ID="GridView1" OnRowCommand="GridView1_RowCommand" 
                    OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
                    <Columns>
                        <asp:TemplateField HeaderText="Allocate">
                            <ItemTemplate>
                                <asp:CheckBox ID="CheckBox1" runat="server" />
                                <asp:HiddenField ID="HiddenField1" runat="server" 
                                    Value='<%# Eval("Employee_ID") %>' />
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style4">
                &nbsp;</td>
            <td class="style2">
                &nbsp;</td>
            <td>
                <asp:ScriptManager ID="ScriptManager1" runat="server">
                </asp:ScriptManager>
            </td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style4">
                &nbsp;</td>
            <td class="style2">
                Interval </td>
            <td>
                <asp:TextBox ID="txtDateFrom" runat="server"></asp:TextBox>
                <asp:CalendarExtender ID="txtDateFrom_CalendarExtender" runat="server" 
                    Format="dd/MM/yyyy" TargetControlID="txtDateFrom">
                </asp:CalendarExtender>
&nbsp;To
                <asp:TextBox ID="txtDateTo" runat="server"></asp:TextBox>
                <asp:CalendarExtender ID="txtDateTo_CalendarExtender" runat="server" 
                    Format="dd/MM/yyyy" TargetControlID="txtDateTo">
                </asp:CalendarExtender>
            </td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style4">
                &nbsp;</td>
            <td class="style2">
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
                &nbsp;</td>
            <td class="style2">
                <asp:Button ID="btnAllocate" runat="server" onclick="btnAllocate_Click" 
                    Text="Allocate" />
            </td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
    </table>
</asp:Content>

