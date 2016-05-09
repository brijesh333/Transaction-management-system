<%@ Page Language="C#" AutoEventWireup="true" CodeFile="emp_login_successfull.aspx.cs" Inherits="emp_login_successfull" %>

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
            width: 971px;
        }
        .style3
        {
            width: 186px;
        }
        .style4
        {
            width: 727px;
        }

        .style16
        {
            width: 181px;
        }
        .style17
        {
            height: 40px;
            width: 181px;
        }
        .style19
        {
            width: 181px;
            height: 34px;
        }
        .style18
        {
            height: 26px;
            width: 181px;
        }
        .style20
        {
            width: 181px;
            height: 23px;
        }
        .style21
        {
            width: 765px;
        }
        .style22
        {
            width: 765px;
            height: 23px;
        }
        .style23
        {
            height: 40px;
            width: 765px;
        }
        .style24
        {
            width: 765px;
            height: 34px;
        }
        .style25
        {
            height: 26px;
            width: 765px;
        }
        .style27
        {
            width: 407px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
    </div>
    <table class="style1">
        <tr>
            <td class="style2" colspan="2">
                <asp:Label ID="Label1" runat="server" Font-Bold="True" Font-Size="Large" 
                    style="text-align: left" Text="Log In Successfully"></asp:Label>
            </td>
            <td>
            </td>
        </tr>
        <tr>
            <td class="style27">
                &nbsp;</td>
            <td>
                hi......
                <asp:Label ID="lblDName" runat="server" Text="Label"></asp:Label>
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style2" colspan="2">
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style27">
                <asp:Button ID="Button1" runat="server" onclick="Button1_Click" 
                    Text="Update Profile" />
            </td>
            <td class="style3">
                <asp:Button ID="Button2" runat="server" Text="Continue" />
            </td>
            <td>
                <asp:Button ID="btnLeave" runat="server" Height="30px" onclick="btnLeave_Click" 
                    Text="Apply for Leave" Width="196px" />
            </td>
        </tr>
        <tr>
            <td class="style2" colspan="2">
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
    </table>
    <asp:Panel ID="Panel1" runat="server">
        <table class="style1">
            <tr>
                <td class="style21">
                    <asp:Label ID="Label12" runat="server" Font-Bold="True" Font-Size="Medium" 
                    Text="Personal Detail"></asp:Label>
                </td>
                <td class="style4">
                    &nbsp;</td>
                <td class="style4">
                    &nbsp;</td>
                <td class="style4">
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style22">
                </td>
                <td class="style20">
                </td>
                <td class="style20">
                </td>
                <td class="style20">
                </td>
            </tr>
            <tr>
                <td class="style21">
                    Full Name :</td>
                <td class="style16">
                    <asp:Label ID="lblFullName" runat="server" Text="Label"></asp:Label>
                </td>
                <td class="style16">
                    &nbsp;</td>
                <td class="style16">
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style21">
                    Parmenant Address :</td>
                <td class="style16">
                    <asp:TextBox ID="txtPAddress" runat="server" TextMode="MultiLine"></asp:TextBox>
                </td>
                <td class="style16">
                    &nbsp;</td>
                <td class="style16">
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style23">
                    Current Address :</td>
                <td class="style17">
                    <asp:TextBox ID="txtCAddress" runat="server" TextMode="MultiLine"></asp:TextBox>
                </td>
                <td class="style17">
                    &nbsp;</td>
                <td class="style17">
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style21">
                    Date Of Birth :</td>
                <td class="style16">
                    <asp:Label ID="lblDOB" runat="server" Text="Label"></asp:Label>
                </td>
                <td class="style16">
                    &nbsp;</td>
                <td class="style16">
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style21">
                    Gender :</td>
                <td class="style16">
                    <asp:Label ID="lblGender" runat="server" Text="Label"></asp:Label>
                </td>
                <td class="style16">
                    &nbsp;</td>
                <td class="style16">
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style21">
                    Marital Status :</td>
                <td class="style16">
                    <asp:RadioButtonList ID="rdMaritalStatus" runat="server" 
                        RepeatDirection="Horizontal">
                        <asp:ListItem>Married</asp:ListItem>
                        <asp:ListItem>Unmarried</asp:ListItem>
                    </asp:RadioButtonList>
                </td>
                <td class="style16">
                    &nbsp;</td>
                <td class="style16">
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style21">
                    Country :</td>
                <td class="style16">
                    <asp:DropDownList ID="ddCountry" runat="server" AutoPostBack="True" >
                    </asp:DropDownList>
                </td>
                <td class="style16">
                    &nbsp;</td>
                <td class="style16">
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style21">
                    State :</td>
                <td class="style16">
                    <asp:DropDownList ID="ddState" runat="server" AutoPostBack="True" >
                    </asp:DropDownList>
                </td>
                <td class="style16">
                    &nbsp;</td>
                <td class="style16">
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style21">
                    City :</td>
                <td class="style16">
                    <asp:DropDownList ID="ddCity" runat="server">
                    </asp:DropDownList>
                </td>
                <td class="style16">
                    &nbsp;</td>
                <td class="style16">
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style21">
                    PinCode :</td>
                <td class="style16">
                    <asp:TextBox ID="txtPinCode" runat="server"></asp:TextBox>
                </td>
                <td class="style16">
                    &nbsp;</td>
                <td class="style16">
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style21">
                    Contact No. :</td>
                <td class="style16">
                    <asp:TextBox ID="txtContactNo" runat="server"></asp:TextBox>
                </td>
                <td class="style16">
                    &nbsp;</td>
                <td class="style16">
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style21">
                    E- mail :</td>
                <td class="style16">
                    <asp:TextBox ID="txtEmailID" runat="server"></asp:TextBox>
                </td>
                <td class="style16">
                    &nbsp;</td>
                <td class="style16">
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style21">
                    Blood Group :</td>
                <td class="style16">
                    <asp:Label ID="lblBloodGroup" runat="server" Text="Label"></asp:Label>
                </td>
                <td class="style16">
                    &nbsp;</td>
                <td class="style16">
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style21">
                    &nbsp;</td>
                <td class="style16">
                    &nbsp;</td>
                <td class="style16">
                    &nbsp;</td>
                <td class="style16">
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style21">
                    &nbsp;</td>
                <td class="style16">
                    &nbsp;</td>
                <td class="style16">
                    &nbsp;</td>
                <td class="style16">
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style21">
                    <asp:Label ID="Label3" runat="server" Font-Bold="True" Font-Size="Medium" 
                    Text="Educational Detail"></asp:Label>
                </td>
                <td class="style16">
                    &nbsp;</td>
                <td class="style16">
                    &nbsp;</td>
                <td class="style16">
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style21">
                    &nbsp;</td>
                <td class="style16">
                    &nbsp;</td>
                <td class="style16">
                    &nbsp;</td>
                <td class="style16">
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style21">
                    Qualification :</td>
                <td class="style16">
                    <asp:Label ID="lblQualification" runat="server" Text="Label"></asp:Label>
                </td>
                <td class="style16">
                    &nbsp;</td>
                <td class="style16">
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style21">
                    Affected University :</td>
                <td class="style16">
                    <asp:Label ID="lblAffectedUniversity" runat="server" Text="Label"></asp:Label>
                </td>
                <td class="style16">
                    &nbsp;</td>
                <td class="style16">
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style21">
                    Skill Sets :</td>
                <td class="style16">
                    <asp:TextBox ID="txtSkillsSet" runat="server"></asp:TextBox>
                </td>
                <td class="style16">
                    &nbsp;</td>
                <td class="style16">
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style21">
                    1st Highest Degree :</td>
                <td class="style16">
                    <asp:Label ID="lbl1Degree" runat="server" Text="Label"></asp:Label>
                </td>
                <td class="style16">
                    &nbsp;</td>
                <td class="style16">
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style21">
                    2st Highest Degree :</td>
                <td class="style16">
                    <asp:Label ID="lbl2Degree" runat="server" Text="Label"></asp:Label>
                </td>
                <td class="style16">
                    &nbsp;</td>
                <td class="style16">
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style21">
                    3st Highest Degree :</td>
                <td class="style16">
                    <asp:Label ID="lbl3Degree" runat="server" Text="Label"></asp:Label>
                </td>
                <td class="style16">
                    &nbsp;</td>
                <td class="style16">
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style21">
                    4st Highest Degree :</td>
                <td class="style16">
                    <asp:Label ID="lbl4Degree" runat="server" Text="Label"></asp:Label>
                </td>
                <td class="style16">
                    &nbsp;</td>
                <td class="style16">
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style21">
                    &nbsp;</td>
                <td class="style16">
                    &nbsp;</td>
                <td class="style16">
                    &nbsp;</td>
                <td class="style16">
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style21">
                    &nbsp;</td>
                <td class="style16">
                    &nbsp;</td>
                <td class="style16">
                    &nbsp;</td>
                <td class="style16">
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style21">
                    <asp:Label ID="Label4" runat="server" Text="Professional Detail" 
                    Font-Bold="True" Font-Size="Medium"></asp:Label>
                </td>
                <td class="style16">
                    &nbsp;</td>
                <td class="style16">
                    &nbsp;</td>
                <td class="style16">
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style21">
                    &nbsp;</td>
                <td class="style16">
                    &nbsp;</td>
                <td class="style16">
                    &nbsp;</td>
                <td class="style16">
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style21">
                    Department :</td>
                <td class="style16">
                    <asp:Label ID="lblDepartment" runat="server" Text="Label"></asp:Label>
                </td>
                <td class="style16">
                    &nbsp;</td>
                <td class="style16">
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style21">
                    Designation :</td>
                <td class="style16">
                    <asp:Label ID="lblDesignation" runat="server" Text="Label"></asp:Label>
                </td>
                <td class="style16">
                    &nbsp;</td>
                <td class="style16">
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style21">
                    Job Type :</td>
                <td class="style16">
                    <asp:Label ID="lblJobType" runat="server" Text="Label"></asp:Label>
                </td>
                <td class="style16">
                    &nbsp;</td>
                <td class="style16">
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style21">
                    Previous Company Name :</td>
                <td class="style16">
                    <asp:Label ID="lblPreviousComName" runat="server" Text="Label"></asp:Label>
                </td>
                <td class="style16">
                    &nbsp;</td>
                <td class="style16">
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style21">
                    Previous Department :</td>
                <td class="style16">
                    <asp:Label ID="lblPreviousDept" runat="server" Text="Label"></asp:Label>
                </td>
                <td class="style16">
                    &nbsp;</td>
                <td class="style16">
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style21">
                    Previous Designation</td>
                <td class="style16">
                    <asp:Label ID="lblPreviousDesignation" runat="server" Text="Label"></asp:Label>
                </td>
                <td class="style16">
                    &nbsp;</td>
                <td class="style16">
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style24">
                    Date Of Joining :</td>
                <td class="style19">
                    <asp:Label ID="lblDOJ" runat="server" Text="Label"></asp:Label>
                </td>
                <td class="style19">
                    &nbsp;</td>
                <td class="style19">
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style21">
                    Date Of Leaving :</td>
                <td class="style16">
                    <asp:Label ID="lblDOL" runat="server" Text="Label"></asp:Label>
                </td>
                <td class="style16">
                    &nbsp;</td>
                <td class="style16">
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style21">
                    Last Salary :</td>
                <td class="style16">
                    <asp:Label ID="lblLastSalary" runat="server" Text="Label"></asp:Label>
                </td>
                <td class="style16">
                    &nbsp;</td>
                <td class="style16">
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style21">
                    Experience :</td>
                <td class="style16">
                    <asp:Label ID="lblExperience" runat="server" Text="Label"></asp:Label>
                </td>
                <td class="style16">
                    &nbsp;</td>
                <td class="style16">
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style21">
                    Previous Company Contact No :</td>
                <td class="style16">
                    <asp:Label ID="lblPreComContact" runat="server" Text="Label"></asp:Label>
                </td>
                <td class="style16">
                    &nbsp;</td>
                <td class="style16">
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style22">
                    Previous Company Email Id :</td>
                <td class="style20">
                    <asp:Label ID="lblPreComEmailID" runat="server" Text="Label"></asp:Label>
                </td>
                <td class="style20">
                </td>
                <td class="style20">
                </td>
            </tr>
            <tr>
                <td class="style21">
                    &nbsp;</td>
                <td class="style16">
                    &nbsp;</td>
                <td class="style16">
                    &nbsp;</td>
                <td class="style16">
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style21">
                    &nbsp;</td>
                <td class="style16">
                    &nbsp;</td>
                <td class="style16">
                    &nbsp;</td>
                <td class="style16">
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style21">
                    <asp:Label ID="Label5" runat="server" Text="Emergency Contact Detail" 
                    Font-Bold="True" Font-Size="Medium"></asp:Label>
                </td>
                <td class="style4">
                    &nbsp;</td>
                <td class="style4">
                    &nbsp;</td>
                <td class="style4">
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style21">
                    &nbsp;</td>
                <td class="style16">
                    &nbsp;</td>
                <td class="style16">
                    &nbsp;</td>
                <td class="style16">
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style21">
                    Person Name :</td>
                <td class="style16">
                    <asp:TextBox ID="txtE_PersonaName" runat="server"></asp:TextBox>
                </td>
                <td class="style16">
                    &nbsp;</td>
                <td class="style16">
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style21">
                    Relationship :</td>
                <td class="style16">
                    <asp:TextBox ID="txtE_Relation" runat="server"></asp:TextBox>
                </td>
                <td class="style16">
                    &nbsp;</td>
                <td class="style16">
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style21">
                    Address :</td>
                <td class="style16">
                    <asp:TextBox ID="txtE_Address" runat="server"></asp:TextBox>
                </td>
                <td class="style16">
                    &nbsp;</td>
                <td class="style16">
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style25">
                    Contact No :</td>
                <td class="style18">
                    <asp:TextBox ID="txtE_ContactNo" runat="server"></asp:TextBox>
                </td>
                <td class="style18">
                    &nbsp;</td>
                <td class="style18">
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style25">
                </td>
                <td class="style18">
                </td>
                <td class="style18">
                </td>
                <td class="style18">
                </td>
            </tr>
            <tr>
                <td class="style25">
                    &nbsp;</td>
                <td class="style18">
                    &nbsp;</td>
                <td class="style18">
                    &nbsp;</td>
                <td class="style18">
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style25">
                    <asp:Label ID="Label6" runat="server" Text="Authentication Detail" 
                    Font-Bold="True" Font-Size="Medium"></asp:Label>
                </td>
                <td class="style18">
                    &nbsp;</td>
                <td class="style18">
                    &nbsp;</td>
                <td class="style18">
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style25">
                    &nbsp;</td>
                <td class="style18">
                    &nbsp;</td>
                <td class="style18">
                    &nbsp;</td>
                <td class="style18">
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style25">
                    User Name :</td>
                <td class="style18">
                    <asp:Label ID="lblUserName" runat="server" Text="Label"></asp:Label>
                </td>
                <td class="style18">
                    &nbsp;</td>
                <td class="style18">
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style25">
                    Password :</td>
                <td class="style18">
                    <asp:TextBox ID="txtPassword" runat="server"></asp:TextBox>
                </td>
                <td class="style18">
                    &nbsp;</td>
                <td class="style18">
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style25">
                    Confirm Password :</td>
                <td class="style18">
                    <asp:TextBox ID="txtConfirmPassword" runat="server"></asp:TextBox>
                </td>
                <td class="style18">
                    &nbsp;</td>
                <td class="style18">
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style25">
                    Security Question :</td>
                <td class="style18">
                    <asp:DropDownList ID="ddSecurityQuestion" runat="server" Height="31px" 
                        Width="252px">
                    </asp:DropDownList>
                </td>
                <td class="style18">
                    &nbsp;</td>
                <td class="style18">
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style25">
                    Security Answer :</td>
                <td class="style18">
                    <asp:TextBox ID="txtSecurityAnswer" runat="server" TextMode="MultiLine"></asp:TextBox>
                </td>
                <td class="style18">
                    &nbsp;</td>
                <td class="style18">
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style25">
                    Passport No :</td>
                <td class="style18">
                    <asp:Label ID="lblPassportNo" runat="server" Text="Label"></asp:Label>
                </td>
                <td class="style18">
                    &nbsp;</td>
                <td class="style18">
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style25">
                    Bank Account No :</td>
                <td class="style18">
                    <asp:Label ID="lblBankAccNo" runat="server" Text="Label"></asp:Label>
                </td>
                <td class="style18">
                    &nbsp;</td>
                <td class="style18">
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style25">
                    P.F. No :</td>
                <td class="style18">
                    <asp:Label ID="lblPFNo" runat="server" Text="Label"></asp:Label>
                </td>
                <td class="style18">
                    &nbsp;</td>
                <td class="style18">
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style25">
                    &nbsp;</td>
                <td class="style18">
                    &nbsp;</td>
                <td class="style18">
                    &nbsp;</td>
                <td class="style18">
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style25">
                    &nbsp;</td>
                <td class="style18">
                    &nbsp;</td>
                <td class="style18">
                    &nbsp;</td>
                <td class="style18">
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style25">
                    <asp:Button ID="btnUpdate" runat="server" Text="Update" 
                        onclick="btnUpdate_Click" />
                </td>
                <td class="style18">
                    <asp:Button ID="Reset" runat="server" Text="Reset" />
                </td>
                <td class="style18">
                    &nbsp;</td>
                <td class="style18">
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style25">
                    &nbsp;</td>
                <td class="style18">
                    &nbsp;</td>
                <td class="style18">
                    &nbsp;</td>
                <td class="style18">
                    &nbsp;</td>
            </tr>
        </table>
    </asp:Panel>
    </form>
</body>
</html>
