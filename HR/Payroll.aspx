<%@ Page Title="" Language="C#" MasterPageFile="~/HR/HR.master" AutoEventWireup="true" CodeFile="Payroll.aspx.cs" Inherits="HR_payroll" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>

<%--<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
</asp:Content>
--%><asp:Content ID="Content2" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .style1
        {
            width: 100%;
        }
        .style4
        {
        }
        .style11
        {
            width: 515px;
        }
        .style14
        {
            text-decoration: underline;
        }
        .style10
        {
            height: 26px;
        }
        .style8
        {
            width: 177px;
            font-weight: bold;
            text-decoration: underline;
        }
        .style7
        {
            width: 177px;
        }
        .style15
        {
            width: 116px;
        }
        .style16
        {
            width: 233px;
        }
        .style17
        {
            height: 28px;
        }
        .style18
        {
            width: 233px;
            height: 28px;
        }
        .style19
        {
            width: 111px;
        }
        .style20
        {
        }
        .style21
        {
            width: 120px;
        }
        .style22
        {
        }
        .style23
        {
            width: 137px;
        }
        .style24
        {
            width: 179px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <p>
        <br />
        <table class="style1">
            <tr>
                <td>
                    Select Date :</td>
                <td>
                    <asp:TextBox ID="txtDatefrm" runat="server" Height="24px" Width="163px"></asp:TextBox>
                    <asp:CalendarExtender ID="txtDatefrm_CalendarExtender" runat="server" 
                        TargetControlID="txtDatefrm">
                    </asp:CalendarExtender>
                &nbsp;To
                    <asp:TextBox ID="txtDateto" runat="server" Height="23px" 
                        style="margin-left: 2px"></asp:TextBox>
                    <asp:CalendarExtender ID="txtDateto_CalendarExtender" runat="server" 
                        TargetControlID="txtDateto">
                    </asp:CalendarExtender>
                &nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                        ErrorMessage="Enter starting date" ControlToValidate="txtDatefrm" 
                        ForeColor="Red"></asp:RequiredFieldValidator>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                        ControlToValidate="txtDateto" ErrorMessage="Enter ending date" ForeColor="Red"></asp:RequiredFieldValidator>
                </td>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td>
                    <asp:ScriptManager ID="ScriptManager1" runat="server">
                    </asp:ScriptManager>
                </td>
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
                <td>
                    Department :</td>
                <td>
                    <asp:DropDownList ID="ddDepartment" runat="server" AutoPostBack="True" 
                        onselectedindexchanged="ddDept_SelectedIndexChanged">
                    </asp:DropDownList>
                </td>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td>
                    Designation:</td>
                <td>
                    <asp:DropDownList ID="ddDesignation" runat="server" AutoPostBack="True" 
                        onselectedindexchanged="ddDes_SelectedIndexChanged">
                    </asp:DropDownList>
                </td>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td>
                    Employee Name :</td>
                <td>
                    <asp:DropDownList ID="ddEmployeeName" runat="server">
                    </asp:DropDownList>
                </td>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td>
                    <asp:Button ID="btnProceed" runat="server" onclick="btnProceed_Click" 
                        Text="Proceed" />
                </td>
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
                <td>
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
                <td colspan="5">
                    <asp:Panel ID="Panel4" runat="server" BorderColor="Black" BorderStyle="Double">
                        <table class="style1">
                            <tr>
                                <td class="style15">
                                    Joining Date :</td>
                                <td>
                                    <asp:Label ID="lblJoiningDate" runat="server" 
                Text="Label"></asp:Label>
                                </td>
                                <td class="style16">
                                    &nbsp;</td>
                                <td>
                                    &nbsp;</td>
                                <td>
                                    &nbsp;</td>
                            </tr>
                            <tr>
                                <td class="style15">
                                    &nbsp;</td>
                                <td>
                                    &nbsp;</td>
                                <td class="style16">
                                    &nbsp;</td>
                                <td>
                                    &nbsp;</td>
                                <td>
                                    &nbsp;</td>
                            </tr>
                            <tr>
                                <td class="style2" colspan="5">
                                    <table class="style1" style="border-style: double">
                                        <tr>
                                            <td class="style4">
                                                <asp:Panel ID="Panel5" runat="server" Width="474px">
                                                    <table class="style1" style="border-style: double">
                                                        <tr>
                                                            <td class="style21">
                                                                Absent Day :</td>
                                                            <td class="style22" colspan="2">
                                                                &nbsp;</td>
                                                        </tr>
                                                        <tr>
                                                            <td class="style21">
                                                                &nbsp;</td>
                                                            <td class="style24">
                                                                Leave Accepted</td>
                                                            <td>
                                                                <asp:Label ID="lblLeaveAccepted" runat="server" Text="Label"></asp:Label>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td class="style21">
                                                                &nbsp;</td>
                                                            <td class="style24">
                                                                Absent</td>
                                                            <td>
                                                                <asp:Label ID="lblAbsent" runat="server" Text="Label"></asp:Label>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td class="style21">
                                                                &nbsp;</td>
                                                            <td class="style24">
                                                                Total Absent Day :</td>
                                                            <td>
                                                                <asp:Label ID="lblTotalAbsentDay" runat="server" Text="Label"></asp:Label>
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </asp:Panel>
                                            </td>
                                            <td class="style11">
                                                <asp:Panel ID="Panel6" runat="server">
                                                    <table class="style1" style="border-style: double">
                                                        <tr>
                                                            <td class="style19">
                                                                Present Day :</td>
                                                            <td class="style20" colspan="2">
                                                                &nbsp;</td>
                                                        </tr>
                                                        <tr>
                                                            <td class="style19">
                                                                &nbsp;</td>
                                                            <td class="style23">
                                                                Present :</td>
                                                            <td>
                                                                <asp:Label ID="lblPresent" runat="server" Text="Label"></asp:Label>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td class="style19">
                                                                &nbsp;</td>
                                                            <td class="style23">
                                                                Work off:</td>
                                                            <td>
                                                                <asp:Label ID="lblWorkOff" runat="server" Text="Label"></asp:Label>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td class="style19">
                                                                &nbsp;</td>
                                                            <td class="style23">
                                                                Festivals :</td>
                                                            <td>
                                                                <asp:Label ID="lblFestival" runat="server" Text="Label"></asp:Label>
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </asp:Panel>
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2">
                                    Total Present Day :</td>
                                <td class="style16">
                                    <asp:Label ID="lblTotalPresentDay" runat="server" Text="Label"></asp:Label>
                                </td>
                                <td>
                                    &nbsp;</td>
                                <td>
                                    &nbsp;</td>
                            </tr>
                            <tr>
                                <td colspan="2">
                                    Present Salary :</td>
                                <td class="style16">
                                    <asp:Label ID="lblPresentSalary" runat="server" Text="Label"></asp:Label>
                                </td>
                                <td>
                                    &nbsp;</td>
                                <td>
                                    &nbsp;</td>
                            </tr>
                            <tr>
                                <td colspan="2" class="style17">
                                    Per Day Salary :</td>
                                <td class="style18">
                                    <asp:Label ID="lblPerDaySalary" runat="server" 
                Text="Label"></asp:Label>
                                </td>
                                <td class="style17">
                                </td>
                                <td class="style17">
                                </td>
                            </tr>
                            <tr>
                                <td colspan="3">
                                    <asp:Panel ID="Panel2" runat="server" BorderColor="Black">
                                        <table class="style1" style="border-style: double">
                                            <tr>
                                                <td class="style14">
                                                    <b>Extra Earning :</b></td>
                                                <td>
                                                    <b></b>
                                                </td>
                                                <td>
                                                    <b></b>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="style10">
                                                </td>
                                                <td class="style10">
                                                    Amount :</td>
                                                <td class="style10">
                                                    <asp:TextBox ID="txtExtraEarnAmount" runat="server" 
                                                        ontextchanged="txtExtraEarnAmount_TextChanged"></asp:TextBox>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    &nbsp;</td>
                                                <td>
                                                    Reason :</td>
                                                <td>
                                                    <asp:TextBox ID="txtExtraEarnReason" runat="server"></asp:TextBox>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    &nbsp;</td>
                                                <td>
                                                    &nbsp;</td>
                                                <td>
                                                    &nbsp;</td>
                                            </tr>
                                        </table>
                                    </asp:Panel>
                                </td>
                                <td colspan="2">
                                    <asp:Panel ID="Panel3" runat="server">
                                        <table class="style1" style="border-style: double">
                                            <tr>
                                                <td class="style8">
                                                    Extra Deduction</td>
                                                <td>
                                                    <b></b>
                                                </td>
                                                <td>
                                                    <b></b>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="style7">
                                                    &nbsp;</td>
                                                <td>
                                                    Amount :</td>
                                                <td>
                                                    <asp:TextBox ID="txtDeductionAmount" runat="server" 
                                                        ontextchanged="txtDeductionAmount_TextChanged"></asp:TextBox>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="style7">
                                                    &nbsp;</td>
                                                <td>
                                                    Description :</td>
                                                <td>
                                                    <asp:TextBox ID="txtDeductionDescription" runat="server"></asp:TextBox>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="style7">
                                                    &nbsp;</td>
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
                                <td colspan="2">
                                    &nbsp;</td>
                                <td class="style16">
                                    &nbsp;</td>
                                <td>
                                    &nbsp;</td>
                                <td>
                                    &nbsp;</td>
                            </tr>
                            <tr>
                                <td colspan="2">
                                    &nbsp;</td>
                                <td class="style16">
                                    <asp:Label ID="lblPayableSalary" runat="server"></asp:Label>
                                </td>
                                <td>
                                    &nbsp;</td>
                                <td>
                                    &nbsp;</td>
                            </tr>
                            <tr>
                                <td colspan="2">
                                    &nbsp;</td>
                                <td class="style16">
                                    &nbsp;</td>
                                <td>
                                    &nbsp;</td>
                                <td>
                                    &nbsp;</td>
                            </tr>
                            <tr>
                                <td colspan="2">
                                    <asp:Button ID="btnSubmit" runat="server" 
                Text="Submit" onclick="btnSubmit_Click" />
                                </td>
                                <td class="style16">
                                    &nbsp;</td>
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
                <td colspan="5">
                    <asp:Panel ID="Panel1" runat="server">
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
                <td>
                    &nbsp;</td>
            </tr>
        </table>
    </p>
</asp:Content>

