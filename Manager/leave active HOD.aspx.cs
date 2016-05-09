using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Collections;
using System.Data;
using System.Data.SqlClient;
public partial class leave_avtivate_HOD : System.Web.UI.Page
{
    ERPStoreProcedure ERP = new ERPStoreProcedure();
    protected void Page_Load(object sender, EventArgs e)
    {
        grid_bind();
    }
    protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "Approve")
        {
            SortedList sl = new SortedList();
            sl.Add("@query", "Approve HOD");
            sl.Add("@Leave_Form_ID", e.CommandArgument.ToString());            
            ERP.ExecuteNonQuerySP("leaveForm_sp", sl);
            grid_bind();
            
            SortedList sl1 = new SortedList();
            sl.Add("@query", "");
        }

        else if (e.CommandName == "Reject")
        {
            SortedList sl = new SortedList();
            sl.Add("@query", "Reject HOD");
            sl.Add("@Leave_Form_ID", e.CommandArgument.ToString());                        
            ERP.ExecuteNonQuerySP("leaveForm_sp", sl);
            grid_bind();
        }
        
    }

    public void grid_bind()
    {
        SortedList sl = new SortedList();
        sl.Add("@query", "Select leave req employee HOD");
        GridView1.DataSource = ERP.GetDataReaderSP("leaveForm_sp", sl);
        GridView1.DataBind();
    }

    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
}