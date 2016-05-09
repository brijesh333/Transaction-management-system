using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Collections;

public partial class designation_master1 : System.Web.UI.Page
{
    ERPStoreProcedure ERP = new ERPStoreProcedure();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {

            SortedList sl = new SortedList();
            sl.Add("@query", "Select grid");
            ddDepartment.DataSource = ERP.GetDataReaderSP("department_sp", sl);
            ddDepartment.DataTextField = "Department_Name";
            ddDepartment.DataValueField = "Department_ID";
            ddDepartment.DataBind();
            grid_bind();
        }

    }
    public void grid_bind()
    {
        SortedList sl = new SortedList();
        sl.Add("@query", "Select grid");
        GridView1.DataSource = ERP.GetDataReaderSP("designation_sp", sl);
        GridView1.DataBind();
    }

    protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "Editt")
        {
            SortedList sl = new SortedList();
            sl.Add("@query", "Select1");
            sl.Add("@Designation_ID", e.CommandArgument.ToString());
            SqlDataReader dr = ERP.GetDataReaderSP("designation_sp", sl);
            while (dr.Read())
            {
                int A = Convert.ToInt32(dr["Designation_ID"].ToString());
                ddDepartment.SelectedValue = dr["Department_ID"].ToString();
                txtDesignation.Text = dr["Designation"].ToString();
                txtDescription.Text = dr["Description"].ToString();
                ViewState["Designation_ID"] = A;

            }
            grid_bind();
        }
        else
        {
            if (e.CommandName == "Deletee")
            {
                SortedList sl = new SortedList();
                sl.Add("@query", "Delete1");
                sl.Add("@Designation_ID", e.CommandArgument);
                ERP.ExecuteNonQuerySP("designation_sp", sl);
                grid_bind();
            }
        }

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        SortedList sl1 = new SortedList();
        sl1.Add("@query", "Count");
        sl1.Add("@Designation", txtDesignation.Text);
        sl1.Add("@Department_ID", ddDepartment.SelectedItem.Value);
        string count = ERP.ExecuteScalarSP("designation_sp", sl1).ToString();
        Label1.Visible = false;
        if (count == "0")
        {
            SortedList sl = new SortedList();
            sl.Add("@query", "Insert1");
            sl.Add("@Department_ID", ddDepartment.SelectedItem.Value);
            sl.Add("@Designation", txtDesignation.Text);
            sl.Add("@Description", txtDescription.Text);
            int n = Convert.ToInt32(ERP.ExecuteNonQuerySP("designation_sp", sl));
            grid_bind();
        }
        else
        {
            Label1.Text = "Already Exist";
            Label1.Visible = true;
        }

    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        SortedList sl = new SortedList();
        sl.Add("@query", "Update1");
        sl.Add("@Designation_ID", ViewState["Designation_ID"]);
        sl.Add("@Department_ID", ddDepartment.SelectedItem.Value);
        sl.Add("@Designation", txtDesignation.Text);
        sl.Add("@Description", txtDescription.Text);
        int n = Convert.ToInt32(ERP.ExecuteNonQuerySP("designation_sp", sl));
        grid_bind();

    }
    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
}