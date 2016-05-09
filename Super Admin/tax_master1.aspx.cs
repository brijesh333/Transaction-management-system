using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Collections;

public partial class tax_master1 : System.Web.UI.Page
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
        GridView1.DataSource = ERP.GetDataReaderSP("tax_sp", sl);
        GridView1.DataBind();
    }

    protected void btnInsert_Click(object sender, EventArgs e)
    {
        SortedList sl = new SortedList();
        sl.Add("@query", "Count");
        sl.Add("@Tax_Name", txtTaxName.Text);
        string count = ERP.ExecuteScalarSP("tax_sp", sl).ToString();
        Label1.Visible = false;
        if (count == "0")
        {
            SortedList sl1 = new SortedList();
            sl1.Add("@query", "Insert1");
            sl1.Add("@Tax_Name", txtTaxName.Text);
            sl1.Add("@Tax_Description", txtDescription.Text);
            sl1.Add("@Tax_Date", txtTaxAppliedDate.Text);
            sl1.Add("@Tax_Rate", txtTaxRate.Text);
            int n = Convert.ToInt32(ERP.ExecuteNonQuerySP("tax_sp", sl1));
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
        sl1.Add("@Tax_ID", ViewState["Tax_ID"]);
        sl1.Add("@Tax_Name", txtTaxName.Text);
        sl1.Add("@Tax_Description", txtDescription.Text);
        sl1.Add("@Tax_Date", txtTaxAppliedDate.Text);
        sl1.Add("@Tax_Rate", txtTaxRate.Text);
        int n = Convert.ToInt32(ERP.ExecuteNonQuerySP("tax_sp", sl1));
        grid_bind();

    }
    protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "Editt")
        {
            SortedList sl = new SortedList();
            sl.Add("@query", "Select1");
            sl.Add("@Tax_ID", e.CommandArgument.ToString());
            SqlDataReader dr = ERP.GetDataReaderSP("tax_sp", sl);
            while (dr.Read())
            {
                int A = Convert.ToInt32(dr["Tax_ID"].ToString());
                txtTaxName.Text = dr["Tax_Name"].ToString();
                txtDescription.Text = dr["Tax_Description"].ToString();
                txtTaxAppliedDate.Text = dr["Tax_Date"].ToString();
                txtTaxRate.Text = dr["Tax_Rate"].ToString();
                ViewState["Tax_ID"] = A;

            }
            grid_bind();
        }
        else
        {
            if (e.CommandName == "Deletee")
            {
                SortedList sl = new SortedList();
                sl.Add("@query", "Delete1");
                sl.Add("@Tax_ID", e.CommandArgument);
                ERP.ExecuteNonQuerySP("tax_sp", sl);
                grid_bind();
            }
        }
    }
}