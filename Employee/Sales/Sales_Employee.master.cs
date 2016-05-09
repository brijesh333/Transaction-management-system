using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Collections;


public partial class Employee_Sales_Sales_Employee : System.Web.UI.MasterPage
{
    ERPStoreProcedure ERP = new ERPStoreProcedure();
    protected void Page_Load(object sender, EventArgs e)
    {

        SortedList sl4 = new SortedList();
        sl4.Add("@query", "Select info");
        sl4.Add("@Employee_ID", Session["Employee_ID"].ToString());
        SqlDataReader dr3 = ERP.GetDataReaderSP("emp_presence_sp", sl4);
        DataTable dt = new DataTable();
        dt.Load(dr3);
        if (dt.Rows.Count > 0)
        {
            SortedList s2 = new SortedList();
            s2.Add("@query", "Select info");
            s2.Add("@Employee_ID", Session["Employee_ID"].ToString());
            SqlDataReader dr1 = ERP.GetDataReaderSP("emp_presence_sp", s2);
            while (dr1.Read())
            {
                //    lblattdate.Text=dt.Rows[0]["Date1"].ToString();    
                lblattdate.Text = dr1["Date1"].ToString();
            }
            SortedList sl2 = new SortedList();
            sl2.Add("@query", "Select data");
            sl2.Add("@Employee_ID", Session["Employee_ID"].ToString());
            SqlDataReader dr5 = ERP.GetDataReaderSP("leaveForm_sp", sl2);
            DataTable dt5 = new DataTable();
            dt5.Load(dr5);

            DateTime d1 = Convert.ToDateTime(lblattdate.Text);
            DateTime d2 = Convert.ToDateTime(System.DateTime.Now.ToShortDateString());
            DateTime d3 = d1;
            TimeSpan diff = d2.Subtract(d1);
            int i = Convert.ToInt32(diff.Days);
            while (i > 1)
            {
                d3 = d3.AddDays(1);
                for (int k = 0; k < dt5.Rows.Count; k++)
                {
                    DateTime le = Convert.ToDateTime(dt5.Rows[k]["Date_From"].ToString());
                    DateTime leto = Convert.ToDateTime(dt5.Rows[k]["Date_To"].ToString());
                    DateTime le1 = Convert.ToDateTime(dt5.Rows[k]["Date1"].ToString());
                    if (d3.Equals(le))
                    {
                        int m = Convert.ToInt32(dt5.Rows[k]["Leave_Days"].ToString());
                        while (m > 0)
                        {
                            SortedList sl7 = new SortedList();
                            sl7.Add("@query", "Insert1");
                            sl7.Add("@Department_ID", Session["Department_ID"].ToString());
                            sl7.Add("@Designation_ID", Session["Designation_ID"].ToString());
                            sl7.Add("@Employee_ID", Session["Employee_ID"].ToString());
                            sl7.Add("@Presence", "Leave");
                            sl7.Add("@Date1", d3.ToShortDateString());
                            sl7.Add("@Log_In", "");
                            sl7.Add("@Log_Out", "");
                            ERP.ExecuteNonQuerySP("emp_presence_sp", sl7);
                            d3 = d3.AddDays(1);
                            m--;
                            i--;
                        }

                    }
                    else if (d3.Equals(le1))
                    {
                        double single = Convert.ToDouble(dt5.Rows[k]["Leave_Days"].ToString());
                        if ((single.ToString()).Equals("1"))
                        {
                            SortedList sl7 = new SortedList();
                            sl7.Add("@query", "Insert1");
                            sl7.Add("@Department_ID", Session["Department_ID"].ToString());
                            sl7.Add("@Designation_ID", Session["Designation_ID"].ToString());
                            sl7.Add("@Employee_ID", Session["Employee_ID"].ToString());
                            sl7.Add("@Presence", "Full Leave");
                            sl7.Add("@Date1", d3.ToShortDateString());
                            sl7.Add("@Log_In", "");
                            sl7.Add("@Log_Out", "");
                            ERP.ExecuteNonQuerySP("emp_presence_sp", sl7);
                            d3 = d3.AddDays(1);
                            i--;
                        }
                        else
                        {
                            SortedList sl7 = new SortedList();
                            sl7.Add("@query", "Insert1");
                            sl7.Add("@Department_ID", Session["Department_ID"].ToString());
                            sl7.Add("@Designation_ID", Session["Designation_ID"].ToString());
                            sl7.Add("@Employee_ID", Session["Employee_ID"].ToString());
                            sl7.Add("@Presence", "Half Leave");
                            sl7.Add("@Date1", d3.ToShortDateString());
                            sl7.Add("@Log_In", "");
                            sl7.Add("@Log_Out", "");
                            ERP.ExecuteNonQuerySP("emp_presence_sp", sl7);
                            d3 = d3.AddDays(1);
                            i--;
                        }
                    }
                }

                SortedList sl8 = new SortedList();
                sl8.Add("@query", "Select grid");
                SqlDataReader dr6 = ERP.GetDataReaderSP("festival_sp", sl8);
                DataTable dt6 = new DataTable();
                dt6.Load(dr6);
                for (int k = 0; k < dt6.Rows.Count; k++)
                {
                    DateTime ye = Convert.ToDateTime(dt6.Rows[k]["Festival_Date"].ToString());
                    if (d3.Equals(ye))
                    {
                        SortedList sl7 = new SortedList();
                        sl7.Add("@query", "Insert1");
                        sl7.Add("@Department_ID", Session["Department_ID"].ToString());
                        sl7.Add("@Designation_ID", Session["Designation_ID"].ToString());
                        sl7.Add("@Employee_ID", Session["Employee_ID"].ToString());
                        sl7.Add("@Presence", "festival");
                        sl7.Add("@Date1", d3.ToShortDateString());
                        sl7.Add("@Log_In", "");
                        sl7.Add("@Log_Out", "");
                        ERP.ExecuteNonQuerySP("emp_presence_sp", sl7);
                        d3 = d3.AddDays(1);
                        i--;
                    }
                }

                SortedList sl9 = new SortedList();
                sl9.Add("@query", "Select day");
                sl9.Add("@Department_ID", Session["Department_ID"].ToString());
                SqlDataReader dr9 = ERP.GetDataReaderSP("weekly_leave_sp", sl9);
                DataTable dt9 = new DataTable();
                dt9.Load(dr9);
                for (int k = 0; k < dt9.Rows.Count; k++)
                {
                    string w1, w2;
                    w1 = dt9.Rows[k]["Day1"].ToString();
                    w2 = d3.DayOfWeek.ToString();
                    if ((w2).Equals(w1))
                    {
                        SortedList sl7 = new SortedList();
                        sl7.Add("@query", "Insert1");
                        sl7.Add("@Department_ID", Session["Department_ID"].ToString());
                        sl7.Add("@Designation_ID", Session["Designation_ID"].ToString());
                        sl7.Add("@Employee_ID", Session["Employee_ID"].ToString());
                        sl7.Add("@Presence", "Work Off");
                        sl7.Add("@Date1", d3.ToShortDateString());
                        sl7.Add("@Log_In", "");
                        sl7.Add("@Log_Out", "");
                        ERP.ExecuteNonQuerySP("emp_presence_sp", sl7);
                        d3 = d3.AddDays(1);
                        i--;
                    }
                }

                SortedList sl3 = new SortedList();
                sl3.Add("@query", "Insert1");
                sl3.Add("@Department_ID", Session["Department_ID"].ToString());
                sl3.Add("@Designation_ID", Session["Designation_ID"].ToString());
                sl3.Add("@Employee_ID", Session["Employee_ID"].ToString());
                sl3.Add("@Presence", "Absent");
                sl3.Add("@Date1", d3.ToShortDateString());
                sl3.Add("@Log_In", "");
                sl3.Add("@Log_Out", "");
                ERP.ExecuteNonQuerySP("emp_presence_sp", sl3);
                i--;
            }
        }
    }
    protected void btnProceed_Click(object sender, EventArgs e)
    {
        SortedList sl7 = new SortedList();
        sl7.Add("@query", "Count");
        sl7.Add("@Employee_ID", Session["Employee_ID"].ToString());
        sl7.Add("@Date1", Session["Time"].ToString());
        //SqlDataReader dr8 = ERP.GetDataReaderSP("emp_presence_sp", sl7);
        string str = ERP.ExecuteScalarSP("emp_presence_sp", sl7).ToString();
        //DataTable dt8 = new DataTable();
        //dt8.Load(dr8);
        if (str == "0")
        {
            SortedList sl = new SortedList();
            sl.Add("@query", "Insert1");
            sl.Add("@Department_ID", Session["Department_ID"].ToString());
            sl.Add("@Designation_ID", Session["Designation_ID"].ToString());
            sl.Add("@Employee_ID", Session["Employee_ID"].ToString());
            sl.Add("@Presence", "Present");
            sl.Add("@Date1", Session["Time"].ToString());
            sl.Add("@Log_In", Session["Time1"].ToString());
            sl.Add("@Log_Out", System.DateTime.Now.ToLongTimeString());
            ERP.ExecuteNonQuerySP("emp_presence_sp", sl);
        }
        else
        {
            SortedList sl4 = new SortedList();
            sl4.Add("@query", "Select info");
            sl4.Add("@Employee_ID", Session["Employee_ID"].ToString());
            SqlDataReader dr3 = ERP.GetDataReaderSP("emp_presence_sp", sl4);
            DataTable dt = new DataTable();
            dt.Load(dr3);
            if (dt.Rows.Count > 0)
            {
                SortedList s2 = new SortedList();
                s2.Add("@query", "Select info");
                s2.Add("@Employee_ID", Session["Employee_ID"].ToString());
                SqlDataReader dr1 = ERP.GetDataReaderSP("emp_presence_sp", s2);
                while (dr1.Read())
                {
                    //    lblattdate.Text=dt.Rows[0]["Date1"].ToString();    
                    lblattdate.Text = dr1["Date1"].ToString();
                }

                SortedList sl3 = new SortedList();
                sl3.Add("@query", "Update log_out");
                sl3.Add("@Employee_ID", Session["Employee_ID"].ToString());
                sl3.Add("@Date1", Session["Time"].ToString());
                sl3.Add("@Log_Out", System.DateTime.Now.ToLongTimeString());
                ERP.ExecuteNonQuerySP("emp_presence_sp", sl3);
            }
        }
        Response.Redirect("~/Default.aspx");
    }
}
