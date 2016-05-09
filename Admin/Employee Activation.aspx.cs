using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Collections;

public partial class HR_employee_activation : System.Web.UI.Page
{
    ERPStoreProcedure ERP = new ERPStoreProcedure();
    protected void Page_Load(object sender, EventArgs e)
    {
        Panel1.Visible = false;
        gridbind();
        if (!IsPostBack)
        {
            working_branch_bind();
            department_bind();
        }        
    }

    public void working_branch_bind()
    {
        SortedList sl = new SortedList();
        sl.Add("@query", "Select w_branch");
        ddWorkingBranch.DataSource = ERP.GetDataReaderSP("branch_sp", sl);
        ddWorkingBranch.DataTextField = "Branch_Name";
        ddWorkingBranch.DataValueField = "Branch_ID";
        ddWorkingBranch.DataBind();
    }
    public void department_bind()
    {
        SortedList sl = new SortedList();
        sl.Add("@query", "Select dd");
        sl.Add("@Branch_ID", ddWorkingBranch.SelectedItem.Value);
        ddDepartment.DataSource = ERP.GetDataReaderSP("branch_shift_sp", sl);
        ddDepartment.DataTextField = "Department_Name";
        ddDepartment.DataValueField = "Department_ID";
        ddDepartment.DataBind();
        designation_bind();
    }

    public void designation_bind()
    {
        SortedList sl = new SortedList();
        sl.Add("@query", "Select Department");
        sl.Add("@Department_ID", ddDepartment.SelectedItem.Value);
        ddDesignation.DataSource = ERP.GetDataReaderSP("designation_sp", sl);
        ddDesignation.DataTextField = "Designation";
        ddDesignation.DataValueField = "Designation_ID";
        ddDesignation.DataBind();
    }

    public void gridbind()
    {
        GridView1.Visible = true;
        SortedList sl = new SortedList();
        sl.Add("@query", "is active");
        GridView1.DataSource = ERP.GetDataReaderSP("emp_reg_sp", sl);
        GridView1.DataBind();
    }

    public void emp_type_bind()
    {
        SortedList sl = new SortedList();
        sl.Add("@query","Select grid");
        ddEmp_Type.DataSource = ERP.GetDataReaderSP("emp_type_sp", sl);
        ddEmp_Type.DataTextField="Emp_Type";
        ddEmp_Type.DataValueField = "Emp_Type_ID";
        ddEmp_Type.DataBind();
    }
    
    public void activate()
    {
        SortedList sl = new SortedList();
        sl.Add("@query", "activate");        
        sl.Add("@Employee_ID", lblTemp.Text);
        ERP.ExecuteNonQuerySP("emp_reg_sp", sl);        
        gridbind();        
    }

    public void leave_enter()
    {
        SortedList sl3 = new SortedList();
        sl3.Add("@query", "Insert1");
        sl3.Add("@Employee_ID", lblTemp.Text);
        sl3.Add("@Year1", System.DateTime.Now.Year.ToString());
        sl3.Add("@PL", 10);
        sl3.Add("@ML", 10);
        sl3.Add("@CL", 10);
        ERP.ExecuteNonQuerySP("Emp_ls_sp", sl3);
    }

    protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "Activee")
        {
            lblTemp.Text = e.CommandArgument.ToString();
            Session["Employee_ID"] = e.CommandArgument.ToString();
            Panel1.Visible = true;
            TabContainer1.Visible = false;
            SortedList sl = new SortedList();
            sl.Add("@Query", "Select1");
            sl.Add("@Employee_ID", lblTemp.Text);
            SqlDataReader dr = ERP.GetDataReaderSP("emp_reg_sp", sl);
            while (dr.Read())
            {
                lblEmployeeName.Text=dr["Full_Name"].ToString();
            }
            lblEmpID.Text = lblTemp.Text;
            
            /*SortedList sl1 = new SortedList();
            sl1.Add("@query", "Select dd");
            sl1.Add("@Employee_ID",lblTemp.Text);
            SqlDataReader dr1 = ERP.GetDataReaderSP("emp_reg_sp", sl1);
            while (dr1.Read())
            {
                lblDepartment.Text = dr1["Department_Name"].ToString();
                lblDesignation.Text = dr1["Designation"].ToString();
            }*/
            emp_type_bind();
        }
        if (e.CommandName == "Deactivee")
        {
            SortedList sl = new SortedList();
            sl.Add("@query", "deactivate");
            sl.Add("@Employee_ID", e.CommandArgument.ToString());
            ERP.ExecuteNonQuerySP("emp_reg_sp", sl);
            gridbind();
        }
    }
    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {
     
    }
    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        SortedList sl = new SortedList();
        sl.Add("@query", "Insert1");
        sl.Add("@Employee_ID", lblTemp.Text);
        sl.Add("@Salary", txtSalary.Text);
        sl.Add("@Activation_Date", System.DateTime.Now.ToString());
        ERP.ExecuteNonQuerySP("emp_salary_sp", sl);
        txtSalary.Text = "";

        SortedList sl1 = new SortedList();
        sl1.Add("@query", "Update type");
        sl1.Add("@Employee_ID", lblTemp.Text);
        sl1.Add("@Emp_Type", ddEmp_Type.SelectedItem.Value);
        ERP.ExecuteNonQuerySP("emp_reg_sp", sl1);

        SortedList sl4 = new SortedList();
        sl4.Add("@query", "Insert w_branch");
        sl4.Add("@Employee_ID", lblTemp.Text);
        sl4.Add("@Working_Branch_ID", ddWorkingBranch.SelectedItem.Value);
        int wb = Convert.ToInt32(ERP.ExecuteNonQuerySP("emp_reg_sp", sl4));

        SortedList sl5 = new SortedList();
        sl5.Add("@query", "Update dd");
        sl5.Add("@Employee_ID", lblTemp.Text);
        sl5.Add("@Department_ID",ddDepartment.SelectedItem.Value);
        sl5.Add("@Designation_ID", ddDesignation.SelectedItem.Value);
        ERP.ExecuteNonQuerySP("emp_reg_sp", sl5);

        leave_enter();    
        activate();
        Panel1.Visible = false;
        TabContainer1.Visible = true;       
    }

    protected void btnCancel_Click(object sender, EventArgs e)
    { 
        Panel1.Visible = false;
        TabContainer1.Visible = true;
        gridbind();
    }

    protected void ddWorkingBranch0_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
}