using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Collections;

public partial class security_question_master1 : System.Web.UI.Page
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
        GridView1.DataSource = ERP.GetDataReaderSP("security_sp", sl);
        GridView1.DataBind();
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        SortedList sl1 = new SortedList();
        sl1.Add("@query", "Count");
        sl1.Add("@Security_Question", txtSecurityQuestion.Text);
        string count = ERP.ExecuteScalarSP("security_sp", sl1).ToString();
        Label1.Visible = false;
        if (count == "0")
        {
            SortedList sl = new SortedList();
            sl.Add("@query", "Insert1");
            sl.Add("@Security_Question", txtSecurityQuestion.Text);
            sl.Add("@Description", txtDescription.Text);
            int n = Convert.ToInt32(ERP.ExecuteNonQuerySP("security_sp", sl));
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
        sl.Add("@Security_ID", ViewState["Security_ID"]);
        sl.Add("@Security_Question", txtSecurityQuestion.Text);
        sl.Add("@Description", txtDescription.Text);
        int n = Convert.ToInt32(ERP.ExecuteNonQuerySP("security_sp", sl));
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
            sl.Add("@Security_ID", e.CommandArgument.ToString());
            SqlDataReader dr = ERP.GetDataReaderSP("security_sp", sl);
            while (dr.Read())
            {
                int A = Convert.ToInt32(dr["Security_ID"].ToString());
                txtSecurityQuestion.Text = dr["Security_Question"].ToString();
                txtDescription.Text = dr["Description"].ToString();
                ViewState["Security_ID"] = A;

            }
            grid_bind();
        }
        else
        {
            if (e.CommandName == "Deletee")
            {
                SortedList sl = new SortedList();
                sl.Add("@query", "Delete1");
                sl.Add("@Security_ID", e.CommandArgument);
                ERP.ExecuteNonQuerySP("security_sp", sl);
                grid_bind();
            }
        }

    }
}