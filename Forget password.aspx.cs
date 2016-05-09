using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Collections;
using System.Net;
using System.Web.Mail;

public partial class Forget_password : System.Web.UI.Page
{
    ERPStoreProcedure ERP = new ERPStoreProcedure();
    string email="",password="";

    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void SendMail()
    {
        // Gmail Address from where you send the mail
        var fromAddress = "patelbrijesh333@gmail.com";
        // any address where the email will be sending
        var toAddress = email.ToString();
        //Password of your gmail address
        const string fromPassword = "9662959443";
        // Passing the values and make a email formate to display
        string subject = "About forget password";
        string body = password.ToString();
        
        // smtp settings
        var smtp = new System.Net.Mail.SmtpClient();
        {
            smtp.Host = "smtp.gmail.com";
            smtp.Port = 587;
            smtp.EnableSsl = true;
            smtp.DeliveryMethod = System.Net.Mail.SmtpDeliveryMethod.Network;
            smtp.Credentials = new NetworkCredential(fromAddress, fromPassword);
            smtp.Timeout = 20000;
        }
        // Passing values to smtp object
        smtp.Send(fromAddress, toAddress, subject, body);
        
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        SortedList sl = new SortedList();
        sl.Add("@query", "Select email id");
        sl.Add("@User_Name1", txtUserName.Text);
        SqlDataReader dr = ERP.GetDataReaderSP("emp_reg_sp", sl);
        while (dr.Read())
        {
            email = dr["Email"].ToString();
            password = dr["Password"].ToString();
        }
        try
        {
            //here on button click what will done 
            SendMail();
            System.Windows.Forms.MessageBox.Show("\tYour Password sent to Your EmailID\t" + "\n\n\n" + "\tCheck your Emails\t");
        }        
        catch (Exception) 
        {
            System.Windows.Forms.MessageBox.Show("Error In sending Email" + "\n\n\n Check UserName");
        }
        
    }
}