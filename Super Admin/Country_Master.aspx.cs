using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Collections;

public partial class Super_Admin_Default : System.Web.UI.Page
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
        GridView1.DataSource = ERP.GetDataReaderSP("country_sp", sl);
        GridView1.DataBind();
    }


    protected void Button1_Click(object sender, EventArgs e)
    {
        SortedList sl = new SortedList();
        sl.Add("@query", "Count");
        sl.Add("@Country_Name", txtCountryName.Text);
        string count = ERP.ExecuteScalarSP("country_sp", sl).ToString();
        Label1.Visible = false;
        if (count == "0")
        {
            SortedList sl1 = new SortedList();
            sl1.Add("@query", "Insert1");
            sl1.Add("@Country_Name", txtCountryName.Text);
            sl1.Add("@Country_Description", txtDescription.Text);
            int n = Convert.ToInt32(ERP.ExecuteNonQuerySP("country_sp", sl1));
            Label1.Visible = false;
            grid_bind();
        }
        else
        {
            Label1.Text = "Already Exist";
            Label1.Visible = true;
        }

    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        SortedList sl = new SortedList();
        sl.Add("@query", "Update1");
        sl.Add("@Country_ID", ViewState["Country_ID"]);
        sl.Add("@Country_Name", txtCountryName.Text);
        sl.Add("@country_Description", txtDescription.Text);
        int n = Convert.ToInt32(ERP.ExecuteNonQuerySP("country_sp", sl));
        grid_bind();

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
            sl.Add("@Country_ID", e.CommandArgument.ToString());
            SqlDataReader dr = ERP.GetDataReaderSP("country_sp", sl);
            while (dr.Read())
            {
                int A = Convert.ToInt32(dr["Country_ID"].ToString());
                txtCountryName.Text = dr["Country_Name"].ToString();
                txtDescription.Text = dr["Country_Description"].ToString();
                ViewState["Country_ID"] = A;

            }
            grid_bind();
        }
        else
        {
            if (e.CommandName == "Deletee")
            {
                SortedList sl = new SortedList();
                sl.Add("@query", "Delete1");
                sl.Add("@Country_ID", e.CommandArgument.ToString());
                ERP.ExecuteNonQuerySP("country_sp", sl);
                grid_bind();
            }
        }

    }
}