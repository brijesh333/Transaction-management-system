using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Collections;


public partial class Super_Admin_Branch_Shift_Master : System.Web.UI.Page
{
    ERPStoreProcedure ERP = new ERPStoreProcedure();
    protected void Page_Load(object sender, EventArgs e)
    {
        grid_bind();
        if (!IsPostBack)
        {
            department_bind();
            shift_bind();
            branch_bind();
        }
        lblMessage.Visible = false;
    }
    public void grid_bind()
    {
        SortedList sl = new SortedList();
        sl.Add("@query", "Select grid");
        GridView1.DataSource = ERP.GetDataReaderSP("branch_shift_sp", sl);
        GridView1.DataBind();
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

    public void shift_bind()
    {
        SortedList sl = new SortedList();
        sl.Add("@query", "Select grid");
        ddShift.DataSource = ERP.GetDataReaderSP("shift_master_sp", sl);
        ddShift.DataTextField = "Shift_Name";
        ddShift.DataValueField = "Shift_ID";
        ddShift.DataBind();
    }

    public void branch_bind()
    {
        SortedList sl = new SortedList();
        sl.Add("@query", "Select grid1");
        ddBranch.DataSource = ERP.GetDataReaderSP("branch_sp", sl);
        ddBranch.DataTextField = "Branch_Name";
        ddBranch.DataValueField = "Branch_ID";
        ddBranch.DataBind();
    }
    protected void btnSubmit_Click(object sender, EventArgs e)
    {


        SortedList sl1 = new SortedList();
        sl1.Add("@query", "Insert1");
        sl1.Add("@Branch_ID", ddBranch.SelectedItem.Value);
        sl1.Add("@Shift_ID", ddShift.SelectedItem.Value);
        sl1.Add("@Department_ID", ddDepartment.SelectedItem.Value);
        sl1.Add("@Time_From", txtTimeFrom.Text);
        sl1.Add("@Time_To", txtTimeTo.Text);
        sl1.Add("@Description", txtDescription.Text);
        int n = Convert.ToInt32(ERP.ExecuteNonQuerySP("branch_shift_sp", sl1));
        grid_bind();
    }

    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
    protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "Editt")
        {
            SortedList sl = new SortedList();
            sl.Add("@query", "Select1");
            sl.Add("@Brnch_Shift_ID", e.CommandArgument.ToString());
            SqlDataReader dr = ERP.GetDataReaderSP("branch_shift_sp", sl);
            while (dr.Read())
            {
                int A = Convert.ToInt32(dr["Brnch_Shift_ID"].ToString());
                ddBranch.SelectedItem.Value = dr["Branch_ID"].ToString();
                ddShift.SelectedItem.Value = dr["Shift_ID"].ToString();
                ddDepartment.SelectedItem.Value = dr["Department_ID"].ToString();
                txtTimeFrom.Text = dr["Time_From"].ToString();
                txtTimeTo.Text = dr["Time_To"].ToString();
                txtDescription.Text = dr["Description"].ToString();
                ViewState["Brnch_Shift_ID"] = A;
            }
            grid_bind();
        }
        else
        {
            if (e.CommandName == "Deletee")
            {
                SortedList sl = new SortedList();
                sl.Add("@query", "Delete1");
                sl.Add("@Brnch_Shift_ID", e.CommandArgument.ToString());
                ERP.ExecuteNonQuerySP("branch_shift_sp", sl);
                grid_bind();
            }
        }
    }
    protected void btnUpdate_Click(object sender, EventArgs e)
    {
        SortedList sl = new SortedList();
        sl.Add("@query", "Update1");
        sl.Add("@Country_ID", ViewState["Brnch_Shift_ID"]);
        sl.Add("@Branch_ID", ddBranch.SelectedItem.Value);
        sl.Add("@Shift_ID", ddShift.SelectedItem.Value);
        sl.Add("@Department_ID", ddDepartment.SelectedItem.Value);
        sl.Add("@Time_From", txtTimeFrom.Text);
        sl.Add("@Time_To", txtTimeTo.Text);
        sl.Add("@Description", txtDescription.Text);
        int n = Convert.ToInt32(ERP.ExecuteNonQuerySP("branch_shift_sp", sl));
        grid_bind();
    }
}