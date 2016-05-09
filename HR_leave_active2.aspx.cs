using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Collections;
public partial class HR_leave_active2 : System.Web.UI.Page
{
    ERPStoreProcedure ERP = new ERPStoreProcedure();
    protected void Page_Load(object sender, EventArgs e)
    {
        grid_bind();
    }

    public void grid_bind()
    {
        SortedList sl = new SortedList();
        sl.Add("@query", "Select leave req employee HR");
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
            sl.Add("@query", "Approve HR");
            sl.Add("@Leave_Form_ID", e.CommandArgument.ToString());
            ERP.ExecuteNonQuerySP("leaveForm_sp", sl);
            grid_bind();

            SortedList sl1 = new SortedList();
            sl1.Add("@query", "Select1");
            sl1.Add("@Leave_Form_ID", e.CommandArgument.ToString());
            SqlDataReader dr = ERP.GetDataReaderSP("leaveForm_sp", sl1);
            while (dr.Read())
            {
                Label1.Text = dr["Employee_ID"].ToString();
                Session["Employee_ID"] = dr["Employee_ID"].ToString();
                Session["Leave_Days"] = dr["Leave_Days"].ToString();
                Session["Leave_Type"] = dr["Leave_Type"].ToString();
                Session["Leave_For"] = dr["Leave_For"].ToString();
            }
            amp_data_fatch();
            //leave_deduction();
        }

        else if (e.CommandName == "Reject")
        {
            SortedList sl = new SortedList();
            sl.Add("@query", "Reject HR");
            sl.Add("@Leave_Form_ID", e.CommandArgument.ToString());
            ERP.ExecuteNonQuerySP("leaveForm_sp", sl);
            grid_bind();
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
        double k =  Convert.ToDouble(Session["Leave_Days"].ToString());
        /*string str = Session["Leave_For"].ToString();
        if (str.Equals("Half")) ;*/


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