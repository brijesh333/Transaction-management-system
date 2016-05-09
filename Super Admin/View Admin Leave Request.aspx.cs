using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Collections;
using System.Data;
using System.Data.SqlClient;
using System.Collections;

public partial class Super_Admin_View_HOD_and_HR_Leave : System.Web.UI.Page
{
    ERPStoreProcedure ERP = new ERPStoreProcedure();
    int count = 0;
    protected void Page_Load(object sender, EventArgs e)
    {
        grid_bind();
    }

    public void grid_bind()
    {
        SortedList sl = new SortedList();
        sl.Add("@query", "Select Admin request");
        GridView1.DataSource = ERP.GetDataReaderSP("leaveForm_sp", sl);
        GridView1.DataBind();
    }

    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
    protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "Approve")
        {
            SortedList sl = new SortedList();
            sl.Add("@query", "Approve by superAdmin");
            sl.Add("@Leave_Form_ID", e.CommandArgument.ToString());
            ERP.ExecuteNonQuerySP("leaveForm_sp", sl);
            grid_bind();

            SortedList sl1 = new SortedList();
            sl1.Add("@query", "Select1");
            sl1.Add("@Leave_Form_ID", e.CommandArgument.ToString());
            SqlDataReader dr = ERP.GetDataReaderSP("leaveForm_sp", sl1);
            while (dr.Read())
            {
                //Label1.Text = dr["Employee_ID"].ToString();
                Session["Employee_ID"] = dr["Employee_ID"].ToString();
                Session["Leave_Days"] = dr["Leave_Days"].ToString();
                Session["Leave_Type"] = dr["Leave_Type"].ToString();
                Session["Leave_For"] = dr["Leave_For"].ToString();
                Session["Date_From"] = dr["Date_From"].ToString();
                Session["Date_To"] = dr["Date_To"].ToString();
                Session["Date1"] = dr["Date1"].ToString();
            }
            amp_data_fatch();
            //leave_deduction();
        }

        else if (e.CommandName == "Reject")
        {
            SortedList sl = new SortedList();
            sl.Add("@query", "Reject by super Admin");
            sl.Add("@Leave_Form_ID", e.CommandArgument.ToString());
            ERP.ExecuteNonQuerySP("leaveForm_sp", sl);
            grid_bind();
        }
    }

    public void leave_count()
    {
        DateTime df = Convert.ToDateTime(Session["Date_From"].ToString());
        DateTime dt = Convert.ToDateTime(Session["Date_To"].ToString());
        int n = Convert.ToInt32(Session["Leave_Days"].ToString());

        for (int i = 0; i < n; i++)
        {
            /* festival leave count*/

            SortedList sl6 = new SortedList();
            sl6.Add("@query", "Select grid");
            SqlDataReader dr3 = ERP.GetDataReaderSP("festival_sp", sl6);
            DataTable dt2 = new DataTable();
            dt2.Load(dr3);
            for (int k = 0; k < dt2.Rows.Count; k++)
            {
                DateTime ye = Convert.ToDateTime(dt2.Rows[k]["Festival_Date"].ToString());
                if (df.Equals(ye))
                {

                }
                else
                {
                    SortedList sl5 = new SortedList();
                    sl5.Add("@query", "Select day");
                    sl5.Add("@Department_ID", Session["Department_ID"].ToString());
                    SqlDataReader dr4 = ERP.GetDataReaderSP("weekly_leave_sp", sl5);
                    DataTable dt3 = new DataTable();
                    dt3.Load(dr4);
                    for (int y = 0; y < dt3.Rows.Count; y++)
                    {
                        DateTime wl = Convert.ToDateTime(dt3.Rows[k]["Day1"].ToString());
                        if (df.Equals(wl))
                        {

                        }
                        else
                        {
                            count++;
                        }
                    }
                }
            }
            df.AddDays(1);
        }

    }
    public void amp_data_fatch()
    {
        SortedList sl = new SortedList();
        sl.Add("@query", "Select emp data");
        sl.Add("@Employee_ID", Convert.ToInt32(Session["Employee_ID"].ToString()));
        SqlDataReader dr = ERP.GetDataReaderSP("Emp_ls_sp", sl);
        while (dr.Read())
        {
            Session["ML"] = dr["ML"].ToString();
            Session["PL"] = dr["PL"].ToString();
            Session["CL"] = dr["CL"].ToString();
        }
        leave_deduction();
    }

    public void leave_deduction()
    {
        int id = Convert.ToInt32(Session["Employee_ID"].ToString());
        int l_type = Convert.ToInt32(Session["Leave_Type"].ToString());
        double k = Convert.ToDouble(Session["Leave_Days"].ToString());
        /*string str = Session["Leave_For"].ToString();
        if (str.Equals("Half")) ;*/

       // leave_count();
        SortedList sl = new SortedList();
        if (l_type == 7)
        {
            sl.Add("@query", "ML leave deduct");
            sl.Add("@Employee_ID", Session["Employee_ID"].ToString());
            double z = Convert.ToDouble(Session["ML"].ToString());
            double ld = z - k;
            sl.Add("@ML", ld);
            ERP.ExecuteNonQuerySP("Emp_ls_sp", sl);
        }
        else if (l_type == 8)
        {
            sl.Add("@query", "PL leave deduct");
            sl.Add("@Employee_ID", Session["Employee_ID"].ToString());
            double z = Convert.ToDouble(Session["PL"].ToString());
            double ld = z - k;
            sl.Add("@PL", ld.ToString());
            ERP.ExecuteNonQuerySP("Emp_ls_sp", sl);
        }
        else if (l_type == 9)
        {
            sl.Add("@query", "CL leave deduct");
            sl.Add("@Employee_ID", Session["Employee_ID"].ToString());
            double z = Convert.ToDouble(Session["CL"].ToString());
            double ld = z - k;
            sl.Add("@CL", ld.ToString());
            ERP.ExecuteNonQuerySP("Emp_ls_sp", sl);
        }
    }
}