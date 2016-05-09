using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Collections;


public partial class Employee_Account_Pay_Slip : System.Web.UI.Page
{
    ERPStoreProcedure ERP = new ERPStoreProcedure();
    protected void Page_Load(object sender, EventArgs e)
    {
        Panel1.Visible = false;
        if (!IsPostBack)
        {
            department_bind();
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
        ddEmployee.DataSource = ERP.GetDataReaderSP("emp_reg_sp", sl);
        ddEmployee.DataTextField = "Full_Name";
        ddEmployee.DataValueField = "Employee_ID";
        ddEmployee.DataBind();
    }

    protected void ddDepartment_SelectedIndexChanged(object sender, EventArgs e)
    {
        designation_bind();
    }
    protected void ddDesignation_SelectedIndexChanged(object sender, EventArgs e)
    {
        employee_bind();
    }
    protected void btnProceed_Click(object sender, EventArgs e)
    {
        Panel1.Visible = true;
        SortedList sl = new SortedList();
        sl.Add("@query", "Select print");
        sl.Add("@Employee_ID", ddEmployee.SelectedItem.Value);
        SqlDataReader dr = ERP.GetDataReaderSP("emp_pay_sp", sl);
        while (dr.Read())
        {
            lblFullName.Text = dr["Full_Name"].ToString();
            lblDepartment.Text = dr["Department_Name"].ToString();
            lblDesignation.Text = dr["Designation"].ToString();
            lblFrom.Text = dr["Date_From"].ToString();
            lblTo.Text = dr["Date_To"].ToString();
            lblBasicSalary.Text = dr["Salary"].ToString();
            lblDate.Text = dr["Date1"].ToString();
            lblPaySalary.Text = dr["Payable_Salary"].ToString();
        }
    }
    protected void btnPrint_Click(object sender, EventArgs e)
    {
        string htmlcode = "";
        htmlcode += "<h1 align=center class='mylabel' style='font-family:Monotype Corsiva;font-size:30px;color:white;background-color:black;'>Salary Payment Slip</h1>";
        htmlcode += "<h2 align=center class='mylabel' style='font-family:Comic Sans MS;font-size:15px;'>Payslip for time Period " + lblFrom.Text  + "&nbsp" + lblTo.Text + "</h2>";
        htmlcode += "<table width=97% class='mylabel' cellpadding=10 align=center>";
        htmlcode += "<tr><td colspan=2><hr></tr>";
        htmlcode += "<tr><td align=right>Employee ID:</td><td>" + ddEmployee.SelectedItem.Value + "</td></tr>";
        htmlcode += "<tr><td align=right>Employee Name:</td><td>" + lblFullName.Text + "</td></tr>";
        htmlcode += "<tr><td align=right>Department Name:</td><td>" + lblDepartment.Text + "</td></tr>";
        htmlcode += "<tr><td align=right>Designation Name:</td><td>" + lblDesignation.Text + "</td></tr>";
        htmlcode += "<tr><td align=right>Basic Salary:</td><td>" + lblBasicSalary.Text + "</td></tr>";
        htmlcode += "<tr><td align=right>Pay Salary Date:</td><td>" + lblDate.Text + "</td></tr>";
        htmlcode += "<tr><td align=right style='font-weight:bold;border-top-style:solid;border-bottom-style:solid;border-top-color:black;border-bottom-color:black;'>Net Salary</td><td style='font-weight:bold;border-top-style:solid;border-bottom-style:solid;border-top-color:black;border-bottom-color:black;'>" + lblPaySalary.Text + "</td></tr>";
        htmlcode += "<tr><td align=right></td><td>&nbsp;</td></tr>";
        htmlcode += "<tr><td align=right></td><td align=center style='font-weight:bold'>Signature of the<br>HOD<br>(Account Manager)</br></td>";
        htmlcode += "</table>";
        Session["htmlcodetoprint"] = htmlcode;
        Response.Write("<script language='javascript'>window.open('print.aspx','prn','toolbar=no,menubar=no,scrollbars=yes,location=no');</script>");
    }
}