using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Collections;

public partial class Log_In : System.Web.UI.Page
{
    ERPStoreProcedure ERP = new ERPStoreProcedure();
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    public void log_in()
    {
        SortedList sl1 = new SortedList();
        sl1.Add("@query", "Count");
        sl1.Add("@User_Name1", txtUserName.Text);
        sl1.Add("@Password", txtPassword.Text);
        int count = Convert.ToInt32(ERP.ExecuteScalarSP("login_sp", sl1).ToString());
        if (count == 0)
        {
            Label1.Text = "Login UnSuccessfull";
        }
        else
        {
            SortedList sl = new SortedList();
            sl.Add("@query", "Select1");
            sl.Add("@User_Name1", txtUserName.Text);
            sl.Add("@Password", txtPassword.Text);
            SqlDataReader dr = ERP.GetDataReaderSP("login_sp", sl);
            DataTable dt = new DataTable();
            dt.Load(dr);
            string active = dt.Rows[0]["Is_Active"].ToString();
            Session["Emp_ID"] = dt.Rows[0]["Employee_ID"].ToString();
            Label3.Text = Session["Emp_ID"].ToString();
            if (active == "1")
            {
                Label1.Text = "Login Successfull";
                Session["U_Name"] = txtUserName.Text;
                string type = dt.Rows[0]["Emp_Type"].ToString();
                if (type == "1")
                {
                    Response.Redirect("~/Admin/Admin Default.aspx");
                }
                else if (type == "2")
                {
                    Response.Redirect("~/Manager/Manager Default.aspx");
                }
                else if (type == "3")
                {
                    Response.Redirect("~/emp_login_successfull.aspx");
                }
            }
            else
            {
                Response.Redirect("not active.aspx");
            }
        }
    }

    protected void btnLogIn_Click(object sender, EventArgs e)
    {
        SortedList sl = new SortedList();
        sl.Add("@query", "Select1");
        sl.Add("@User_Name1",txtUserName.Text);
        sl.Add("@Password", txtPassword.Text);
        ERP.ExecuteNonQuerySP("login_sp", sl);
        log_in();
    }

    protected void btnReset_Click(object sender, EventArgs e)
    {
        txtPassword.Text = "";
        txtUserName.Text = "";
    }
}