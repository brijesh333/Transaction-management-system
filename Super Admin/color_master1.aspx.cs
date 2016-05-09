using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Collections;

public partial class color_master1 : System.Web.UI.Page
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
        GridView1.DataSource = ERP.GetDataReaderSP("color_sp", sl);
        GridView1.DataBind();
    }

    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        SortedList sl = new SortedList();
        sl.Add("@query", "Count");
        sl.Add("@Color_Name", txtColor.Text);
        string count = ERP.ExecuteScalarSP("color_sp", sl).ToString();
        Label1.Visible = false;
        if (count == "0")
        {
            SortedList sl1 = new SortedList();
            sl1.Add("@query", "Insert1");
            sl1.Add("@Color_Name", txtColor.Text);
            sl1.Add("@Color_Description", txtDescription.Text);
            int n = Convert.ToInt32(ERP.ExecuteNonQuerySP("color_sp", sl1));
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
        SortedList sl1 = new SortedList();
        sl1.Add("@query", "Update1");
        sl1.Add("@Color_ID", ViewState["Color_ID"]);
        sl1.Add("@Color_Name", txtColor.Text);
        sl1.Add("@Color_Description", txtDescription.Text);
        int n = Convert.ToInt32(ERP.ExecuteNonQuerySP("color_sp", sl1));
        Label1.Visible = false;
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
            sl.Add("@Color_ID", e.CommandArgument.ToString());
            SqlDataReader dr = ERP.GetDataReaderSP("color_sp", sl);
            while (dr.Read())
            {
                int A = Convert.ToInt32(dr["Color_ID"].ToString());
                txtColor.Text = dr["Color_Name"].ToString();
                txtDescription.Text = dr["Color_Description"].ToString();
                ViewState["Color_ID"] = A;

            }
            grid_bind();
        }
        else
        {
            if (e.CommandName == "Deletee")
            {
                SortedList sl = new SortedList();
                sl.Add("@query", "Delete1");
                sl.Add("@Color_ID", e.CommandArgument);
                ERP.ExecuteNonQuerySP("color_sp", sl);
                grid_bind();
            }
        }
    }
    protected void GridView1_SelectedIndexChanged1(object sender, EventArgs e)
    {

    }
}