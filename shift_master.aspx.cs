using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Collections;
using System.Data;
using System.Data.SqlClient;
public partial class shift_master : System.Web.UI.Page
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
        GridView1.DataSource = ERP.GetDataReaderSP("shift_master_sp", sl);
        GridView1.DataBind();
    }

    
    protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "Editt")
        {
            SortedList sl = new SortedList();
            sl.Add("@query", "Select1");
            sl.Add("@Shift_ID", e.CommandArgument.ToString());
            SqlDataReader dr = ERP.GetDataReaderSP("shift_master_sp", sl);
            while (dr.Read())
            {
                int A = Convert.ToInt32(dr["Shift_ID"].ToString());
                txtShiftName.Text = dr["Shift_Name"].ToString();
                txtDescription.Text = dr["Description"].ToString();
                ViewState["Shift_ID"] = A;

            }
            grid_bind();
        }
        else
        {
            if (e.CommandName == "Deletee")
            {
                SortedList sl = new SortedList();
                sl.Add("@query", "Delete1");
                sl.Add("@Shift_ID", e.CommandArgument.ToString());
                ERP.ExecuteNonQuerySP("shift_master_sp", sl);
                grid_bind();
            }
        }

    }

    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {

    }

    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        SortedList sl = new SortedList();
        sl.Add("@query", "Count");
        sl.Add("@Shift_Name", txtShiftName.Text);
        string count = ERP.ExecuteScalarSP("shift_master_sp", sl).ToString();
        Label1.Visible = false;
        if (count == "0")
        {
            SortedList sl1 = new SortedList();
            sl1.Add("@query", "Insert1");
            sl1.Add("@Shift_Name", txtShiftName.Text);
            sl1.Add("@Description", txtDescription.Text);
            int n = Convert.ToInt32(ERP.ExecuteNonQuerySP("shift_master_sp", sl1));
            Label1.Visible = false;
            grid_bind();
        }
        else
        {
            Label1.Text = "Already Exist";
            Label1.Visible = true;
        }


    }
    protected void btnCancel_Click(object sender, EventArgs e)
    {
        SortedList sl = new SortedList();
        sl.Add("@query", "Update1");
        sl.Add("@Shift_ID", ViewState["Shift_ID"]);
        sl.Add("@Shift_Name", txtShiftName.Text);
        sl.Add("@Description", txtDescription.Text);
        int n = Convert.ToInt32(ERP.ExecuteNonQuerySP("shift_master_sp", sl));
        grid_bind();
    }
}