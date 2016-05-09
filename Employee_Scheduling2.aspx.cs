using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Collections;

public partial class Employee_Scheduling2 : System.Web.UI.Page
{
    ERPStoreProcedure ERP=new ERPStoreProcedure();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            employee_bind();
        }
        grid_bind();
    }

    public void employee_bind()
    {
        SortedList sl = new SortedList();
        sl.Add("@query", "Select grid");
        ddEmployeeName.DataSource = ERP.GetDataReaderSP("emp_reg_sp", sl);
        ddEmployeeName.DataTextField = "Full_Name";
        ddEmployeeName.DataValueField = "Employee_ID";
        ddEmployeeName.DataBind();            
    }

    public void grid_bind()
    {
        SortedList sl = new SortedList();
        sl.Add("@query", "Select grid");
        GridView1.DataSource = ERP.GetDataReaderSP("emp_scheduling2_sp", sl);
        GridView1.DataBind();
    }

    public void shift_bind()
    {
        SortedList sl = new SortedList();
        sl.Add("@query", "Select shift");
        sl.Add("@Department_ID",Session["Department_ID"].ToString());
        sl.Add("@Branch_ID",Session["Branch_ID"].ToString());
        ddShiftAvailable.DataSource = ERP.GetDataReaderSP("branch_shift_sp", sl);
        ddShiftAvailable.DataTextField = "Shift_Name";
        ddShiftAvailable.DataValueField = "Shift_ID";
        ddShiftAvailable.DataBind();            
    }
    public void data_bind()
    {
        SortedList sl = new SortedList();
        sl.Add("@query","Select data");
        sl.Add("@Employee_ID",ddEmployeeName.SelectedItem.Value);
        SqlDataReader dr = ERP.GetDataReaderSP("emp_reg_sp",sl);
        while (dr.Read())
        {
            lblDepartment.Text=dr["Department_Name"].ToString();
            Session["Department_ID"] = dr["Department_ID"].ToString();
            lblDesignation.Text=dr["Designation"].ToString();
            lblWoorkingBranch.Text = dr["Branch_Name"].ToString();
            Session["Branch_ID"] = dr["Branch_ID"].ToString();
        }
    }

    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        SortedList sl = new SortedList();
        sl.Add("@query", "Insert1");
        sl.Add("@Employee_ID", ddEmployeeName.SelectedItem.Value);
        sl.Add("@Department_ID", Session["Department_ID"].ToString());
        sl.Add("@Shift_ID", ddShiftAvailable.SelectedItem.Value);
        sl.Add("@Date_From", txtDateFrom.Text);
        sl.Add("@Date_To", txtDateTo.Text);
        ERP.ExecuteNonQuerySP("emp_scheduling2_sp", sl);
    }

    protected void ddEmployeeName_SelectedIndexChanged(object sender, EventArgs e)
    {

    }

    protected void btnOk_Click(object sender, EventArgs e)
    {
        data_bind();
        shift_bind();
    }
    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
    protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
    {

    }
}