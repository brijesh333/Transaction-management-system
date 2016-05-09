<%@ Page Title="" Language="C#" MasterPageFile="~/HOD/Account/Account_Hod.master" AutoEventWireup="true" CodeFile="View Employee Detail.aspx.cs" Inherits="HOD_Account_View_Employee_Detail" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .style1
        {
            width: 100%;
        }
        .style2
        {
            width: 271px;
        }
        .style3
        {
            width: 264px;
        }
        .style4
        {
            width: 354px;
        }
        .style5
        {
            width: 220px;
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
        </tr>
        <tr>
            <td>
                &nbsp;</td>
            <td colspan="2">
    <asp:GridView ID="GridView1" runat="server" onrowcommand="GridView1_RowCommand" 
                    onselectedindexchanged="GridView1_SelectedIndexChanged">
        <Columns>
            <asp:TemplateField HeaderText="View Profile">
                <ItemTemplate>
                    <asp:LinkButton ID="LinkButton1" CommandName="Vieww" CausesValidation="false" 
                        CommandArgument='<%#Eval("Employee_ID") %>' runat="server">View</asp:LinkButton>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </asp:GridView>
            </td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
            <td colspan="2">
                <asp:Panel ID="Panel1" runat="server">
                    <table class="style1">
                        <tr>
                            <td colspan="3">
                                <asp:TabContainer ID="TabContainer1" runat="server" ActiveTabIndex="3" 
                                    Height="476px" ScrollBars="Both" Width="940px">
                                    <asp:TabPanel ID="TabPanel1" runat="server" HeaderText="TabPanel1">
                                        <HeaderTemplate>
                                            Personal Detail
                                        </HeaderTemplate>
                                        <ContentTemplate>
                                            <table class="style1">
                                                <tr>
                                                    <td class="style2">
                                                        Full Name :</td>
                                                    <td class="style16">
                                                        <asp:Label ID="lblFullName" runat="server" Text="Label"></asp:Label>
                                                    </td>
                                                    <td>
                                                        &nbsp;</td>
                                                    <td>
                                                        &nbsp;</td>
                                                </tr>
                                                <tr>
                                                    <td class="style2">
                                                        Parmenant Address :</td>
                                                    <td class="style16">
                                                        <asp:Label ID="lblPAddress" runat="server" Text="Label"></asp:Label>
                                                    </td>
                                                    <td>
                                                        &nbsp;</td>
                                                    <td>
                                                        &nbsp;</td>
                                                </tr>
                                                <tr>
                                                    <td class="style2">
                                                        Current Address :</td>
                                                    <td class="style17">
                                                        <asp:Label ID="lblCAddress" runat="server" Text="Label"></asp:Label>
                                                    </td>
                                                    <td>
                                                        &nbsp;</td>
                                                    <td>
                                                        &nbsp;</td>
                                                </tr>
                                                <tr>
                                                    <td class="style2">
                                                        Date Of Birth :</td>
                                                    <td class="style16">
                                                        <asp:Label ID="lblDOB" runat="server" Text="Label"></asp:Label>
                                                    </td>
                                                    <td>
                                                        &nbsp;</td>
                                                    <td>
                                                        &nbsp;</td>
                                                </tr>
                                                <tr>
                                                    <td class="style2">
                                                        Gender :</td>
                                                    <td class="style16">
                                                        <asp:Label ID="lblGender" runat="server" Text="Label"></asp:Label>
                                                    </td>
                                                    <td>
                                                        &nbsp;</td>
                                                    <td>
                                                        &nbsp;</td>
                                                </tr>
                                                <tr>
                                                    <td class="style2">
                                                        Marital Status :</td>
                                                    <td class="style16">
                                                        <asp:Label ID="lblMaritalStatus" runat="server" Text="Label"></asp:Label>
                                                    </td>
                                                    <td>
                                                        &nbsp;</td>
                                                    <td>
                                                        &nbsp;</td>
                                                </tr>
                                                <tr>
                                                    <td class="style2">
                                                        Country :</td>
                                                    <td class="style16">
                                                        <asp:Label ID="lblCountry" runat="server" Text="Label"></asp:Label>
                                                    </td>
                                                    <td>
                                                        &nbsp;</td>
                                                    <td>
                                                        &nbsp;</td>
                                                </tr>
                                                <tr>
                                                    <td class="style2">
                                                        State :</td>
                                                    <td class="style16">
                                                        <asp:Label ID="lblState" runat="server" Text="Label"></asp:Label>
                                                    </td>
                                                    <td>
                                                        &nbsp;</td>
                                                    <td>
                                                        &nbsp;</td>
                                                </tr>
                                                <tr>
                                                    <td class="style2">
                                                        City :</td>
                                                    <td class="style16">
                                                        <asp:Label ID="lblCity" runat="server" Text="Label"></asp:Label>
                                                    </td>
                                                    <td>
                                                        &nbsp;</td>
                                                    <td>
                                                        &nbsp;</td>
                                                </tr>
                                                <tr>
                                                    <td class="style2">
                                                        PinCode :</td>
                                                    <td class="style16">
                                                        <asp:Label ID="lblPinCode" runat="server" Text="Label"></asp:Label>
                                                    </td>
                                                    <td>
                                                        &nbsp;</td>
                                                    <td>
                                                        &nbsp;</td>
                                                </tr>
                                                <tr>
                                                    <td class="style2">
                                                        Contact No. :</td>
                                                    <td class="style16">
                                                        <asp:Label ID="lblContactNo" runat="server" Text="Label"></asp:Label>
                                                    </td>
                                                    <td>
                                                        &nbsp;</td>
                                                    <td>
                                                        &nbsp;</td>
                                                </tr>
                                                <tr>
                                                    <td class="style2">
                                                        E- mail :</td>
                                                    <td class="style16">
                                                        <asp:Label ID="lblEmailID" runat="server" Text="Label"></asp:Label>
                                                    </td>
                                                    <td>
                                                        &nbsp;</td>
                                                    <td>
                                                        &nbsp;</td>
                                                </tr>
                                                <tr>
                                                    <td class="style2">
                                                        Blood Group :</td>
                                                    <td class="style16">
                                                        <asp:Label ID="lblBloodGroup" runat="server" Text="Label"></asp:Label>
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
                                                        &nbsp;</td>
                                                    <td>
                                                        &nbsp;</td>
                                                </tr>
                                            </table>
                                        </ContentTemplate>
                                    </asp:TabPanel>
                                    <asp:TabPanel ID="TabPanel2" runat="server" HeaderText="TabPanel2">
                                        <HeaderTemplate>
                                            Educational&nbsp; Detail
                                        </HeaderTemplate>
                                        <ContentTemplate>
                                            <table class="style1">
                                                <tr>
                                                    <td class="style34">
                                                        &nbsp;</td>
                                                    <td class="style3">
                                                        Qualification :</td>
                                                    <td class="style16">
                                                        <asp:Label ID="lblQualification" runat="server" Text="Label"></asp:Label>
                                                    </td>
                                                    <td>
                                                        &nbsp;</td>
                                                </tr>
                                                <tr>
                                                    <td class="style34">
                                                        &nbsp;</td>
                                                    <td class="style3">
                                                        Affected University :</td>
                                                    <td class="style16">
                                                        <asp:Label ID="lblAffectedUniversity" runat="server" Text="Label"></asp:Label>
                                                    </td>
                                                    <td>
                                                        &nbsp;</td>
                                                </tr>
                                                <tr>
                                                    <td class="style34">
                                                        &nbsp;</td>
                                                    <td class="style3">
                                                        Skill Sets :</td>
                                                    <td class="style16">
                                                        <asp:Label ID="lblSkillSet" runat="server" Text="Label"></asp:Label>
                                                    </td>
                                                    <td>
                                                        &nbsp;</td>
                                                </tr>
                                                <tr>
                                                    <td class="style34">
                                                        &nbsp;</td>
                                                    <td class="style3">
                                                        1st Highest Degree :</td>
                                                    <td class="style16">
                                                        <asp:Label ID="lbl1Degree" runat="server" Text="Label"></asp:Label>
                                                    </td>
                                                    <td>
                                                        &nbsp;</td>
                                                </tr>
                                                <tr>
                                                    <td class="style34">
                                                        &nbsp;</td>
                                                    <td class="style3">
                                                        2st Highest Degree :</td>
                                                    <td class="style16">
                                                        <asp:Label ID="lbl2Degree" runat="server" Text="Label"></asp:Label>
                                                    </td>
                                                    <td>
                                                        &nbsp;</td>
                                                </tr>
                                                <tr>
                                                    <td class="style34">
                                                        &nbsp;</td>
                                                    <td class="style3">
                                                        3st Highest Degree :</td>
                                                    <td class="style16">
                                                        <asp:Label ID="lbl3Degree" runat="server" Text="Label"></asp:Label>
                                                    </td>
                                                    <td>
                                                        &nbsp;</td>
                                                </tr>
                                                <tr>
                                                    <td class="style34">
                                                        &nbsp;</td>
                                                    <td class="style3">
                                                        4st Highest Degree :</td>
                                                    <td class="style16">
                                                        <asp:Label ID="lbl4Degree" runat="server" Text="Label"></asp:Label>
                                                    </td>
                                                    <td>
                                                        &nbsp;</td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        &nbsp;</td>
                                                    <td class="style3">
                                                        &nbsp;</td>
                                                    <td>
                                                        &nbsp;</td>
                                                    <td>
                                                        &nbsp;</td>
                                                </tr>
                                            </table>
                                        </ContentTemplate>
                                    </asp:TabPanel>
                                    <asp:TabPanel ID="TabPanel3" runat="server" HeaderText="TabPanel3">
                                        <HeaderTemplate>
                                            Professional Detail
                                        </HeaderTemplate>
                                        <ContentTemplate>
                                            <table class="style1">
                                                <tr>
                                                    <td class="style38">
                                                        &nbsp;</td>
                                                    <td class="style4">
                                                        Department :</td>
                                                    <td class="style16">
                                                        <asp:Label ID="lblDepartment" runat="server" Text="Label"></asp:Label>
                                                    </td>
                                                    <td>
                                                        &nbsp;</td>
                                                </tr>
                                                <tr>
                                                    <td class="style38">
                                                        &nbsp;</td>
                                                    <td class="style4">
                                                        Designation :</td>
                                                    <td class="style16">
                                                        <asp:Label ID="lblDesignation" runat="server" Text="Label"></asp:Label>
                                                    </td>
                                                    <td>
                                                        &nbsp;</td>
                                                </tr>
                                                <tr>
                                                    <td class="style38">
                                                        &nbsp;</td>
                                                    <td class="style4">
                                                        Job Type :</td>
                                                    <td class="style16">
                                                        <asp:Label ID="lblJobType" runat="server" Text="Label"></asp:Label>
                                                    </td>
                                                    <td>
                                                        &nbsp;</td>
                                                </tr>
                                                <tr>
                                                    <td class="style38">
                                                        &nbsp;</td>
                                                    <td class="style4">
                                                        Previous Company Name :</td>
                                                    <td class="style16">
                                                        <asp:Label ID="lblPreviousComName" runat="server" Text="Label"></asp:Label>
                                                    </td>
                                                    <td>
                                                        &nbsp;</td>
                                                </tr>
                                                <tr>
                                                    <td class="style38">
                                                        &nbsp;</td>
                                                    <td class="style4">
                                                        Previous Department :</td>
                                                    <td class="style16">
                                                        <asp:Label ID="lblPreviousDept" runat="server" Text="Label"></asp:Label>
                                                    </td>
                                                    <td>
                                                        &nbsp;</td>
                                                </tr>
                                                <tr>
                                                    <td class="style38">
                                                        &nbsp;</td>
                                                    <td class="style4">
                                                        Previous Designation</td>
                                                    <td class="style16">
                                                        <asp:Label ID="lblPreviousDesignation" runat="server" Text="Label"></asp:Label>
                                                    </td>
                                                    <td>
                                                        &nbsp;</td>
                                                </tr>
                                                <tr>
                                                    <td class="style36">
                                                        &nbsp;</td>
                                                    <td class="style4">
                                                        Date Of Joining :</td>
                                                    <td class="style19">
                                                        <asp:Label ID="lblDOJ" runat="server" Text="Label"></asp:Label>
                                                    </td>
                                                    <td>
                                                        &nbsp;</td>
                                                </tr>
                                                <tr>
                                                    <td class="style38">
                                                        &nbsp;</td>
                                                    <td class="style4">
                                                        Date Of Leaving :</td>
                                                    <td class="style16">
                                                        <asp:Label ID="lblDOL" runat="server" Text="Label"></asp:Label>
                                                    </td>
                                                    <td>
                                                        &nbsp;</td>
                                                </tr>
                                                <tr>
                                                    <td class="style38">
                                                        &nbsp;</td>
                                                    <td class="style4">
                                                        Last Salary :</td>
                                                    <td class="style16">
                                                        <asp:Label ID="lblLastSalary" runat="server" Text="Label"></asp:Label>
                                                    </td>
                                                    <td>
                                                        &nbsp;</td>
                                                </tr>
                                                <tr>
                                                    <td class="style38">
                                                        &nbsp;</td>
                                                    <td class="style4">
                                                        Experience :</td>
                                                    <td class="style16">
                                                        <asp:Label ID="lblExperience" runat="server" Text="Label"></asp:Label>
                                                    </td>
                                                    <td>
                                                        &nbsp;</td>
                                                </tr>
                                                <tr>
                                                    <td class="style38">
                                                        &nbsp;</td>
                                                    <td class="style4">
                                                        Previous Company Contact No :</td>
                                                    <td class="style16">
                                                        <asp:Label ID="lblPreComContact" runat="server" Text="Label"></asp:Label>
                                                    </td>
                                                    <td>
                                                        &nbsp;</td>
                                                </tr>
                                                <tr>
                                                    <td class="style37">
                                                        &nbsp;</td>
                                                    <td class="style4">
                                                        Previous Company Email Id :</td>
                                                    <td class="style20">
                                                        <asp:Label ID="lblPreComEmailID" runat="server" Text="Label"></asp:Label>
                                                    </td>
                                                    <td>
                                                        &nbsp;</td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        &nbsp;</td>
                                                    <td class="style4">
                                                        &nbsp;</td>
                                                    <td>
                                                        &nbsp;</td>
                                                    <td>
                                                        &nbsp;</td>
                                                </tr>
                                            </table>
                                        </ContentTemplate>
                                    </asp:TabPanel>
                                    <asp:TabPanel ID="TabPanel4" runat="server" HeaderText="TabPanel4">
                                        <HeaderTemplate>
                                            Emargenct Contact Detail
                                        </HeaderTemplate>
                                        <ContentTemplate>
                                            <table class="style1">
                                                <tr>
                                                    <td class="style39">
                                                        &nbsp;</td>
                                                    <td class="style5">
                                                        Person Name :</td>
                                                    <td class="style16">
                                                        <asp:Label ID="lblPersonName" runat="server" Text="Label"></asp:Label>
                                                    </td>
                                                    <td>
                                                        &nbsp;</td>
                                                </tr>
                                                <tr>
                                                    <td class="style39">
                                                        &nbsp;</td>
                                                    <td class="style5">
                                                        Relationship :</td>
                                                    <td class="style16">
                                                        <asp:Label ID="lblRelationship" runat="server" Text="Label"></asp:Label>
                                                    </td>
                                                    <td>
                                                        &nbsp;</td>
                                                </tr>
                                                <tr>
                                                    <td class="style39">
                                                        &nbsp;</td>
                                                    <td class="style5">
                                                        Address :</td>
                                                    <td class="style16">
                                                        <asp:Label ID="lblAddress" runat="server" Text="Label"></asp:Label>
                                                    </td>
                                                    <td>
                                                        &nbsp;</td>
                                                </tr>
                                                <tr>
                                                    <td class="style39">
                                                        &nbsp;</td>
                                                    <td class="style5">
                                                        Contact No :</td>
                                                    <td class="style18">
                                                        <asp:Label ID="lblEContactNo" runat="server" Text="Label"></asp:Label>
                                                    </td>
                                                    <td>
                                                        &nbsp;</td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        &nbsp;</td>
                                                    <td class="style5">
                                                        &nbsp;</td>
                                                    <td>
                                                        &nbsp;</td>
                                                    <td>
                                                        &nbsp;</td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        &nbsp;</td>
                                                    <td class="style5">
                                                        &nbsp;</td>
                                                    <td>
                                                        &nbsp;</td>
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
                                <asp:ScriptManager ID="ScriptManager1" runat="server">
                                </asp:ScriptManager>
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
    </table>
</asp:Content>

