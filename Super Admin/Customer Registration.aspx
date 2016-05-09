<%@ Page Title="" Language="C#" MasterPageFile="~/Super Admin/admin.master" AutoEventWireup="true" CodeFile="Customer Registration.aspx.cs" Inherits="Employee_General_Customer_Registration" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .style1
        {
            width: 100%;
        }
        .style17
        {
            width: 204px;
        }
        .style16
        {
            width: 232px;
        }
        .style13
        {
            color: #FF0000;
        }
        .style15
        {
            width: 246px;
        }
        .style18
        {
            width: 204px;
            height: 30px;
        }
        .style19
        {
            width: 232px;
            height: 30px;
        }
        .style20
        {
            width: 246px;
            height: 30px;
        }
        .style22
        {
            width: 204px;
            height: 26px;
        }
        .style23
        {
            width: 232px;
            height: 26px;
        }
        .style24
        {
            width: 246px;
            height: 26px;
        }
        .style25
        {
        }
        </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table class="style1">
        <tr>
            <td class="style25">
                &nbsp;</td>
            <td class="style17">
                &nbsp;</td>
            <td class="style16">
                &nbsp;</td>
            <td class="style15">
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style25" colspan="5">
                <asp:TabContainer ID="TabContainer1" runat="server" ActiveTabIndex="0" 
                    Height="830px" ScrollBars="Both" Width="968px">
                    <asp:TabPanel ID="TabPanel1" runat="server" HeaderText="TabPanel1">
                        <HeaderTemplate>
                            General Detail
                        </HeaderTemplate>
                        <ContentTemplate>
                            <table class="style1">
                                <tr>
                                    <td class="style17">
                                        Customer Name :
                                    </td>
                                    <td class="style16">
                                        <asp:TextBox ID="txtCustomerName" runat="server"></asp:TextBox>
                                        &nbsp;<span class="style13">*</span></td>
                                    <td class="style15">
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" 
                                            ControlToValidate="txtCustomerName" ErrorMessage="Enter Proper Name" 
                                            ForeColor="Red"></asp:RequiredFieldValidator>
                                    </td>
                                    <td>
                                        &nbsp;</td>
                                </tr>
                                <tr>
                                    <td class="style17">
                                        Address :</td>
                                    <td class="style16">
                                        <asp:TextBox ID="txtCustomerAddress" runat="server" TextMode="MultiLine"></asp:TextBox>
                                        &nbsp;<span class="style13">*</span></td>
                                    <td class="style15">
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" 
                                            ControlToValidate="txtCustomerAddress" ErrorMessage="Enter Proper Address" 
                                            ForeColor="Red"></asp:RequiredFieldValidator>
                                    </td>
                                    <td>
                                        &nbsp;</td>
                                </tr>
                                <tr>
                                    <td class="style17">
                                        Pin Code :</td>
                                    <td class="style16">
                                        <asp:TextBox ID="txtPinCode" runat="server"></asp:TextBox>
                                    </td>
                                    <td class="style15">
                                        &nbsp;</td>
                                    <td>
                                        &nbsp;</td>
                                </tr>
                                <tr>
                                    <td class="style17">
                                        Country :</td>
                                    <td class="style16">
                                        <asp:DropDownList ID="ddCountry" runat="server" AutoPostBack="True" 
                                            OnSelectedIndexChanged="ddCountry_SelectedIndexChanged">
                                        </asp:DropDownList>
                                        &nbsp;<span class="style13">*</span></td>
                                    <td class="style15">
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" 
                                            ControlToValidate="ddCountry" ErrorMessage="Select Country" ForeColor="Red"></asp:RequiredFieldValidator>
                                    </td>
                                    <td>
                                        &nbsp;</td>
                                </tr>
                                <tr>
                                    <td class="style17">
                                        State :</td>
                                    <td class="style16">
                                        <asp:DropDownList ID="ddState" runat="server" AutoPostBack="True" 
                                            OnSelectedIndexChanged="ddState_SelectedIndexChanged">
                                        </asp:DropDownList>
                                        &nbsp;<span class="style13">*</span></td>
                                    <td class="style15">
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" 
                                            ControlToValidate="ddState" ErrorMessage="Select State" ForeColor="Red"></asp:RequiredFieldValidator>
                                    </td>
                                    <td>
                                        &nbsp;</td>
                                </tr>
                                <tr>
                                    <td class="style17">
                                        City :</td>
                                    <td class="style16">
                                        <asp:DropDownList ID="ddCity" runat="server" AutoPostBack="True" 
                                            OnSelectedIndexChanged="ddCity_SelectedIndexChanged">
                                        </asp:DropDownList>
                                        &nbsp;<span class="style13">*</span></td>
                                    <td class="style15">
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" 
                                            ControlToValidate="ddCity" ErrorMessage="Select City" ForeColor="Red"></asp:RequiredFieldValidator>
                                    </td>
                                    <td>
                                        &nbsp;</td>
                                </tr>
                                <tr>
                                    <td class="style17">
                                        Branch :</td>
                                    <td class="style16">
                                        <asp:DropDownList ID="ddBranch" runat="server">
                                        </asp:DropDownList>
                                        &nbsp;<span class="style13">*</span></td>
                                    <td class="style15">
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator12" runat="server" 
                                            ControlToValidate="ddBranch" ErrorMessage="Select Branch" ForeColor="Red"></asp:RequiredFieldValidator>
                                    </td>
                                    <td>
                                        &nbsp;</td>
                                </tr>
                                <tr>
                                    <td class="style18">
                                        Contact :</td>
                                    <td class="style19">
                                        <asp:TextBox ID="txtContact" runat="server"></asp:TextBox>
                                        &nbsp;<span class="style13">*</span></td>
                                    <td class="style20">
                                        <asp:RegularExpressionValidator ID="RegularExpressionValidator5" runat="server" 
                                            ControlToValidate="txtContact" ErrorMessage="Enter 10 digit Mobile No" 
                                            ForeColor="Red" ValidationExpression="\d{10}"></asp:RegularExpressionValidator>
                                    </td>
                                    <td>
                                        &nbsp;</td>
                                </tr>
                                <tr>
                                    <td class="style22">
                                        Mob No. :</td>
                                    <td class="style23">
                                        <asp:TextBox ID="txtMobileNo" runat="server"></asp:TextBox>
                                        &nbsp;<span class="style13">*</span></td>
                                    <td class="style24">
                                        <asp:RegularExpressionValidator ID="RegularExpressionValidator6" runat="server" 
                                            ControlToValidate="txtMobileNo" ErrorMessage="Enter 10 digit Mobile No" 
                                            ForeColor="Red" ValidationExpression="^[789]\d{9}$"></asp:RegularExpressionValidator>
                                    </td>
                                    <td>
                                        &nbsp;</td>
                                </tr>
                                <tr>
                                    <td class="style17">
                                        Email ID :</td>
                                    <td class="style16">
                                        <asp:TextBox ID="txtEmailID" runat="server"></asp:TextBox>
                                        &nbsp;<span class="style13">*</span></td>
                                    <td class="style15">
                                        <asp:RegularExpressionValidator ID="RegularExpressionValidator7" runat="server" 
                                            ControlToValidate="txtEmailID" ErrorMessage="Enter Proper Email ID" 
                                            ForeColor="Red" 
                                            ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                                    </td>
                                    <td>
                                        &nbsp;</td>
                                </tr>
                                <tr>
                                    <td class="style17">
                                        Occuption :</td>
                                    <td class="style16">
                                        <asp:TextBox ID="txtOccupation" runat="server"></asp:TextBox>
                                    </td>
                                    <td class="style15">
                                        &nbsp;</td>
                                    <td>
                                        &nbsp;</td>
                                </tr>
                                <tr>
                                    <td class="style17">
                                        Gender :</td>
                                    <td class="style16">
                                        <asp:RadioButtonList ID="rbGender" runat="server" RepeatDirection="Horizontal">
                                            <asp:ListItem>Male</asp:ListItem>
                                            <asp:ListItem>Female</asp:ListItem>
                                        </asp:RadioButtonList>
                                        &nbsp;</td>
                                    <td class="style15">
                                        &nbsp;</td>
                                    <td>
                                        &nbsp;</td>
                                </tr>
                                <tr>
                                    <td class="style17">
                                        Marital Status :</td>
                                    <td class="style16">
                                        <asp:RadioButtonList ID="rbMaritalStatus" runat="server" 
                                            RepeatDirection="Horizontal">
                                            <asp:ListItem>Married</asp:ListItem>
                                            <asp:ListItem>Unmarried</asp:ListItem>
                                        </asp:RadioButtonList>
                                    </td>
                                    <td class="style15">
                                        &nbsp;</td>
                                    <td>
                                        &nbsp;</td>
                                </tr>
                                <tr>
                                    <td class="style17">
                                        Date Of Birth :</td>
                                    <td class="style16">
                                        <asp:TextBox ID="txtDOB" runat="server"></asp:TextBox>
                                        &nbsp;</td>
                                    <td class="style15">
                                        &nbsp;</td>
                                    <td>
                                        &nbsp;</td>
                                </tr>
                                <tr>
                                    <td class="style17">
                                        FingerPrint</td>
                                    <td class="style16">
                                        <asp:TextBox ID="txtFingerprint" runat="server"></asp:TextBox>
                                    </td>
                                    <td class="style15">
                                        &nbsp;</td>
                                    <td>
                                        &nbsp;</td>
                                </tr>
                                <tr>
                                    <td class="style17">
                                        RFID :</td>
                                    <td class="style16">
                                        <asp:TextBox ID="txtRFID" runat="server"></asp:TextBox>
                                    </td>
                                    <td class="style15">
                                        &nbsp;</td>
                                    <td>
                                        &nbsp;</td>
                                </tr>
                                <tr>
                                    <td class="style17">
                                        &nbsp;</td>
                                    <td class="style16">
                                        &nbsp;</td>
                                    <td class="style15">
                                        <asp:Label ID="lblMsg" runat="server" Text="Label"></asp:Label>
                                    </td>
                                    <td>
                                        &nbsp;</td>
                                </tr>
                                <tr>
                                    <td class="style17">
                                        <asp:Button ID="btnInsert" runat="server" OnClick="btnInsert_Click" 
                                            Text="Insert" />
                                    </td>
                                    <td class="style16">
                                        <asp:Button ID="btnUpdate" runat="server" OnClick="btnUpdate_Click" 
                                            Text="Update" />
                                    </td>
                                    <td class="style15">
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
                                </tr>
                                <tr>
                                    <td colspan="4">
                                        <asp:GridView ID="GridView1" runat="server" OnRowCommand="GridView1_RowCommand" 
                                            OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
                                            <Columns>
                                                <asp:TemplateField HeaderText="Edit">
                                                    <ItemTemplate>
                                                        <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="false" 
                                                            CommandArgument='<%#Eval("Customer_ID") %>' CommandName="Editt">Edit</asp:LinkButton>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Delete">
                                                    <ItemTemplate>
                                                        <asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="false" 
                                                            CommandArgument='<%#Eval("Customer_ID") %>' CommandName="Deletee">Delete</asp:LinkButton>
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
                            Authentication Detail
                        </HeaderTemplate>
                        <ContentTemplate>
                            <table class="style1">
                                <tr>
                                    <td>
                                        Customer ID :</td>
                                    <td>
                                        <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
                                    </td>
                                    <td>
                                        &nbsp;</td>
                                    <td>
                                        &nbsp;</td>
                                </tr>
                                <tr>
                                    <td>
                                        Customer Name :</td>
                                    <td>
                                        <asp:Label ID="Label2" runat="server" Text="Label"></asp:Label>
                                    </td>
                                    <td>
                                        &nbsp;</td>
                                    <td>
                                        &nbsp;</td>
                                </tr>
                                <tr>
                                    <td>
                                        FingerPrint ID :</td>
                                    <td>
                                        <asp:Label ID="Label3" runat="server" Text="Label"></asp:Label>
                                    </td>
                                    <td>
                                        &nbsp;</td>
                                    <td>
                                        &nbsp;</td>
                                </tr>
                                <tr>
                                    <td>
                                        RFID ID:</td>
                                    <td>
                                        <asp:Label ID="Label4" runat="server" Text="Label"></asp:Label>
                                    </td>
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
                                </tr>
                            </table>
                        </ContentTemplate>
                    </asp:TabPanel>
                </asp:TabContainer>
            </td>
        </tr>
        <tr>
            <td class="style25">
                &nbsp;</td>
            <td class="style17">
                &nbsp;</td>
            <td class="style16">
                &nbsp;</td>
            <td class="style15">
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        </table>
</asp:Content>

