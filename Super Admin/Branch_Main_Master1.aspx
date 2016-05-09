<%@ Page Title="" Language="C#" MasterPageFile="~/Super Admin/admin.master" AutoEventWireup="true" CodeFile="Branch_Main_Master1.aspx.cs" Inherits="Branch_Main_Master1" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .style1
        {
            height: 132px;
            width: 930px;
        }
        .style9
        {
            color: #FF0000;
        }
        
        .style3
        {
            height: 26px;
        }
        .style4
        {
            height: 23px;
        }
        .style7
        {
        }
        .style21
        {
            width: 291px;
        }
        .style24
        {
            width: 276px;
        }
        .style25
        {
            width: 137px;
        }
        .style26
        {
            height: 27px;
        }
        .style27
        {
            height: 27px;
        }
        .style28
        {
            color: #FF0000;
            height: 27px;
        }
        .style12
        {
            width: 855px;
            color: #FF0000;
        }
        .style31
        {
        }
        .style32
        {
            width: 237px;
        }
        .style34
        {
            width: 321px;
        }
        .style35
        {
            width: 660px;
        }
        .style36
        {
            height: 27px;
            width: 660px;
        }
        .style37
        {
            width: 345px;
        }
        .style38
        {
            width: 345px;
            height: 27px;
        }
        .style39
        {
            width: 137px;
            height: 28px;
        }
        .style40
        {
            width: 291px;
            height: 28px;
        }
        .style41
        {
            width: 276px;
            height: 28px;
        }
        .style42
        {
            height: 28px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <table class="style1">
        <tr>
            <td>
                <asp:TabContainer ID="TabContainer1" runat="server" ActiveTabIndex="1" 
                    Height="637px" Width="966px">
                    <asp:TabPanel ID="TabPanel1" runat="server" HeaderText="TabPanel1">
                        <HeaderTemplate>
                            General Detail
                        </HeaderTemplate>
                        <ContentTemplate>
                            <table class="style1">
                                <tr>
                                    <td>
                                        Select Country :</td>
                                    <td>
                                        <asp:DropDownList ID="ddCountryName" runat="server" AutoPostBack="True" 
                                            OnSelectedIndexChanged="ddCountryName_SelectedIndexChanged">
                                        </asp:DropDownList>
                                        &nbsp;<span class="style9">*</span></td>
                                    <td>
                                        &nbsp;</td>
                                    <td>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                                            ControlToValidate="ddCountryName" ErrorMessage="Select Proper Country" 
                                            ForeColor="Red" ValidationGroup="gd"></asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        Select State :</td>
                                    <td>
                                        <asp:DropDownList ID="ddStateName" runat="server" AutoPostBack="True" 
                                            OnSelectedIndexChanged="ddStateName_SelectedIndexChanged">
                                        </asp:DropDownList>
                                        &nbsp;<span class="style9">*</span></td>
                                    <td>
                                        &nbsp;</td>
                                    <td>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                                            ControlToValidate="ddStateName" ErrorMessage="Select Proper State" 
                                            ForeColor="Red" ValidationGroup="gd"></asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        Select City :</td>
                                    <td>
                                        <asp:DropDownList ID="ddCityName" runat="server" AutoPostBack="True" 
                                            OnSelectedIndexChanged="ddCityName_SelectedIndexChanged">
                                        </asp:DropDownList>
                                        &nbsp;<span class="style9">*</span></td>
                                    <td>
                                        &nbsp;</td>
                                    <td>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                                            ControlToValidate="ddCityName" ErrorMessage="Select Proper City" 
                                            ForeColor="Red" ValidationGroup="gd"></asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="style3">
                                        Select Branch :</td>
                                    <td class="style3">
                                        <asp:DropDownList ID="ddBranchName" runat="server">
                                        </asp:DropDownList>
                                        &nbsp;<span class="style9">*</span></td>
                                    <td class="style3">
                                    </td>
                                    <td class="style3">
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                                            ControlToValidate="ddBranchName" ErrorMessage="Select Proper Branch" 
                                            ForeColor="Red" ValidationGroup="gd"></asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        Branch Shop Name :</td>
                                    <td>
                                        <asp:TextBox ID="txtBranchShopName" runat="server"></asp:TextBox>
                                        &nbsp;<span class="style9">*</span></td>
                                    <td>
                                        &nbsp;</td>
                                    <td>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" 
                                            ControlToValidate="txtBranchShopName" ErrorMessage="Enter Proper Name" 
                                            ForeColor="Red" ValidationGroup="gd"></asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="style4">
                                        Address :</td>
                                    <td class="style4">
                                        <asp:TextBox ID="txtAddress" runat="server" TextMode="MultiLine"></asp:TextBox>
                                        &nbsp;<span class="style9">*</span></td>
                                    <td class="style4">
                                    </td>
                                    <td class="style4">
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" 
                                            ControlToValidate="txtAddress" ErrorMessage="Enter Proper Address" 
                                            ForeColor="Red" ValidationGroup="gd"></asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        Contact Person Name :</td>
                                    <td>
                                        <asp:TextBox ID="txtContactPersonName" runat="server"></asp:TextBox>
                                        &nbsp;<span class="style9">*</span></td>
                                    <td>
                                        &nbsp;</td>
                                    <td>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" 
                                            ControlToValidate="txtContactPersonName" ErrorMessage="Enter Proper Name" 
                                            ForeColor="Red" ValidationGroup="gd"></asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        Contact No (Person) :</td>
                                    <td>
                                        <asp:TextBox ID="txtCPContactNo" runat="server"></asp:TextBox>
                                    </td>
                                    <td>
                                        &nbsp;</td>
                                    <td>
                                        &nbsp;</td>
                                </tr>
                                <tr>
                                    <td class="style3">
                                        Department :</td>
                                    <td class="style3">
                                        <asp:DropDownList ID="ddDepartment" runat="server" 
                                            OnSelectedIndexChanged="ddDepartment_SelectedIndexChanged" style="height: 22px">
                                        </asp:DropDownList>
                                        &nbsp;<span class="style9">*</span></td>
                                    <td class="style3">
                                    </td>
                                    <td class="style3">
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" 
                                            ControlToValidate="ddDepartment" ErrorMessage="Select Proper Department" 
                                            ForeColor="Red" ValidationGroup="gd"></asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        Designation :</td>
                                    <td>
                                        <asp:DropDownList ID="ddDesignation" runat="server">
                                        </asp:DropDownList>
                                        &nbsp;<span class="style9">*</span></td>
                                    <td>
                                        &nbsp;</td>
                                    <td>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" 
                                            ControlToValidate="ddDesignation" ErrorMessage="Select Proper Designation" 
                                            ForeColor="Red" ValidationGroup="gd"></asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        Email ID :</td>
                                    <td>
                                        <asp:TextBox ID="txtEmailID" runat="server"></asp:TextBox>
                                        &nbsp;<span class="style9">*</span></td>
                                    <td>
                                        &nbsp;</td>
                                    <td>
                                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
                                            ControlToValidate="txtEmailID" ErrorMessage="Enter Proper Email ID" 
                                            ForeColor="Red" 
                                            ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" 
                                            ValidationGroup="gd"></asp:RegularExpressionValidator>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        Website :</td>
                                    <td>
                                        <asp:TextBox ID="txtWebsite" runat="server"></asp:TextBox>
                                    </td>
                                    <td>
                                        &nbsp;</td>
                                    <td>
                                        &nbsp;</td>
                                </tr>
                                <tr>
                                    <td>
                                        Established Year :</td>
                                    <td>
                                        <asp:TextBox ID="txtEstablishedYear" runat="server"></asp:TextBox>
                                    </td>
                                    <td>
                                        &nbsp;</td>
                                    <td>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator20" runat="server" 
                                            ErrorMessage="Enter proper year" ForeColor="Red" 
                                            ControlToValidate="txtEstablishedYear"></asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        Government Registration Detail :</td>
                                    <td>
                                        <asp:TextBox ID="txtGovtRegDetail" runat="server"></asp:TextBox>
                                        &nbsp;<span class="style9">*</span></td>
                                    <td>
                                        &nbsp;</td>
                                    <td>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" 
                                            ControlToValidate="txtGovtRegDetail" ErrorMessage="Enter Proper Detail" 
                                            ForeColor="Red" ValidationGroup="gd"></asp:RequiredFieldValidator>
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
                                    <td>
                                        <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Next" />
                                    </td>
                                    <td>
                                        &nbsp;</td>
                                    <td>
                                        &nbsp;</td>
                                    <td>
                                        <asp:ScriptManager ID="ScriptManager2" runat="server">
                                        </asp:ScriptManager>
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
                    <asp:TabPanel ID="TabPanel2" runat="server" HeaderText="TabPanel2">
                        <HeaderTemplate>
                            Branch Shop Speciication
                        </HeaderTemplate>
                        <ContentTemplate>
                            <table class="style1">
                                <tr>
                                    <td class="style37">
                                        &nbsp;</td>
                                    <td class="style35">
                                        &nbsp;</td>
                                    <td class="style12">
                                        &nbsp;</td>
                                    <td class="style27">
                                        &nbsp;</td>
                                </tr>
                                <tr>
                                    <td class="style37">
                                        &nbsp;</td>
                                    <td class="style35">
                                        &nbsp;</td>
                                    <td class="style12">
                                        &nbsp;</td>
                                    <td class="style27">
                                        &nbsp;</td>
                                </tr>
                                <tr>
                                    <td class="style37">
                                        OwnerShip :</td>
                                    <td class="style35">
                                        <asp:RadioButtonList ID="rblOwnership" runat="server" AutoPostBack="True" 
                                            OnSelectedIndexChanged="RadioButtonList1_SelectedIndexChanged" 
                                            RepeatDirection="Horizontal">
                                            <asp:ListItem>Own</asp:ListItem>
                                            <asp:ListItem>Rent</asp:ListItem>
                                        </asp:RadioButtonList>
                                        &nbsp;</td>
                                    <td class="style12">
                                        *&nbsp;&nbsp;
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator12" runat="server" 
                                            ControlToValidate="rblOwnership" ErrorMessage="Select Ownership status" 
                                            ForeColor="Red" ValidationGroup="gd"></asp:RequiredFieldValidator>
                                    </td>
                                    <td class="style27">
                                        &nbsp;</td>
                                </tr>
                                <tr>
                                    <td class="style26" colspan="3">
                                        <table class="style1">
                                            <tr>
                                                <td class="style32">
                                                    Rent Charges :</td>
                                                <td class="style34">
                                                    <asp:TextBox ID="txtRentCharges" runat="server"></asp:TextBox>
                                                </td>
                                                <td>
                                                    <asp:Label ID="Label1" runat="server"></asp:Label>
                                                </td>
                                                <td>
                                                    &nbsp;</td>
                                            </tr>
                                            <tr>
                                                <td class="style32">
                                                    Deposite :</td>
                                                <td class="style34">
                                                    <asp:TextBox ID="txtDeposite" runat="server"></asp:TextBox>
                                                </td>
                                                <td>
                                                    <asp:Label ID="Label2" runat="server"></asp:Label>
                                                </td>
                                                <td>
                                                    &nbsp;</td>
                                            </tr>
                                            <tr>
                                                <td class="style32">
                                                    Original Owner Name :</td>
                                                <td class="style34">
                                                    <asp:TextBox ID="txtOriginalOwnerName" runat="server"></asp:TextBox>
                                                </td>
                                                <td>
                                                    &nbsp;</td>
                                                <td>
                                                    &nbsp;</td>
                                            </tr>
                                            <tr>
                                                <td class="style32">
                                                    Conatct No :</td>
                                                <td class="style34">
                                                    <asp:TextBox ID="txtOriginalOwnerContact" runat="server" 
                                                        style="margin-left: 0px"></asp:TextBox>
                                                </td>
                                                <td>
                                                    &nbsp;</td>
                                                <td>
                                                    &nbsp;</td>
                                            </tr>
                                            <tr>
                                                <td class="style32">
                                                    Rented On :</td>
                                                <td class="style34">
                                                    <asp:TextBox ID="txtRentedFrom" runat="server"></asp:TextBox>
                                                    <asp:CalendarExtender ID="txtRentedFrom_CalendarExtender" runat="server" 
                                                        Enabled="True" TargetControlID="txtRentedFrom">
                                                    </asp:CalendarExtender>
                                                    &nbsp; To&nbsp;
                                                    <asp:TextBox ID="txtRentedTo" runat="server"></asp:TextBox>
                                                    <asp:CalendarExtender ID="txtRentedTo_CalendarExtender" runat="server" 
                                                        Enabled="True" TargetControlID="txtRentedTo">
                                                    </asp:CalendarExtender>
                                                </td>
                                                <td>
                                                    &nbsp;</td>
                                                <td>
                                                    &nbsp;</td>
                                            </tr>
                                            <tr>
                                                <td class="style31" colspan="4">
                                                    <asp:Panel ID="Panel1" runat="server">
                                                    </asp:Panel>
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                    <td class="style27">
                                        &nbsp;</td>
                                </tr>
                                <tr>
                                    <td class="style37">
                                        Facilities :</td>
                                    <td class="style35">
                                        <asp:CheckBoxList ID="cbFacilities" runat="server" AutoPostBack="True" 
                                            Width="170px">
                                            <asp:ListItem>Parking Area</asp:ListItem>
                                            <asp:ListItem>Party Plot</asp:ListItem>
                                            <asp:ListItem>Security Guard</asp:ListItem>
                                        </asp:CheckBoxList>
                                        &nbsp;</td>
                                    <td class="style9">
                                        &nbsp;</td>
                                    <td class="style27">
                                        &nbsp;</td>
                                </tr>
                                <tr>
                                    <td class="style38">
                                        Working Time :</td>
                                    <td class="style36">
                                        <asp:TextBox ID="txtWorkingFrom" runat="server"></asp:TextBox>
                                        &nbsp; To&nbsp;&nbsp;<asp:TextBox ID="txtWorkingTo" runat="server"></asp:TextBox>
                                        &nbsp;<span class="style9">* &nbsp; </span>
                                    </td>
                                    <td class="style28">
                                        <span class="style9">
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator18" runat="server" 
                                            ControlToValidate="txtWorkingFrom" ErrorMessage="Enter Working Time" 
                                            ForeColor="Red" ValidationGroup="gd"></asp:RequiredFieldValidator>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator19" runat="server" 
                                            ControlToValidate="txtWorkingTo" ErrorMessage="Enter Working Time" 
                                            ForeColor="Red" ValidationGroup="gd"></asp:RequiredFieldValidator>
                                        </span>
                                    </td>
                                    <td class="style27">
                                        &nbsp;</td>
                                </tr>
                                <tr>
                                    <td class="style38">
                                        &nbsp;</td>
                                    <td class="style36">
                                        &nbsp;</td>
                                    <td class="style28">
                                        &nbsp;</td>
                                    <td class="style27">
                                        &nbsp;</td>
                                </tr>
                                <tr>
                                    <td class="style37">
                                        Deals in Product :</td>
                                    <td class="style35">
                                        <asp:CheckBoxList ID="cbDealsInProduct" runat="server" AutoPostBack="True">
                                            <asp:ListItem>Electric</asp:ListItem>
                                            <asp:ListItem>Cloth</asp:ListItem>
                                            <asp:ListItem>Provision</asp:ListItem>
                                            <asp:ListItem>Vegetables &amp; Fruits</asp:ListItem>
                                        </asp:CheckBoxList>
                                    </td>
                                    <td>
                                        &nbsp;</td>
                                    <td class="style27">
                                        &nbsp;</td>
                                </tr>
                                <tr>
                                    <td class="style37">
                                        &nbsp;</td>
                                    <td class="style35">
                                        &nbsp;</td>
                                    <td>
                                        &nbsp;</td>
                                    <td class="style27">
                                        &nbsp;</td>
                                </tr>
                                <tr>
                                    <td class="style38">
                                        <asp:Button ID="Button2" runat="server" OnClick="Button2_Click" Text="Next" />
                                    </td>
                                    <td class="style36">
                                        <asp:Button ID="Button3" runat="server" OnClick="Button3_Click" 
                                            Text="Previous" />
                                    </td>
                                    <td class="style28">
                                    </td>
                                    <td class="style27">
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="3">
                                        &nbsp;</td>
                                    <td>
                                        &nbsp;</td>
                                </tr>
                            </table>
                        </ContentTemplate>
                    </asp:TabPanel>
                    <asp:TabPanel ID="TabPanel3" runat="server" HeaderText="TabPanel3">
                        <HeaderTemplate>
                            Document Upload
                        </HeaderTemplate>
                        <ContentTemplate>
                            <table class="style1">
                                <tr>
                                    <td class="style25">
                                        Image :</td>
                                    <td class="style21">
                                        <asp:FileUpload ID="ImageUpload1" runat="server" />
                                        &nbsp;<span class="style9">*</span></td>
                                    <td class="style24">
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator15" runat="server" 
                                            ControlToValidate="ImageUpload1" ErrorMessage="Upload atleast One Image" 
                                            ForeColor="Red" ValidationGroup="gd"></asp:RequiredFieldValidator>
                                    </td>
                                    <td>
                                        &nbsp;</td>
                                </tr>
                                <tr>
                                    <td class="style25">
                                        &nbsp;</td>
                                    <td class="style21">
                                        <asp:FileUpload ID="ImageUpload2" runat="server" />
                                    </td>
                                    <td class="style24">
                                        <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" 
                                            ControlToValidate="ImageUpload1" ErrorMessage="Upload in gif or jpeg format" 
                                            ForeColor="Red" ValidationExpression="(.*?)\.(jpg|gif)$"></asp:RegularExpressionValidator>
                                    </td>
                                    <td>
                                        &nbsp;</td>
                                </tr>
                                <tr>
                                    <td class="style25">
                                        &nbsp;</td>
                                    <td class="style21">
                                        <asp:FileUpload ID="ImageUpload3" runat="server" />
                                    </td>
                                    <td class="style24">
                                        &nbsp;</td>
                                    <td>
                                        &nbsp;</td>
                                </tr>
                                <tr>
                                    <td class="style25">
                                        &nbsp;</td>
                                    <td class="style21">
                                        &nbsp;</td>
                                    <td class="style24">
                                        &nbsp;</td>
                                    <td>
                                        &nbsp;</td>
                                </tr>
                                <tr>
                                    <td class="style25">
                                        Certificate :</td>
                                    <td class="style21">
                                        <asp:FileUpload ID="CertificateUpload1" runat="server" />
                                        &nbsp;<span class="style9">*</span></td>
                                    <td class="style24">
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator16" runat="server" 
                                            ControlToValidate="CertificateUpload1" 
                                            ErrorMessage="Upload atleast one Certificate" ForeColor="Red" 
                                            ValidationGroup="gd"></asp:RequiredFieldValidator>
                                    </td>
                                    <td>
                                        <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" 
                                            ControlToValidate="CertificateUpload1" 
                                            ErrorMessage="Upload in pdf or doc format" ForeColor="Red" 
                                            ValidationExpression="(.*?)\.(jpg|gif)$"></asp:RegularExpressionValidator>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="style25">
                                        &nbsp;</td>
                                    <td class="style21">
                                        <asp:FileUpload ID="CertificateUpload2" runat="server" />
                                    </td>
                                    <td class="style24">
                                        &nbsp;</td>
                                    <td>
                                        &nbsp;</td>
                                </tr>
                                <tr>
                                    <td class="style25">
                                        &nbsp;</td>
                                    <td class="style21">
                                        <asp:FileUpload ID="CertificateUpload3" runat="server" />
                                    </td>
                                    <td class="style24">
                                        &nbsp;</td>
                                    <td>
                                        &nbsp;</td>
                                </tr>
                                <tr>
                                    <td class="style39">
                                        </td>
                                    <td class="style40">
                                        </td>
                                    <td class="style41">
                                        </td>
                                    <td class="style42">
                                        </td>
                                </tr>
                                <tr>
                                    <td class="style39">
                                        Other Detail</td>
                                    <td class="style40">
                                        <asp:FileUpload ID="OtherUpload1" runat="server" />
                                    </td>
                                    <td class="style41">
                                        </td>
                                    <td class="style42">
                                        </td>
                                </tr>
                                <tr>
                                    <td class="style25">
                                        &nbsp;</td>
                                    <td class="style21">
                                        <asp:FileUpload ID="OtherUpload2" runat="server" />
                                    </td>
                                    <td class="style24">
                                        &nbsp;</td>
                                    <td>
                                        &nbsp;</td>
                                </tr>
                                <tr>
                                    <td class="style25">
                                        &nbsp;</td>
                                    <td class="style21">
                                        &nbsp;</td>
                                    <td class="style24">
                                        <asp:Label ID="Label3" runat="server" ForeColor="Red"></asp:Label>
                                    </td>
                                    <td>
                                        &nbsp;</td>
                                </tr>
                                <tr>
                                    <td class="style25">
                                        <asp:Button ID="btnSubmit" runat="server" OnClick="btnSubmit_Click" 
                                            Text="Submit" />
                                    </td>
                                    <td class="style21">
                                        <asp:Button ID="btnUpdate" runat="server" OnClick="btnUpdate_Click" 
                                            Text="Update" />
                                    </td>
                                    <td class="style24">
                                        <asp:Button ID="Button4" runat="server" OnClick="Button4_Click" 
                                            Text="Previous" />
                                    </td>
                                    <td>
                                        &nbsp;</td>
                                </tr>
                                <tr>
                                    <td class="style25">
                                        &nbsp;</td>
                                    <td class="style21">
                                        &nbsp;</td>
                                    <td class="style24">
                                        &nbsp;</td>
                                    <td>
                                        &nbsp;</td>
                                </tr>
                                <tr>
                                    <td class="style7" colspan="4">
                                        <asp:GridView ID="GridView1" runat="server" 
                                            OnRowCommand="GridView1_RowCommand1" 
                                            OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
                                            <Columns>
                                                <asp:TemplateField HeaderText="Edit">
                                                    <ItemTemplate>
                                                        <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="false" 
                                                            CommandArgument='<%#Eval("Main_Branch_ID") %>' CommandName="Editt">Edit</asp:LinkButton>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Delete">
                                                    <ItemTemplate>
                                                        <asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="false" 
                                                            CommandArgument='<%#Eval("Main_Branch_ID") %>' CommandName="Deletee">Delete</asp:LinkButton>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                            </Columns>
                                        </asp:GridView>
                                    </td>
                                </tr>
                            </table>
                        </ContentTemplate>
                    </asp:TabPanel>
                </asp:TabContainer>
            </td>
        </tr>
    </table>

</asp:Content>

