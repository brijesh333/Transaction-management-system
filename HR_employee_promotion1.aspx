<%@ Page Title="" Language="C#" MasterPageFile="~/HR MasterPage.master" AutoEventWireup="true" CodeFile="HR_employee_promotion1.aspx.cs" Inherits="HR_employee_promotion1" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .style1
        {
            width: 100%;
        }
        .style2
        {
            text-align: center;
        }
        .style4
        {
            width: 151px;
        }
        .style5
        {
            width: 148px;
        }
        .style6
        {
            width: 148px;
            height: 28px;
        }
        .style7
        {
            height: 28px;
        }
        .style8
        {
            width: 36px;
        }
        .style9
        {
            width: 267px;
        }
        .style11
        {
            width: 199px;
        }
        .style12
        {
            width: 213px;
        }
        .style13
        {
            height: 28px;
            width: 213px;
        }
        .style14
        {
            width: 153px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table class="style1">
        <tr>
            <td class="style8">
                &nbsp;</td>
            <td class="style2" colspan="3">
                <strong>Employee Promotion Form</strong></td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style8">
                &nbsp;</td>
            <td class="style9" colspan="2">
                Select Department :</td>
            <td>
                <asp:DropDownList ID="ddDepartment" runat="server" AutoPostBack="True" 
                    onselectedindexchanged="ddDepartment_SelectedIndexChanged">
                </asp:DropDownList>
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style8">
                &nbsp;</td>
            <td class="style9" colspan="2">
                Select Designation :</td>
            <td>
                <asp:DropDownList ID="ddDesignation" runat="server" AutoPostBack="True" 
                    onselectedindexchanged="ddDesignation_SelectedIndexChanged">
                </asp:DropDownList>
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style8">
                &nbsp;</td>
            <td class="style9" colspan="2">
                Select Employee Name :</td>
            <td>
                <asp:DropDownList ID="ddEmployeeName" runat="server">
                </asp:DropDownList>
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style8">
                &nbsp;</td>
            <td class="style9" colspan="2">
                <asp:Button ID="btnProceed" runat="server" onclick="btnProceed_Click" 
                    Text="Proceed" />
            </td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style8">
                &nbsp;</td>
            <td class="style9" colspan="2">
                &nbsp;</td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style8">
                &nbsp;</td>
            <td colspan="3">
                <asp:Panel ID="Panel1" runat="server">
                    <table class="style1" style="border-style: double">
                        <tr>
                            <td class="style4">
                                <strong>Present Detail</strong></td>
                            <td class="style11">
                                &nbsp;</td>
                            <td>
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td class="style4">
                                &nbsp;</td>
                            <td class="style11">
                                Joining Date :</td>
                            <td>
                                <asp:Label ID="lblJoiningDate" runat="server"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td class="style4">
                                &nbsp;</td>
                            <td class="style11">
                                Department :</td>
                            <td>
                                <asp:Label ID="lblCurrentDepartment" runat="server"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td class="style4">
                                &nbsp;</td>
                            <td class="style11">
                                &nbsp;Designation :</td>
                            <td>
                                <asp:Label ID="lblCurrentDesignation" runat="server"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td class="style4">
                                &nbsp;</td>
                            <td class="style11">
                                &nbsp;Salary :</td>
                            <td>
                                <asp:Label ID="lblCurrentSalary" runat="server"></asp:Label>
                            </td>
                        </tr>
                    </table>
                </asp:Panel>
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style8">
                &nbsp;</td>
            <td class="style9" colspan="2">
                &nbsp;</td>
            <td>
                <asp:ScriptManager ID="ScriptManager1" runat="server">
                </asp:ScriptManager>
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style8">
                &nbsp;</td>
            <td colspan="3">
                <asp:Panel ID="Panel2" runat="server">
                    <table class="style1" style="border-style: double">
                        <tr>
                            <td class="style5">
                                <strong>Promotion To</strong></td>
                            <td class="style12">
                                &nbsp;</td>
                            <td>
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td class="style5">
                                &nbsp;</td>
                            <td class="style12">
                                Department :</td>
                            <td>
                                <asp:DropDownList ID="ddNewDepartment" runat="server" AutoPostBack="True" 
                                    onselectedindexchanged="ddNewDepartment_SelectedIndexChanged">
                                </asp:DropDownList>
                            </td>
                        </tr>
                        <tr>
                            <td class="style5">
                                &nbsp;</td>
                            <td class="style12">
                                Designation :</td>
                            <td>
                                <asp:DropDownList ID="ddNewDesignation" runat="server">
                                </asp:DropDownList>
                            </td>
                        </tr>
                        <tr>
                            <td class="style5">
                                &nbsp;</td>
                            <td class="style12">
                                Type :</td>
                            <td>
                                <asp:DropDownList ID="ddEmp_Type" runat="server">
                                </asp:DropDownList>
                            </td>
                        </tr>
                        <tr>
                            <td class="style5">
                                &nbsp;</td>
                            <td class="style12">
                                Salary :</td>
                            <td>
                                <asp:TextBox ID="txtNewSalary" runat="server"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td class="style6">
                            </td>
                            <td class="style13">
                                Applied Date :</td>
                            <td class="style7">
                                <asp:TextBox ID="txtAppliedDate" runat="server"></asp:TextBox>
                                <asp:CalendarExtender ID="txtAppliedDate_CalendarExtender" runat="server" 
                                    TargetControlID="txtAppliedDate">
                                </asp:CalendarExtender>
                            </td>
                        </tr>
                        <tr>
                            <td class="style5">
                                &nbsp;</td>
                            <td class="style12">
                                &nbsp;</td>
                            <td>
                                &nbsp;</td>
                        </tr>
                    </table>
                </asp:Panel>
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style8">
                &nbsp;</td>
            <td class="style14">
                &nbsp;</td>
            <td class="style9">
                <asp:Button ID="btnSubmit" runat="server" Text="Submit" 
                    onclick="btnSubmit_Click" />
            </td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style8">
                &nbsp;</td>
            <td class="style9" colspan="2">
                &nbsp;</td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style8">
                &nbsp;</td>
            <td class="style9" colspan="2">
                &nbsp;</td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style8">
                &nbsp;</td>
            <td class="style9" colspan="2">
                &nbsp;</td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style8">
                &nbsp;</td>
            <td class="style9" colspan="2">
                &nbsp;</td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style8">
                &nbsp;</td>
            <td class="style9" colspan="2">
                &nbsp;</td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style8">
                &nbsp;</td>
            <td class="style9" colspan="2">
                &nbsp;</td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
    </table>
</asp:Content>

