using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Collections;
using System.Data;
using System.Data.SqlClient;

public partial class HR_employee_promotion1 : System.Web.UI.Page
{
    ERPStoreProcedure ERP = new ERPStoreProcedure();
    protected void Page_Load(object sender, EventArgs e)
    {        
        if (!IsPostBack)
        {
            department_bind();
            newdepartment_bind();
            emp_type_bind();
        }        
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

    public void newdepartment_bind()
    {
        SortedList sl = new SortedList();
        sl.Add("@query", "Select grid");
        ddNewDepartment.DataSource = ERP.GetDataReaderSP("department_sp", sl);
        ddNewDepartment.DataTextField = "Department_Name";
        ddNewDepartment.DataValueField = "Department_ID";
        ddNewDepartment.DataBind();
        newDesignation_bind();
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

    public void emp_type_bind()
    {
        SortedList sl = new SortedList();
        sl.Add("@query", "Select grid");
        ddEmp_Type.DataSource = ERP.GetDataReaderSP("emp_type_sp", sl);
        ddEmp_Type.DataTextField = "Emp_Type";
        ddEmp_Type.DataValueField = "Emp_Type_ID";
        ddEmp_Type.DataBind();
    }

    public void newDesignation_bind()
    {
        SortedList sl = new SortedList();
        sl.Add("@query", "Select Department");
        sl.Add("Department_ID", ddDepartment.SelectedItem.Value);
        ddNewDesignation.DataSource = ERP.GetDataReaderSP("designation_sp", sl);
        ddNewDesignation.DataTextField = "Designation";
        ddNewDesignation.DataValueField = "Designation_ID";
        ddNewDesignation.DataBind();    
    }
    
    public void employee_bind()
    {
        SortedList sl = new SortedList();
        sl.Add("@query", "Select employee");
        sl.Add("@Department_ID", ddDepartment.SelectedItem.Value);
        sl.Add("@Designation_ID", ddDesignation.SelectedItem.Value);
        ddEmployeeName.DataSource = ERP.GetDataReaderSP("emp_reg_sp", sl);
        ddEmployeeName.DataTextField="Full_Name";
        ddEmployeeName.DataValueField = "Employee_ID";
        ddEmployeeName.DataBind();
    }


    protected void btnProceed_Click(object sender, EventArgs e)
    {
        newdepartment_bind();
        SortedList sl = new SortedList();
        sl.Add("@query","Select employee");
        sl.Add("@Department_ID", ddDepartment.SelectedItem.Value);
        sl.Add("@Designation_ID", ddDesignation.SelectedItem.Value);
        SqlDataReader dr = ERP.GetDataReaderSP("emp_reg_sp",sl);
        while (dr.Read())
        {
            lblJoiningDate.Text = dr["DOJ"].ToString();
        }

        lblCurrentDepartment.Text = ddDepartment.SelectedItem.Value;
        lblCurrentDesignation.Text = ddDesignation.SelectedItem.Value;
        
        SortedList sl1 = new SortedList();
        sl1.Add("@query", "Select dept_desig");
        sl1.Add("@Employee_ID",ddEmployeeName.SelectedItem.Value);
        SqlDataReader dr1 = ERP.GetDataReaderSP("emp_reg_sp", sl1);
        while (dr1.Read())
        {
            lblCurrentDepartment.Text = dr1["Department_Name"].ToString();
            lblCurrentDesignation.Text = dr1["Designation"].ToString();
        }
        /*
        SortedList sl2 = new SortedList();
        sl2.Add("@query", "Select_dept");
        sl2.Add("@Department_ID", ddDepartment.SelectedItem.Value);
        SqlDataReader dr2 = ERP.GetDataReaderSP("department_sp", sl1);
        while (dr1.Read())
        {
            lblCurrentDepartment.Text = dr["Department_Name"].ToString();
            lblCurrentDesignation.Text = dr["Designation"].ToString();
        }*/

        SortedList sl2 = new SortedList();
        sl2.Add("@query", "Select salary");
        sl2.Add("@Employee_ID", ddEmployeeName.SelectedItem.Value);
        SqlDataReader dr2 = ERP.GetDataReaderSP("emp_salary_sp", sl2);
        while (dr2.Read())
        {
            lblCurrentSalary.Text = dr2["Salary"].ToString();
        }

    }
    protected void ddDepartment_SelectedIndexChanged(object sender, EventArgs e)
    {
        designation_bind();
    }
    protected void ddDesignation_SelectedIndexChanged(object sender, EventArgs e)
    {
        employee_bind();
    }
    protected void ddNewDepartment_SelectedIndexChanged(object sender, EventArgs e)
    {
        designation_bind();
    }
    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        SortedList sl = new SortedList();
        sl.Add("@query","Update dd");
        sl.Add("@Employee_ID",ddEmployeeName.SelectedItem.Value);
        sl.Add("@Department_ID", ddDepartment.SelectedItem.Value);
        sl.Add("@Designation_ID", ddDesignation.SelectedItem.Value);
        ERP.ExecuteNonQuerySP("emp_reg_sp", sl);

        SortedList sl1 = new SortedList();
        sl1.Add("@query", "Update type");
        sl1.Add("@Employee_ID", ddEmployeeName.SelectedItem.Value);
        sl1.Add("@Emp_Type", ddEmp_Type.SelectedItem.Value);
        ERP.ExecuteNonQuerySP("emp_reg_sp", sl1);

        SortedList sl2 = new SortedList();
        sl2.Add("@query", "Update salary");
        sl2.Add("@Employee_ID", ddEmployeeName.Text);
        sl2.Add("@Salary", txtNewSalary.Text);
        ERP.ExecuteNonQuerySP("emp_salary_sp", sl2);
        
    }
}