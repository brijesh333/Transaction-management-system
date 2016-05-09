using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Collections;

public partial class inquiry_master1 : System.Web.UI.Page
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
        GridView1.DataSource = ERP.GetDataReaderSP("inq_sp", sl);
        GridView1.DataBind();
    }

    protected void btnInsert_Click(object sender, EventArgs e)
    {
        SortedList sl = new SortedList();
        sl.Add("@query", "Count");
        sl.Add("@Inq_Type", txtInquiryType.Text);
        sl.Add("@Inq_Description", txtinquiryDescription.Text);
        string count = ERP.ExecuteScalarSP("inq_sp", sl).ToString();
        Label1.Visible = false;
        if (count == "0")
        {
            SortedList sl1 = new SortedList();
            sl1.Add("@query", "Insert1");
            sl1.Add("@Inq_Type", txtInquiryType.Text);
            sl1.Add("@Inq_Description", txtinquiryDescription.Text);
            int n = Convert.ToInt32(ERP.ExecuteNonQuerySP("Inq_sp", sl1));
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
        sl1.Add("@Inq_ID", ViewState["Inq_ID"]);
        sl1.Add("@Inq_Type", txtInquiryType.Text);
        sl1.Add("@Inq_Description", txtinquiryDescription.Text);
        int n = Convert.ToInt32(ERP.ExecuteNonQuerySP("Inq_sp", sl1));
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
            sl.Add("@Inq_ID", e.CommandArgument.ToString());
            SqlDataReader dr = ERP.GetDataReaderSP("inq_sp", sl);
            while (dr.Read())
            {
                int A = Convert.ToInt32(dr["Inq_ID"].ToString());
                txtInquiryType.Text = dr["Inq_Type"].ToString();
                txtinquiryDescription.Text = dr["Inq_Description"].ToString();
                ViewState["Inq_ID"] = A;

            }
            grid_bind();
        }
        else
        {
            if (e.CommandName == "Deletee")
            {
                SortedList sl = new SortedList();
                sl.Add("@query", "Delete1");
                sl.Add("@Inq_ID", e.CommandArgument);
                ERP.ExecuteNonQuerySP("inq_sp", sl);
                grid_bind();
            }
        }

    }
}