using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Collections;

public partial class Super_Admin_Festival_Master : System.Web.UI.Page
{
    ERPStoreProcedure ERP = new ERPStoreProcedure();
    protected void Page_Load(object sender, EventArgs e)
    {
        grid_bind();
        Label1.Visible = false;
    }
    public void grid_bind()
    {
        SortedList sl = new SortedList();
        sl.Add("@query", "Select grid");
        GridView1.DataSource = ERP.GetDataReaderSP("festival_sp", sl);
        GridView1.DataBind();
    }


    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        SortedList sl = new SortedList();
        sl.Add("@query", "Count");
        sl.Add("@Festival_Name", txtFestivalName.Text);
        sl.Add("@Year1", txtYear.Text);
        string count = ERP.ExecuteScalarSP("festival_sp", sl).ToString();
        Label1.Visible = false;
        if (count == "0")
        {
            SortedList sl1 = new SortedList();
            sl1.Add("@query", "Insert1");
            sl1.Add("@Year1", txtYear.Text);
            sl1.Add("@Festival_Name", txtFestivalName.Text);
            sl1.Add("@Festival_Date", txtFestivalDate.Text);
            int n = Convert.ToInt32(ERP.ExecuteNonQuerySP("festival_sp", sl1));
            Label1.Visible = false;
            grid_bind();
        }
        else
        {
            Label1.Text = "Already Exist";
            Label1.Visible = true;
        }
    }
    protected void btnUpdate_Click(object sender, EventArgs e)
    {
        SortedList sl = new SortedList();
        sl.Add("@query", "Update1");
        sl.Add("@Festival_ID", ViewState["Festival_ID"]);
        sl.Add("@Year1", txtYear.Text);
        sl.Add("@Festival_Name", txtFestivalName.Text);
        sl.Add("@Festival_Date", txtFestivalDate.Text);
        int n = Convert.ToInt32(ERP.ExecuteNonQuerySP("festival_sp", sl));
        grid_bind();
    }
    protected void GridView1_SelectedIndexChanged1(object sender, EventArgs e)
    {

    }
    protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "Editt")
        {
            SortedList sl = new SortedList();
            sl.Add("@query", "Select1");
            sl.Add("@Festival_ID", e.CommandArgument.ToString());
            SqlDataReader dr = ERP.GetDataReaderSP("festival_sp", sl);
            while (dr.Read())
            {
                int A = Convert.ToInt32(dr["Festival_ID"].ToString());
                txtYear.Text = dr["Year1"].ToString();
                txtFestivalName.Text = dr["Festival_Name"].ToString();
                txtFestivalDate.Text = dr["Festival_Date"].ToString();
                ViewState["Festival_ID"] = A;

            }
            grid_bind();
        }
        else
        {
            if (e.CommandName == "Deletee")
            {
                SortedList sl = new SortedList();
                sl.Add("@query", "Delete1");
                sl.Add("@Festival_ID", e.CommandArgument);
                ERP.ExecuteNonQuerySP("festival_sp", sl);
                grid_bind();
            }
        }
    }
}