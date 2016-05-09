using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Collections;

public partial class HR_Employee_Scheduling : System.Web.UI.Page
{
    ERPStoreProcedure ERP = new ERPStoreProcedure();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            department_bind();
        }
    }
    
    public void department_bind()
    {
        SortedList sl = new SortedList();
        sl.Add("@query", "Select dd");
        sl.Add("@Branch_ID", Session["Working_Branch_ID"]);
        ddDepartment.DataSource = ERP.GetDataReaderSP("branch_shift_sp", sl);
        ddDepartment.DataTextField = "Department_Name";
        ddDepartment.DataValueField = "Department_ID";
        ddDepartment.DataBind();
        shift_bind();
    }

    public void shift_bind()
    {
        SortedList sl = new SortedList();
        sl.Add("@query", "Select shift");
        sl.Add("@Department_ID", ddDepartment.SelectedItem.Value);
        sl.Add("@Branch_ID", Session["Working_Branch_ID"]);
        ddShift.DataSource = ERP.GetDataReaderSP("branch_shift_sp", sl);
        ddShift.DataTextField = "Shift_Name";
        ddShift.DataValueField = "Shift_ID";
        ddShift.DataBind();
    }

    public void grid_bind()
    {
        SortedList sl = new SortedList();
        sl.Add("@query", "Select Emp_dept_branch_grid");
        sl.Add("@Department_ID",ddDepartment.SelectedItem.Value);
        sl.Add("@Working_Branch_ID", Session["Working_Branch_ID"]);
        GridView1.DataSource = ERP.GetDataReaderSP("emp_reg_sp", sl);
        GridView1.DataBind();
    }

    protected void btnViewEmployee_Click(object sender, EventArgs e)
    {
        SortedList sl = new SortedList();
        sl.Add("@query", "Select shift1");
        sl.Add("@Shift_ID",ddShift.SelectedItem.Value);
        sl.Add("@Department_ID", ddDepartment.SelectedItem.Value);
        sl.Add("@Branch_ID", Session["Working_Branch_ID"]);
        SqlDataReader dr = ERP.GetDataReaderSP("branch_shift_sp", sl);
        while(dr.Read())
        {
            lblFrom.Text = dr["Time_From"].ToString();
            lblTo.Text = dr["Time_To"].ToString();
        }
        grid_bind();
    }
    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
    protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        
    }
    protected void ddDepartment_SelectedIndexChanged(object sender, EventArgs e)
    {
        shift_bind();
    }
    protected void btnAllocate_Click(object sender, EventArgs e)
    {
        foreach (GridViewRow gvr in this.GridView1.Rows)
        {
            CheckBox chk = (CheckBox)gvr.FindControl("CheckBox1");
            HiddenField hid = (HiddenField)gvr.FindControl("HiddenField1");
            if (chk.Checked)
            {
                SortedList sl = new SortedList();
                sl.Add("@query", "Insert1");
                sl.Add("@Employee_ID", hid.Value);
                sl.Add("@Shift_ID", ddShift.SelectedItem.Value);
                sl.Add("@App_Date", System.DateTime.Now.ToShortDateString());
                sl.Add("@Date_From",txtDateFrom.Text);
                sl.Add("@Date_To",txtDateTo.Text);
                ERP.ExecuteNonQuerySP("emp_scheduling3_sp", sl);
            }
        }        
    }
}