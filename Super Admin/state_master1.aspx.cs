using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Collections;

public partial class state_master1 : System.Web.UI.Page
{
    ERPStoreProcedure ERP = new ERPStoreProcedure();

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            country_bind();
            grid_bind();
        }
    }

    public void country_bind()
    {
        SortedList sl = new SortedList();
        sl.Add("@query", "Select grid");
        ddCountryName.DataSource = ERP.GetDataReaderSP("country_sp", sl);
        ddCountryName.DataTextField = "Country_Name";
        ddCountryName.DataValueField = "Country_ID";
        ddCountryName.DataBind();

    }

    public void grid_bind()
    {
        SortedList sl = new SortedList();
        sl.Add("@query", "Select grid");
        GridView1.DataSource = ERP.GetDataReaderSP("state_sp", sl);
        GridView1.DataBind();

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
            sl.Add("@State_ID", e.CommandArgument.ToString());
            SqlDataReader dr = ERP.GetDataReaderSP("state_sp", sl);
            while (dr.Read())
            {
                country_bind();
                int A = Convert.ToInt32(dr["State_ID"].ToString());
                ddCountryName.SelectedValue = dr["Country_ID"].ToString();
                txtStateName.Text = dr["State_Name"].ToString();
                txtDescription.Text = dr["Description"].ToString();
                ViewState["State_ID"] = A;

            }
            grid_bind();
        }
        else
        {
            if (e.CommandName == "Deletee")
            {
                SortedList sl = new SortedList();
                sl.Add("@query", "Delete1");
                sl.Add("@State_ID", e.CommandArgument);
                ERP.ExecuteNonQuerySP("state_sp", sl);
                grid_bind();
            }
        }
    }
    protected void Button2_Click(object sender, EventArgs e)
    {

        SortedList sl = new SortedList();
        sl.Add("@query", "Update1");
        sl.Add("@State_ID", ViewState["State_ID"]);
        sl.Add("@Country_ID", ddCountryName.SelectedItem.Value);
        sl.Add("@State_Name", txtStateName.Text);
        sl.Add("@Description", txtDescription.Text);
        int n = Convert.ToInt32(ERP.ExecuteNonQuerySP("state_sp", sl));
        grid_bind();

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        SortedList sl1 = new SortedList();
        sl1.Add("@query", "Count");
        sl1.Add("@State_Name", txtStateName.Text);
        string count = ERP.ExecuteScalarSP("state_sp", sl1).ToString();
        Label1.Visible = false;
        if (count == "0")
        {
            SortedList sl = new SortedList();
            sl.Add("@query", "Insert1");
            sl.Add("@Country_ID", ddCountryName.SelectedItem.Value);
            sl.Add("@State_Name", txtStateName.Text);
            sl.Add("@Description", txtDescription.Text);
            int n = Convert.ToInt32(ERP.ExecuteNonQuerySP("state_sp", sl));
            grid_bind();
        }
        else
        {
            Label1.Text = "Already Exist";
            Label1.Visible = true;
        }
    }
    protected void ddCountryName_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
}