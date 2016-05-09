<%@ Page Title="" Language="C#" MasterPageFile="~/Employee/Marketing/Marketing_Employee.master" AutoEventWireup="true" CodeFile="SMS_Marketing.aspx.cs" Inherits="Employee_Marketing_SMS_Marketing" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    
    <form id="form1">
    <div>
        <br/>
        Phone number :<asp:TextBox ID="txtphn" runat="server"></asp:TextBox>
        <br />
        <br/>
        Message :&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <asp:TextBox ID="txtxmsg" runat="server" TextMode="MultiLine"></asp:TextBox>
       <br/>
        <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Button ID="btn" runat="server" Text="Send" onclick="btn_Click1" />
    </div>
    </form>

</asp:Content>

