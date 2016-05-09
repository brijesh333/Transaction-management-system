using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Collections;

public partial class city_master1 : System.Web.UI.Page
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
    }

    public void grid_bind()
    {
        SortedList sl = new SortedList();
        sl.Add("@query", "Select grid");
        GridView1.DataSource = ERP.GetDataReaderSP("city_sp", sl);
        GridView1.DataBind();
    }

    public void grid1()
    {
        SortedList sl = new SortedList();
        sl.Add("@query", "Inner");
        GridView1.DataSource = ERP.GetDataReaderSP("city_sp", sl);
        GridView1.DataBind();
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        SortedList sl = new SortedList();
        sl.Add("@query", "Count");
        sl.Add("@City_Name", txtCityName.Text);
        string count = ERP.ExecuteScalarSP("city_sp", sl).ToString();
        Label1.Visible = false;
        if (count == "0")
        {
            SortedList sl1 = new SortedList();
            sl1.Add("@query", "Insert1");
            sl1.Add("@Country_ID", ddCountryName.SelectedItem.Value);
            sl1.Add("@State_ID", ddStateName.SelectedItem.Value);
            sl1.Add("@City_Name", txtCityName.Text);
            sl1.Add("@Description", txtDescription.Text);
            int n = Convert.ToInt32(ERP.ExecuteNonQuerySP("city_sp", sl1));
        }
        else
        {
            Label1.Text = "Already Exist";
            Label1.Visible = true;
        }
        grid_bind();
    }

    protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "Editt")
        {
            SortedList sl = new SortedList();
            sl.Add("@query", "Select1");
            sl.Add("@City_ID", e.CommandArgument.ToString());
            SqlDataReader dr = ERP.GetDataReaderSP("city_sp", sl);
            while (dr.Read())
            {
                country_bind();
                int A = Convert.ToInt32(dr["City_ID"].ToString());
                ddCountryName.SelectedValue = dr["Country_ID"].ToString();
                state_bind();
                ddStateName.SelectedValue = dr["State_ID"].ToString();
                txtCityName.Text = dr["City_Name"].ToString();
                txtDescription.Text = dr["Description"].ToString();
                ViewState["City_ID"] = A;
            }
            grid_bind();


        }
        else
        {
            if (e.CommandName == "Deletee")
            {
                SortedList sl = new SortedList();
                sl.Add("@query", "Delete1");
                sl.Add("@City_ID", e.CommandArgument);
                ERP.ExecuteNonQuerySP("city_sp", sl);
                grid_bind();
            }
        }

    }

    protected void Button2_Click(object sender, EventArgs e)
    {
        SortedList sl = new SortedList();
        sl.Add("@query", "Update1");
        sl.Add("@City_ID", ViewState["City_ID"]);
        sl.Add("@Country_ID", ddCountryName.SelectedItem.Value);
        sl.Add("@State_ID", ddStateName.SelectedItem.Value);
        sl.Add("@City_Name", txtCityName.Text);
        sl.Add("@Description", txtDescription.Text);
        int n = Convert.ToInt32(ERP.ExecuteNonQuerySP("city_sp", sl));
        grid_bind();

    }
    protected void ddCountryName_SelectedIndexChanged(object sender, EventArgs e)
    {
        state_bind();

    }
    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
}