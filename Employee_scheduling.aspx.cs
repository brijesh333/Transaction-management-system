using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Collections;
public partial class Employee_scheduling : System.Web.UI.Page
{
    ERPStoreProcedure ERP = new ERPStoreProcedure();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            department_bind();
            grid_bind();
            working_branch_bind();
        }
        //working_branch_bind();
    }

    public void grid_bind()
    {
        SortedList sl = new SortedList();
        sl.Add("@query","Select grid");
        GridView1.DataSource = ERP.GetDataReaderSP("emp_scheduling_sp", sl);
        GridView1.DataBind();
    }

    public void working_branch_bind()
    {
        SortedList sl = new SortedList();
        sl.Add("@query", "Select grid");
        ddWorkingBranch.DataSource = ERP.GetDataReaderSP("branch_sp", sl);
        ddWorkingBranch.DataTextField = "Branch_Name";
        ddWorkingBranch.DataValueField = "Branch_ID";
        ddWorkingBranch.DataBind();
    }

    public void department_bind()
    {
        SortedList sl = new SortedList();
        sl.Add("@query", "Select grid");
        ddDepartment.DataSource = ERP.GetDataReaderSP("department_sp", sl);
        ddDepartment.DataTextField = "Department_Name";
        ddDepartment.DataValueField = "Department_ID";
        ddDepartment.DataBind();
        designation_bind();
    }
    
    public void designation_bind()
    {
        SortedList sl = new SortedList();
        sl.Add("@query", "Select Department");
        sl.Add("Department_ID", ddDepartment.SelectedItem.Value);
        ddDesignation.DataSource = ERP.GetDataReaderSP("designation_sp", sl);
        ddDesignation.DataTextField = "Designation";
        ddDesignation.DataValueField = "Designation_ID";
        ddDesignation.DataBind();
        employee_bind();
    }    

    public void employee_bind()
    {
        SortedList sl = new SortedList();
        sl.Add("@query", "Select emp for schedule");
        sl.Add("@Department_ID", ddDepartment.SelectedItem.Value);
        sl.Add("@Designation_ID", ddDesignation.SelectedItem.Value);
        sl.Add("@Working_Branch_ID", ddWorkingBranch.SelectedItem.Value);
        ddEmployeeName.DataSource = ERP.GetDataReaderSP("emp_reg_sp", sl);
        ddEmployeeName.DataTextField = "Full_Name";
        ddEmployeeName.DataValueField = "Employee_ID";
        ddEmployeeName.DataBind();
    }

    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        SortedList sl = new SortedList();
        sl.Add("@query", "Insert1");
        sl.Add("@Working_Branch_ID", ddWorkingBranch.SelectedItem.Value);
        sl.Add("@Department_ID", ddDepartment.SelectedItem.Value);
        sl.Add("@Designation_ID", ddDesignation.SelectedItem.Value);
        sl.Add("@Employee_ID", ddEmployeeName.SelectedItem.Value);
        sl.Add("@Shift", rblShift.SelectedItem.Value);
        sl.Add("@Date_From", txtDateFrom.Text);
        sl.Add("@Date_To", txtDateTo.Text);
        int n=Convert.ToInt32(ERP.ExecuteNonQuerySP("emp_scheduling_sp", sl));
        grid_bind();

        Label1.Text = ddWorkingBranch.SelectedItem.Value;
    }
    protected void ddDepartment_SelectedIndexChanged(object sender, EventArgs e)
    {
        designation_bind();
    }
    protected void ddDesignation_SelectedIndexChanged(object sender, EventArgs e)
    {
        employee_bind();
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
            sl.Add("@Shift_ID", e.CommandArgument.ToString());
            SqlDataReader dr = ERP.GetDataReaderSP("emp_scheduling_sp", sl);
            while (dr.Read())
            {
                int A = Convert.ToInt32(dr["Shift_ID"].ToString());
                working_branch_bind();
                ddWorkingBranch.SelectedValue = dr["Working_Branch_ID"].ToString();
                department_bind();
                ddDepartment.SelectedValue = dr["Department_ID"].ToString();
                designation_bind();
                ddDesignation.SelectedValue = dr["Designation_ID"].ToString();
                ddEmployeeName.SelectedValue = dr["Employee_ID"].ToString();
                rblShift.SelectedValue = dr["Shift"].ToString();
                txtDateFrom.Text = dr["Date_From"].ToString();
                txtDateTo.Text = dr["Date_To"].ToString();
                ViewState["Shift_ID"] = A;
            }
            grid_bind();
        }
        else
        {
            if (e.CommandName == "Deletee")
            {
                SortedList sl = new SortedList();
                sl.Add("@query", "Delete1");
                sl.Add("@Shift_ID", e.CommandArgument.ToString());
                ERP.ExecuteNonQuerySP("emp_scheduling_sp", sl);
                grid_bind();
            }
        }

    }
    protected void btnUpdate_Click(object sender, EventArgs e)
    {
        SortedList sl = new SortedList();
        sl.Add("@query", "Update1");
        sl.Add("@Shift_ID", ViewState["Shift_ID"]);
        sl.Add("@W_Branch_ID", ddWorkingBranch.SelectedItem.Value);
        sl.Add("@Department_ID", ddDepartment.SelectedItem.Value);
        sl.Add("@Designation_ID", ddDesignation.SelectedItem.Value);
        sl.Add("@Employee_ID", ddEmployeeName.SelectedItem.Value);
        sl.Add("@Shift", rblShift.SelectedItem.Value);
        sl.Add("@Date_From", txtDateFrom.Text);
        sl.Add("@Date_To", txtDateTo.Text);
        int n = Convert.ToInt32(ERP.ExecuteNonQuerySP("emp_scheduling_sp", sl));
        grid_bind();
    }
}