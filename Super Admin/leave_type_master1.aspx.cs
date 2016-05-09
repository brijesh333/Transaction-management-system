using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Collections;

public partial class leave_type_master1 : System.Web.UI.Page
{
    ERPStoreProcedure ERP = new ERPStoreProcedure();

    protected void Page_Load(object sender, EventArgs e)
    {
        grid_bind();
    }
    public void grid_bind()
    {
        SortedList sl = new SortedList();
        sl.Add("@query", "Select grid");
        GridView1.DataSource = ERP.GetDataReaderSP("leave_sp", sl);
        GridView1.DataBind();

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        SortedList sl1 = new SortedList();
        sl1.Add("@query", "Count");
        sl1.Add("@Leave_Type", txtLeave.Text);
        string count = ERP.ExecuteScalarSP("leave_sp", sl1).ToString();
        Label1.Visible = false;
        if (count == "0")
        {
            SortedList sl = new SortedList();
            sl.Add("@query", "Insert1");
            sl.Add("Leave_Type", txtLeave.Text);
            sl.Add("Description", txtDescription.Text);
            int n = Convert.ToInt32(ERP.ExecuteNonQuerySP("leave_sp", sl));
            grid_bind();
        }
        else
        {
            Label1.Text = "Already Exist";
            Label1.Visible = true;
        }
    }
    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {
    }
    protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "Editt")
        {
            SortedList sl = new SortedList();
            sl.Add("@query", "Select1");
            sl.Add("Leave_ID", e.CommandArgument.ToString());
            SqlDataReader dr = ERP.GetDataReaderSP("leave_sp", sl);
            while (dr.Read())
            {
                int A = Convert.ToInt32(dr["Leave_ID"].ToString());
                txtLeave.Text = dr["Leave_Type"].ToString();
                txtDescription.Text = dr["Description"].ToString();
                ViewState["Leave_ID"] = A;
            }
            grid_bind();
        }
        else
        {
            if (e.CommandName == "Deletee")
            {
                SortedList sl = new SortedList();
                sl.Add("@query", "Delete1");
                sl.Add("@Leave_ID", e.CommandArgument);
                ERP.ExecuteNonQuerySP("leave_sp", sl);
                grid_bind();
            }

        }
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        SortedList sl = new SortedList();
        sl.Add("@query", "Update1");
        sl.Add("@Leave_ID", ViewState["Leave_ID"]);
        sl.Add("@Leave_Type", txtLeave.Text);
        sl.Add("@Description", txtDescription.Text);
        ERP.ExecuteNonQuerySP("leave_sp", sl);
        grid_bind();
    }
}