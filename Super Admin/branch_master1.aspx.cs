using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.Sql;
using System.Data.SqlClient;
using System.Collections;

public partial class branch_master1 : System.Web.UI.Page
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
        state_bind();

    }
    public void state_bind()
    {
        SortedList sl = new SortedList();
        sl.Add("@query", "Selectstate");
        sl.Add("@Country_ID", ddCountryName.SelectedItem.Value);
        ddStateName.DataSource = ERP.GetDataReaderSP("state_sp", sl);
        ddStateName.DataTextField = "State_Name";
        ddStateName.DataValueField = "State_ID";
        ddStateName.DataBind();
        city_bind();
    }
    public void city_bind()
    {
        SortedList sl = new SortedList();
        sl.Add("@query", "Selectcity");
        sl.Add("@State_ID", ddStateName.SelectedItem.Value);
        ddCityName.DataSource = ERP.GetDataReaderSP("city_sp", sl);
        ddCityName.DataTextField = "City_Name";
        ddCityName.DataValueField = "City_ID";
        ddCityName.DataBind();

    }
    public void grid_bind()
    {
        SortedList sl = new SortedList();
        sl.Add("@query", "Select grid");
        GridView1.DataSource = ERP.GetDataReaderSP("branch_sp", sl);
        GridView1.DataBind();

    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        SortedList sl = new SortedList();
        sl.Add("@query", "Count");
        sl.Add("@Branch_Name", txtBranchName.Text);
        string count = ERP.ExecuteScalarSP("branch_sp", sl).ToString();
        Label1.Visible = false;
        if (count == "0")
        {
            SortedList sl1 = new SortedList();
            sl1.Add("@query", "Insert1");
            sl1.Add("@Country_ID", ddCountryName.SelectedItem.Value);
            sl1.Add("@State_ID", ddStateName.SelectedItem.Value);
            sl1.Add("@City_ID", ddCityName.SelectedItem.Value);
            sl1.Add("@Branch_Name", txtBranchName.Text);
            sl1.Add("@Description", txtDescription.Text);
            int n = Convert.ToInt32(ERP.ExecuteNonQuerySP("branch_sp", sl1));
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
        sl.Add("@Branch_ID", ViewState["Branch_ID"]);
        sl.Add("@Country_ID", ddCountryName.SelectedItem.Value);
        sl.Add("@State_ID", ddStateName.SelectedItem.Value);
        sl.Add("@City_ID", ddCityName.SelectedItem.Value);
        sl.Add("@Branch_Name", txtBranchName.Text);
        sl.Add("@Description", txtDescription.Text);
        int n = Convert.ToInt32(ERP.ExecuteNonQuerySP("branch_sp", sl));
        grid_bind();

    }
    protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
    {

        if (e.CommandName == "Editt")
        {
            SortedList sl = new SortedList();
            sl.Add("@query", "Select1");
            sl.Add("@Branch_ID", e.CommandArgument.ToString());
            SqlDataReader dr = ERP.GetDataReaderSP("branch_sp", sl);
            while (dr.Read())
            {
                int A = Convert.ToInt32(dr["Branch_ID"].ToString());
                country_bind();
                ddCountryName.SelectedValue = dr["Country_ID"].ToString();
                state_bind();
                ddStateName.SelectedValue = dr["State_ID"].ToString();
                city_bind();
                ddCityName.SelectedValue = dr["City_ID"].ToString();
                txtBranchName.Text = dr["Branch_Name"].ToString();
                txtDescription.Text = dr["Description"].ToString();
                ViewState["Branch_ID"] = A;

            }
            grid_bind();
        }
        else
        {
            if (e.CommandName == "Deletee")
            {
                SortedList sl = new SortedList();
                sl.Add("@query", "Delete1");
                sl.Add("@Branch_ID", e.CommandArgument);
                ERP.ExecuteNonQuerySP("branch_sp", sl);
                grid_bind();
            }
        }


    }
    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
    protected void ddCountryName_SelectedIndexChanged(object sender, EventArgs e)
    {
        state_bind();
    }
    protected void ddStateName_SelectedIndexChanged(object sender, EventArgs e)
    {
        city_bind();
    }
    protected void ddCityName_SelectedIndexChanged(object sender, EventArgs e)
    {

    }

}