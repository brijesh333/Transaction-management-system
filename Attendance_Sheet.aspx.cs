using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Collections;

public partial class Attendance_Sheet : System.Web.UI.Page
{
    ERPStoreProcedure ERP = new ERPStoreProcedure();
    int p = 0, a = 0,m,p_ID,l=0,w=0,f=0;
   
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            SortedList sl = new SortedList();
            sl.Add("@query", "Select grid");
            ddEmployee.DataSource = ERP.GetDataReaderSP("emp_reg_sp", sl);
            ddEmployee.DataTextField = "Full_Name";
            ddEmployee.DataValueField = "Employee_ID";
            ddEmployee.DataBind();
            ddEmployee.Items.Insert(0, "-- Select --");
           
        }
    }

    protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
    {

    }
    protected void GridView1_SelectedIndexChanged1(object sender, EventArgs e)
    {

    }
    protected void btnOk_Click(object sender, EventArgs e)
    {
            
            SortedList sl1 = new SortedList();
            sl1.Add("@query", "Select att sheet");
            sl1.Add("@Employee_ID", ddEmployee.SelectedItem.Value);
            sl1.Add("@DateFrom", txtFrom.Text);
            sl1.Add("@DateTo", txtTo.Text);
            SqlDataReader dr = ERP.GetDataReaderSP("emp_presence_sp", sl1);
            DataTable dt = new DataTable();
            dt.Load(dr);
            int j = Convert.ToInt32(dt.Rows.Count);


            SortedList sl3 = new SortedList();
            sl3.Add("@query", "Select dd session");
            sl3.Add("Employee_ID", ddEmployee.SelectedItem.Value);
            SqlDataReader dr2 = ERP.GetDataReaderSP("emp_reg_sp", sl3);
            while (dr2.Read())
            {
                lblDepartmentID.Text = dr2["Department_ID"].ToString();
                lblDesignationID.Text = dr2["Designation_ID"].ToString();
            }
               
            //int i = dt.Rows.Count;
            for (int i = 0; i < j;i++ )
            {
                if (dt.Rows[i]["Presence"].ToString().Equals("Absent"))
                {
                    /*
                    DateTime ab = Convert.ToDateTime(dt.Rows[i]["Date1"].ToString());
                    SortedList sl2 = new SortedList();
                    sl2.Add("@query", "Select data");
                    sl2.Add("@Employee_ID", ddEmployee.SelectedItem.Value);
                    SqlDataReader dr1 = ERP.GetDataReaderSP("leaveForm_sp", sl2);
                    DataTable dt1 = new DataTable();
                    dt1.Load(dr1);
                    for (int k = 0; k < dt1.Rows.Count;k++)
                    {
                        DateTime le=Convert.ToDateTime(dt1.Rows[k]["Date_From"].ToString());
                        DateTime leto = Convert.ToDateTime(dt1.Rows[k]["Date_To"].ToString());
                        
                        if (ab.Equals(le))
                        {
                            DateTime d = ab;
                            Label4.Text = dt1.Rows[k]["Leave_Days"].ToString();
                            lblLeaveFrom.Text = le.ToString();
                            lblLeaveTo.Text = dt1.Rows[k]["Date_To"].ToString();
                            //TimeSpan diff = leto.Subtract(le);
                            //m = Convert.ToInt32(diff.Days);
                            //while (m > 0)
                            //{
                                
                            //    SortedList sl4 = new SortedList();
                            //    sl4.Add("@query", "Update leave");
                            //    sl4.Add("@Employee_ID",ddEmployee.SelectedItem.Value);
                            ////    sl4.Add("@presence_ID", Convert.ToInt32(p_ID.ToString()));
                            //    sl4.Add("Date1", d.ToShortDateString());
                            //    sl4.Add("@Presence", "Leave");
                            //    ERP.ExecuteNonQuerySP("emp_presence_sp", sl4);
                            //    d = d.AddDays(1);
                            //    m--;
                            //}
                        }
                        else if (ab == Convert.ToDateTime(dt1.Rows[k]["Date1"].ToString()))
                        {
                            Label4.Text = dt1.Rows[k]["Date1"].ToString();
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
                            lblFestivalDate.Text = ye.ToString();
                            Label7.Text = "1";
                        }
                    }

                    SortedList sl5 = new SortedList();
                    sl5.Add("@query", "Select day");
                    sl5.Add("@Department_ID", lblDepartmentID.Text);
                    SqlDataReader dr4 = ERP.GetDataReaderSP("weekly_leave_sp", sl5);
                    DataTable dt3 = new DataTable();
                    dt3.Load(dr4);
                    for (int k = 0; k < dt3.Rows.Count; k++)
                    { 
                        Label8.Text=dt3.Rows[k]["Day1"].ToString();
                        Label10.Text = ab.DayOfWeek.ToString();
                        if ((Label10.Text).Equals(Label8.Text))
                        {
                            Label9.Text = "1";
                        }
                    }*/
                    p++;
                }
                else if (dt.Rows[i]["Presence"].ToString().Equals("Present"))
                {
                    a++;
                }
                else if (dt.Rows[i]["Presence"].ToString().Equals("Leave"))
                {
                    l++;
                }
                else if (dt.Rows[i]["Presence"].ToString().Equals("festival"))
                {
                    f++;
                }
                else
                {
                    w++;
                }
            }
           
            SortedList sl = new SortedList();
            sl.Add("@query", "Select att sheet");
            sl.Add("@Employee_ID", ddEmployee.SelectedItem.Value);
            sl.Add("@DateFrom", txtFrom.Text);
            sl.Add("@DateTo", txtTo.Text);
            GridView1.DataSource = ERP.GetDataReaderSP("emp_presence_sp", sl);
            GridView1.DataBind();
           
           
            lblAbsent.Text = p.ToString();
            lblPresent.Text = a.ToString();
            lblWorkoff.Text = w.ToString();
            lblFestival.Text = f.ToString();
            lblLeave.Text = l.ToString();
       //     Label5.Text = (Convert.ToInt32(Label4.Text) + Convert.ToInt32(Label3.Text) + Convert.ToInt32(Label7.Text)).ToString();
  }
}