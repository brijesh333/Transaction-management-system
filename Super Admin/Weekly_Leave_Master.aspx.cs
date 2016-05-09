using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Collections;

public partial class Super_Admin_Weekly_Leave_Master : System.Web.UI.Page
{
    ERPStoreProcedure ERP = new ERPStoreProcedure();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            department_bind();
            grid_bind();
            week_Day_bind();
        }
        lblMessage.Visible = false;
    }

    public void department_bind()
    {
        SortedList sl = new SortedList();
        sl.Add("@query", "Select grid");
        ddDepartment.DataSource = ERP.GetDataReaderSP("department_sp", sl);
        ddDepartment.DataTextField = "Department_Name";
        ddDepartment.DataValueField = "Department_ID";
        ddDepartment.DataBind();
    }
    public void grid_bind()
    {
        SortedList sl = new SortedList();
        sl.Add("@query", "Select grid");
        GridView1.DataSource = ERP.GetDataReaderSP("weekly_leave_sp", sl);
        GridView1.DataBind();
    }

    public void week_Day_bind()
    {
        SortedList sl = new SortedList();
        sl.Add("@query", "Select1");
        ddWeekDay.DataSource = ERP.GetDataReaderSP("week_day_sp", sl);
        ddWeekDay.DataTextField = "Day1";
        ddWeekDay.DataValueField = "Week_Day_ID";
        ddWeekDay.DataBind();
    }

    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        SortedList sl1 = new SortedList();
        sl1.Add("@query", "Count");
        sl1.Add("@Department_ID", ddDepartment.SelectedItem.Value);
        sl1.Add("@Week_Day_ID", ddWeekDay.SelectedItem.Value);
        string count = ERP.ExecuteScalarSP("weekly_leave_sp", sl1).ToString();
        if (count == "0")
        {
            SortedList sl = new SortedList();
            sl.Add("@query", "Insert1");
            sl.Add("@Department_ID", ddDepartment.SelectedItem.Value);
            sl.Add("@Week_Day_ID", ddWeekDay.SelectedItem.Value);
            int n = Convert.ToInt32(ERP.ExecuteNonQuerySP("weekly_leave_sp", sl));
            grid_bind();
        }
        else
        {
            lblMessage.Visible = true;
            lblMessage.Text = "Already Exist";
        }
    }
    protected void btnUpdate_Click(object sender, EventArgs e)
    {
        SortedList sl = new SortedList();
        sl.Add("@query", "Update1");
        sl.Add("@Dept_Wise_ID", ViewState["Dept_Wise_ID"]);
        sl.Add("@Department_ID", ddDepartment.SelectedItem.Value);
        sl.Add("@Week_Day_ID", ddWeekDay.SelectedItem.Value);
        int n = Convert.ToInt32(ERP.ExecuteNonQuerySP("weekly_leave_sp", sl));
        grid_bind();
    }
    protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "Editt")
        {
            SortedList sl = new SortedList();
            sl.Add("@query", "Select1");
            sl.Add("@Dept_Wise_ID", e.CommandArgument.ToString());
            SqlDataReader dr = ERP.GetDataReaderSP("weekly_leave_sp", sl);
            while (dr.Read())
            {
                int A = Convert.ToInt32(dr["Dept_Wise_ID"].ToString());
                ddDepartment.SelectedValue = dr["Department_ID"].ToString();
                ddWeekDay.SelectedValue = dr["Week_Day_ID"].ToString();
                ViewState["Dept_Wise_ID"] = A;
            }
            grid_bind();
        }
        else
        {
            if (e.CommandName == "Deletee")
            {
                SortedList sl = new SortedList();
                sl.Add("@query", "Delete1");
                sl.Add("@Dept_Wise_ID", e.CommandArgument);
                ERP.ExecuteNonQuerySP("weekly_leave_sp", sl);
                grid_bind();
            }
        }
    }
    protected void GridView1_SelectedIndexChanged1(object sender, EventArgs e)
    {

    }
}