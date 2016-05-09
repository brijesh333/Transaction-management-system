using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Collections;


public partial class HR_payroll : System.Web.UI.Page
{
    double leave_acc = 0, single_leave=0,salary1,salary2,salary3;
    int festival = 0, work_off = 0;
    double absent=0,pp=0;
    DateTime le1, le, leto;
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

    public void leave_count()
    {
        SortedList sl1 = new SortedList();
        sl1.Add("@query", "Select att sheet");
        sl1.Add("@Employee_ID", ddEmployeeName.SelectedItem.Value);
        sl1.Add("@DateFrom", txtDatefrm.Text);
        sl1.Add("@DateTo", txtDateto.Text);
        SqlDataReader dr = ERP.GetDataReaderSP("emp_presence_sp", sl1);
        DataTable dt = new DataTable();
        dt.Load(dr);
        int j = Convert.ToInt32(dt.Rows.Count);

        /*
        SortedList sl3 = new SortedList();
        sl3.Add("@query", "Select dd session");
        sl3.Add("Employee_ID", ddEmployeeName.SelectedItem.Value);
        SqlDataReader dr2 = ERP.GetDataReaderSP("emp_reg_sp", sl3);
        while (dr2.Read())
        {
            lblDepartmentID.Text = dr2["Department_ID"].ToString();
            lblDesignationID.Text = dr2["Designation_ID"].ToString();
        }
        */
        //int i = dt.Rows.Count;
        for (int i = 0; i < j; i++)
        {
            if (dt.Rows[i]["Presence"].ToString().Equals("Absent"))
            {
                absent++;
            }
            else if (dt.Rows[i]["Presence"].ToString().Equals("Present"))
            {
                pp++;
            }
            else
            {
                DateTime ab = Convert.ToDateTime(dt.Rows[i]["Date1"].ToString());
                SortedList sl2 = new SortedList();
                sl2.Add("@query", "Select data");
                sl2.Add("@Employee_ID", ddEmployeeName.SelectedItem.Value);
                SqlDataReader dr1 = ERP.GetDataReaderSP("leaveForm_sp", sl2);
                DataTable dt1 = new DataTable();
                dt1.Load(dr1);
                for (int k = 0; k < dt1.Rows.Count; k++)
                {                    
                    if (dt1.Rows[k]["Leave_Days"].ToString().Equals("1"))
                    {
                        le1 = Convert.ToDateTime(dt1.Rows[k]["Date1"].ToString());
                    }
                    else
                    {
                        le = Convert.ToDateTime(dt1.Rows[k]["Date_From"].ToString());
                        leto = Convert.ToDateTime(dt1.Rows[k]["Date_To"].ToString());
                    }

                    if (ab.Equals(le))
                    {
                        //DateTime d = ab;
                        //lblLeaveAccepted.Text = dt1.Rows[k]["Leave_Days"].ToString();
                        //lblLeaveFrom.Text = le.ToString();
                        //lblLeaveTo.Text = dt1.Rows[k]["Date_To"].ToString();                        
                        leave_acc = leave_acc + Convert.ToDouble(dt1.Rows[k]["Leave_Days"].ToString());
                        absent = absent - leave_acc;
                    }
                    else if (ab == le1)
                    {
                        //Label4.Text = dt1.Rows[k]["Date1"].ToString();
                        leave_acc++;
                        absent--;
                    }
                }

                SortedList sl6 = new SortedList();
                sl6.Add("@query", "Select grid");
                SqlDataReader dr3 = ERP.GetDataReaderSP("festival_sp", sl6);
                DataTable dt2 = new DataTable();
                dt2.Load(dr3);
                for (int k = 0; k < dt2.Rows.Count; k++)
                {
                    DateTime ye = Convert.ToDateTime(dt2.Rows[k]["Festival_Date"].ToString());
                    if (ab.Equals(ye))
                    {
                        /*lblFestivalDate.Text = ye.ToString();
                        Label7.Text = "1";*/
                        festival++;
                        absent--;
                    }
                }

                SortedList sl5 = new SortedList();
                sl5.Add("@query", "Select day");
                sl5.Add("@Department_ID", ddDepartment.SelectedItem.Value);
                SqlDataReader dr4 = ERP.GetDataReaderSP("weekly_leave_sp", sl5);
                DataTable dt3 = new DataTable();
                dt3.Load(dr4);
                string w1,w2;
                for (int k = 0; k < dt3.Rows.Count; k++)
                {
                    w1 = dt3.Rows[k]["Day1"].ToString();
                    w2 = ab.DayOfWeek.ToString();
                    if ((w2).Equals(w1))
                    {
                        //Label9.Text = "1";
                        work_off++;
                        absent--;
                    }
                }
                absent++;
            }
        }
        //     Label5.Text = (Convert.ToInt32(Label4.Text) + Convert.ToInt32(Label3.Text) + Convert.ToInt32(Label7.Text)).ToString();
        lblLeaveAccepted.Text = leave_acc.ToString();
        lblFestival.Text = festival.ToString();
        lblWorkOff.Text = work_off.ToString();
        lblPresent.Text = pp.ToString();
        lblAbsent.Text = absent.ToString();
        lblTotalAbsentDay.Text = (Convert.ToInt32(lblLeaveAccepted.Text) + Convert.ToInt32(lblAbsent.Text)).ToString();
        lblTotalPresentDay.Text = (Convert.ToInt32(lblLeaveAccepted.Text) + Convert.ToInt32(lblFestival.Text) + Convert.ToInt32(lblWorkOff.Text) + Convert.ToInt32(lblPresent.Text)).ToString();
        lblPerDaySalary.Text = (Convert.ToDouble(lblPresentSalary.Text) / 30).ToString();
    }

    protected void btnProceed_Click(object sender, EventArgs e)
    {
        Panel4.Visible = true;
        SortedList sl = new SortedList();
        sl.Add("@query", "Select grid");
        sl.Add("@Employee_ID", ddEmployeeName.SelectedItem.Value);
        SqlDataReader dr = ERP.GetDataReaderSP("emp_salary_sp", sl);
        while (dr.Read())
        {
            lblJoiningDate.Text = dr["Activation_Date"].ToString();
            lblPresentSalary.Text = dr["Salary"].ToString();
            string str = lblPresentSalary.ToString();
            //lblPerDaySalary.Text = Convert.ToString(((Convert.ToInt32(str)) / 30));
        }
        leave_count();
    }
    protected void ddDept_SelectedIndexChanged(object sender, EventArgs e)
    {
        designation_bind();
    }
    protected void ddDes_SelectedIndexChanged(object sender, EventArgs e)
    {
        employee_bind();
    }

    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        salary1 = Convert.ToDouble((Convert.ToDouble(lblTotalPresentDay.Text) * Convert.ToDouble(lblPerDaySalary.Text)));
        salary2 = Convert.ToDouble(Convert.ToDouble(txtExtraEarnAmount.Text) - Convert.ToDouble(txtDeductionAmount.Text));
        salary3 = salary1 + salary2;
        lblPayableSalary.Text = salary3.ToString();
        
        SortedList sl = new SortedList();
        sl.Add("@query", "Insert1");
        sl.Add("@Employee_ID", ddEmployeeName.SelectedItem.Value);
        sl.Add("@Date1", System.DateTime.Now.ToShortDateString());
        sl.Add("@Date_From", txtDatefrm.Text);
        sl.Add("@Date_To", txtDateto.Text);
        sl.Add("@Earning", txtExtraEarnAmount.Text);
        sl.Add("@Deduction", txtDeductionAmount.Text);
        sl.Add("@E_Description", txtExtraEarnReason.Text);
        sl.Add("@Payable_Salary", lblPayableSalary.Text);
        sl.Add("@D_Description", txtDeductionDescription.Text);
        ERP.ExecuteNonQuerySP("emp_pay_sp", sl);
        System.Windows.Forms.MessageBox.Show("Net PayableSalary : " + lblPayableSalary.Text);
    }
    protected void txtExtraEarnAmount_TextChanged(object sender, EventArgs e)
    {
        salary1 = Convert.ToDouble((Convert.ToDouble(lblTotalPresentDay.Text) * Convert.ToDouble(lblPerDaySalary.Text)));
        salary2 = salary1+Convert.ToDouble(Convert.ToDouble(txtExtraEarnAmount.Text));
        lblPayableSalary.Text = salary2.ToString();
    }
    protected void txtDeductionAmount_TextChanged(object sender, EventArgs e)
    {
        salary1 = Convert.ToDouble((Convert.ToDouble(lblTotalPresentDay.Text) * Convert.ToDouble(lblPerDaySalary.Text)));
        salary2 = salary1 - Convert.ToDouble(Convert.ToDouble(txtDeductionAmount.Text));
        lblPayableSalary.Text = salary2.ToString();
    }
}