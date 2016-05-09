using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Collections;
using System.Data;
using System.Data.SqlClient;

public partial class attendance : System.Web.UI.Page
{
    ERPStoreProcedure ERP=new ERPStoreProcedure();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            department_bind();            
        }
    }

    public void grid_bind()
    {
        SortedList sl = new SortedList();
        sl.Add("@query","Select emp_att");
        sl.Add("@Department_ID", ddDepartment.SelectedItem.Value);
        sl.Add("@Designation_ID", ddDesignation.SelectedItem.Value);
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
        ddEmployeeName.DataTextField="Full_Name";
        ddEmployeeName.DataValueField = "Employee_ID";
        ddEmployeeName.DataBind();
    }

    protected void btnViewEmployee_Click(object sender, EventArgs e)
    {
        grid_bind();
    }
    

    protected void ddDepartment_SelectedIndexChanged(object sender, EventArgs e)
    {
        designation_bind();
    }
    protected void  ddDesignation_SelectedIndexChanged(object sender, EventArgs e)
    {
        employee_bind();
    }
    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        SortedList sl1 = new SortedList();
        sl1.Add("@query","Count");
        sl1.Add("@Employee_ID", ddEmployeeName.SelectedItem.Value);
        sl1.Add("@date1", txtDate.Text);
        string count = ERP.ExecuteScalarSP("emp_presence_sp", sl1).ToString();
        lblMessage.Visible = false;
        if (count == "0")
        {
            SortedList sl = new SortedList();
            sl.Add("@query", "Insert1");
            sl.Add("@Employee_ID", ddEmployeeName.SelectedItem.Value);
            sl.Add("@Presence", rblPresent.SelectedItem.Value);
            sl.Add("@date1", txtDate.Text);
            ERP.ExecuteNonQuerySP("emp_presence_sp", sl);
        }
        else
        {
            lblMessage.Visible = true;
            lblMessage.Text = "Already taken attendance";
        }
        
    }
    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
    protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "Present")
        {
            SortedList sl = new SortedList();
            sl.Add("@query", "Present");
            sl.Add("@Employee_ID", e.CommandArgument.ToString());
            SqlDataReader dr = ERP.GetDataReaderSP("emp_presence_sp", sl);
            
            grid_bind();
        }
        else
        {
            if (e.CommandName == "Absent")
            {
                SortedList sl = new SortedList();
                sl.Add("@query", "Delete1");
                sl.Add("@Country_ID", e.CommandArgument);
                ERP.ExecuteNonQuerySP("country_sp", sl);
                grid_bind();
            }
        }

    }
}