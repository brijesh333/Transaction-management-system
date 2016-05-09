using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Collections;

public partial class Is_active : System.Web.UI.Page
{
    ERPStoreProcedure ERP = new ERPStoreProcedure();
    protected void Page_Load(object sender, EventArgs e)
    {
        gridbind();
    }
    public void gridbind()
    {
        SortedList sl = new SortedList();
        sl.Add("@query", "is active");
        GridView1.DataSource = ERP.GetDataReaderSP("emp_reg_sp", sl);
        GridView1.DataBind();     
    }

    protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "Activee")
        {
            SortedList sl = new SortedList();
            sl.Add("@query", "activate");
            sl.Add("@Employee_ID", e.CommandArgument.ToString());            
            ERP.ExecuteNonQuerySP("emp_reg_sp", sl);
            gridbind();            
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
}