﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.master" AutoEventWireup="true" CodeFile="View HR Leave Request.aspx.cs" Inherits="Admin_View_HR_Leave_Request" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .style1
        {
            width: 100%;
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
        </tr>
        <tr>
            <td colspan="2">
                <asp:TabContainer ID="TabContainer1" runat="server" ActiveTabIndex="0" 
                    Height="299px" ScrollBars="Both" Width="964px">
                    <asp:TabPanel ID="TabPanel1" runat="server" HeaderText="TabPanel1">
                        <ContentTemplate>
                            <table class="style1">
                                <tr>
                                    <td>
                                        &nbsp;</td>
                                    <td>
                                        &nbsp;</td>
                                </tr>
                                <tr>
                                    <td colspan="2">
                                        <asp:GridView ID="GridView1" runat="server" OnRowCommand="GridView1_RowCommand" 
                                            OnSelectedIndexChanged="GridView1_SelectedIndexChanged" Width="463px">
                                            <Columns>
                                                <asp:TemplateField HeaderText="Approve">
                                                    <ItemTemplate>
                                                        <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="false" 
                                                            CommandArgument='<%#Eval("Leave_Form_ID") %>' CommandName="Approve">Approve</asp:LinkButton>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Reject">
                                                    <ItemTemplate>
                                                        <asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="false" 
                                                            CommandArgument='<%#Eval("Leave_Form_ID") %>' CommandName="Reject">Reject</asp:LinkButton>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                            </Columns>
                                        </asp:GridView>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:ScriptManager ID="ScriptManager1" runat="server">
                                        </asp:ScriptManager>
                                    </td>
                                    <td>
                                        &nbsp;</td>
                                </tr>
                            </table>
                        </ContentTemplate>
                    </asp:TabPanel>
                </asp:TabContainer>
            </td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
    </table>
&nbsp;&nbsp;&nbsp; 
</asp:Content>

