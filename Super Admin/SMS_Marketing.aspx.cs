using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net;
using System.IO;

public partial class Employee_Marketing_SMS_Marketing : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    public void send(string uid, string password, string message, string no)
    {
        HttpWebRequest myReq = (HttpWebRequest)WebRequest.Create("http://ubaid.tk/sms/sms.aspx?uid=" + uid + "&pwd=" + password + "&msg=" + message + "&phone=" + no + "&provider=fullonsms");

        HttpWebResponse myResp = (HttpWebResponse)myReq.GetResponse();
        System.IO.StreamReader respStreamReader = new System.IO.StreamReader(myResp.GetResponseStream());
        string responseString = respStreamReader.ReadToEnd();
        respStreamReader.Close();
        myResp.Close();
    }
    protected void btn_Click1(object sender, EventArgs e)
    {
        try
        {
            send("9737223368", "63641", txtxmsg.Text, txtphn.Text);
           // System.Windows.Forms.MessageBox.Show("Message Sent Successfully");
            Response.Write("message send successfully......");
        }
        catch (Exception ex)
        {
            //System.Windows.Forms.MessageBox.Show("Error Occured....!!!!");
            Response.Write("Error Occured!!!");
        }
    }
}