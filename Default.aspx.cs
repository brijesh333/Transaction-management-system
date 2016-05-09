using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Collections;


public partial class _Default : System.Web.UI.Page
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

            Session["Employee_ID"] = dt.Rows[0]["Employee_ID"].ToString();
            Session["Department_ID"] = dt.Rows[0]["Department_ID"].ToString();
            Session["Designation_ID"] = dt.Rows[0]["Designation_ID"].ToString();
            Session["Working_Branch_ID"] = dt.Rows[0]["Working_Branch_ID"].ToString();
            Session["Employee_Name"] = dt.Rows[0]["Full_Name"].ToString();
            Session["Emp_Type"] = dt.Rows[0]["Emp_Type"].ToString();
            Session["City_ID"] = dt.Rows[0]["City_ID"].ToString();

            /* select city from working branch*/
            /*
            SortedList sl10 = new SortedList();
            sl10.Add("@query", "Select city_b");
            sl10.Add("@Branch_ID", Session["Working_Branch_ID"].ToString());
            SqlDataReader dr8 = ERP.GetDataReaderSP("branch_sp", sl10);
            while (dr.Read())
            {
                Session["Working_City_ID"]=dr["City_ID"].ToString();
            }
            */
            Label3.Text = Session["Employee_ID"].ToString();
            string Dept_ID = dt.Rows[0]["Department_ID"].ToString();
            Session["Time"] = System.DateTime.Now.ToString("dd/MM/yyyy");
            Session["Time1"] = System.DateTime.Now.ToLongTimeString();
            if (active == "1")
            {
                Label1.Text = "Login Successfull";
                Session["U_Name"] = txtUserName.Text;
                string Emp_type = dt.Rows[0]["Emp_Type"].ToString();
                if (Emp_type == "1")
                {
                    Session["Log_In"] = txtUserName.Text;
                    Response.Redirect("~/Super Admin/Default.aspx");

                }
                else if (Emp_type == "2")
                {
                    /*Session["log_in2"] = txtUserName.Text;
                    string dept=dt.Rows[0].["Department_ID"].ToString();
                    Session["Department_ID"] = dt.Rows[0].["Department_ID"].ToString();
                    String dept_ID=Session["Department_ID"].ToString();
                    string wb_ID=Session["Working_Branch_ID"].ToString();
                    if (dept_ID=="1")
                    {

                        Response.Redirect("HR_home1.aspx");
                    }
                    if (dept_ID == "10")
                    {
                        Response.Redirect("Account_admin_home1.aspx");
                    }
                    else
                    {
                        Response.Redirect("HR_home1.aspx");
                        //Response.Redirect("temp.aspx");
                    }*/
                    Session["Log_In"] = txtUserName.Text;
                    Response.Redirect("~/Admin/Default.aspx");

                }
                else if (Emp_type == "3")
                {
                    /*Session["log_in3"] = txtUserName.Text;
                    Response.Redirect("employee_home1.aspx");*/
                    Response.Redirect("~/HR/Default.aspx");
                }

                else if (Emp_type == "4")
                {
                    //string Dept_ID=Session["Department_ID"].ToString();
                    if (Dept_ID == "2")
                    {
                        Response.Redirect("~/HOD/Account/Default.aspx");
                    }
                    else if (Dept_ID == "3")
                    {
                        Response.Redirect("~/HOD/Marketing/Default.aspx");
                    }
                    else if (Dept_ID == "4")
                    {
                        Response.Redirect("~/HOD/Finance/Default.aspx");
                    }
                    else if (Dept_ID == "5")
                    {
                        Response.Redirect("~/HOD/Purchase/Default.aspx");
                    }
                    else if (Dept_ID == "6")
                    {
                        Response.Redirect("~/HOD/Sales/Default.aspx");
                    }
                    else if (Dept_ID == "7")
                    {
                        Response.Redirect("~/HOD/IT/Default.aspx");
                    }
                }

                else if (Emp_type == "5")
                {
                    //string Dept_ID=Session["Department_ID"].ToString();
                    if (Dept_ID == "2")
                    {
                        Response.Redirect("~/Employee/Account/Default.aspx");
                    }
                    else if (Dept_ID == "3")
                    {
                        Response.Redirect("~/Employee/Marketing/Default.aspx");
                    }
                    else if (Dept_ID == "4")
                    {
                        Response.Redirect("~/Employee/Finance/Default.aspx");
                    }
                    else if (Dept_ID == "5")
                    {
                        Response.Redirect("~/Employee/Purchase/Default.aspx");
                    }
                    else if (Dept_ID == "6")
                    {
                        Response.Redirect("~/Employee/Sales/Default.aspx");
                    }
                    else if (Dept_ID == "7")
                    {
                        Response.Redirect("~/Employee/IT/Default.aspx");
                    }
                    else if (Dept_ID == "10")
                    {
                        Response.Redirect("~/Employee/General/Default.aspx");
                    }
                }
                else
                {
                    Label5.Text = "Sorry.. You are not currently activated by HR Manager....";
                    //Response.Redirect("not active.aspx");
                }
            }
        }
    }    

    protected void btnLogIn_Click(object sender, EventArgs e)
    {        
        /*SortedList sl = new SortedList();
        sl.Add("@query", "Select1");
        sl.Add("@User_Name1", txtUserName.Text);
        sl.Add("@Password", txtPassword.Text);
        ERP.ExecuteNonQuerySP("login_sp", sl);*/
        log_in();
    }

    protected void btnReset_Click(object sender, EventArgs e)
    {
        txtPassword.Text = "";
        txtUserName.Text = "";
    }

    protected void btnRegistration_Click(object sender, EventArgs e)
    {
        Response.Redirect("employee_registration1.aspx");
    }
    protected void LinkButton1_Click(object sender, EventArgs e)
    {
        Response.Redirect("Forget password.aspx");
    }
}