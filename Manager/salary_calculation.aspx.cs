using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Collections;

public partial class salary_calculation : System.Web.UI.Page
{
    ERPStoreProcedure ERP = new ERPStoreProcedure();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            department_bind();
        }
        Panel4.Visible = false;
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
        sl.Add("@query", "Select employee");
        sl.Add("@Department_ID", ddDepartment.SelectedItem.Value);
        sl.Add("@Designation_ID", ddDesignation.SelectedItem.Value);
        ddEmployeeName.DataSource = ERP.GetDataReaderSP("emp_reg_sp", sl);
        ddEmployeeName.DataTextField = "Full_Name";
        ddEmployeeName.DataValueField = "Employee_ID";
        ddEmployeeName.DataBind();
    }

    protected void btnProceed_Click(object sender, EventArgs e)
    {
        Panel4.Visible = true;
        SortedList sl = new SortedList();
        sl.Add("@query","Select grid");
        sl.Add("@Employee_ID", ddEmployeeName.SelectedItem.Value);
        SqlDataReader dr = ERP.GetDataReaderSP("emp_salary_sp",sl);
        while (dr.Read())
        {
            lblJoiningDate.Text = dr["Activation_Date"].ToString();
            lblPresentSalary.Text = dr["Salary"].ToString();
            string str =lblPresentSalary.ToString();
            //lblPerDaySalary.Text = Convert.ToString(((Convert.ToInt32(str)) / 30));
        }
    }
    protected void ddDept_SelectedIndexChanged(object sender, EventArgs e)
    {
        designation_bind();
    }
    protected void ddDes_SelectedIndexChanged(object sender, EventArgs e)
    {
        employee_bind();
    }
}