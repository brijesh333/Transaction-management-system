using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Collections;

public partial class department_master1 : System.Web.UI.Page
{
    ERPStoreProcedure ERP = new ERPStoreProcedure();
    protected void Page_Load(object sender, EventArgs e)
    {
        grid_bind();
    }

    public void grid_bind()
    {
        SortedList sl = new SortedList();
        sl.Add("@query", "Select grid");
        GridView1.DataSource = ERP.GetDataReaderSP("department_sp", sl);
        GridView1.DataBind();
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        SortedList sl1 = new SortedList();
        sl1.Add("@query", "Count");
        sl1.Add("@Department_Name", txtDepartmentName.Text);
        string count = ERP.ExecuteScalarSP("department_sp", sl1).ToString();
        Label1.Visible = false;
        if (count == "0")
        {
            SortedList sl = new SortedList();
            sl.Add("@query", "Insert1");
            sl.Add("@Department_Name", txtDepartmentName.Text);
            sl.Add("@Department_Description", txtDescription.Text);
            int n = Convert.ToInt32(ERP.ExecuteNonQuerySP("department_sp", sl));
            grid_bind();
        }
        else
        {
            Label1.Text = "Already Exist";
            Label1.Visible = true;
        }
    }
    protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "Editt")
        {
            SortedList sl = new SortedList();
            sl.Add("@query", "Select1");
            sl.Add("@Department_ID", e.CommandArgument.ToString());
            SqlDataReader dr = ERP.GetDataReaderSP("department_sp", sl);
            while (dr.Read())
            {
                int A = Convert.ToInt32(dr["Department_ID"].ToString());
                txtDepartmentName.Text = dr["Department_Name"].ToString();
                txtDescription.Text = dr["Department_Description"].ToString();
                ViewState["Department_ID"] = A;

            }
            grid_bind();
        }
        else
        {
            if (e.CommandName == "Deletee")
            {
                SortedList sl = new SortedList();
                sl.Add("@query", "Delete1");
                sl.Add("@Department_ID", e.CommandArgument);
                ERP.ExecuteNonQuerySP("department_sp", sl);
                grid_bind();
            }
        }
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        SortedList sl = new SortedList();
        sl.Add("@query", "Update1");
        sl.Add("@Department_ID", ViewState["Department_ID"]);
        sl.Add("@Department_Name", txtDepartmentName.Text);
        sl.Add("@Department_Description", txtDescription.Text);
        int n = Convert.ToInt32(ERP.ExecuteNonQuerySP("department_sp", sl));
        grid_bind();
    }
    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
}