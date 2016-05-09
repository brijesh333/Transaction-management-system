using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Collections;

public partial class product_sub_master1 : System.Web.UI.Page
{
    ERPStoreProcedure ERP = new ERPStoreProcedure();

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            product_bind();
            grid_bind();
        }
    }
    public void product_bind()
    {
        SortedList sl = new SortedList();
        sl.Add("@query", "Select grid");
        ddProduct.DataSource = ERP.GetDataReaderSP("product_sp", sl);
        ddProduct.DataTextField = "Product_Name";
        ddProduct.DataValueField = "Product_Main_ID";
        ddProduct.DataBind();

    }

    public void grid_bind()
    {
        SortedList sl = new SortedList();
        sl.Add("@query", "Select grid");
        GridView1.DataSource = ERP.GetDataReaderSP("productsub_sp", sl);
        GridView1.DataBind();

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        SortedList sl1 = new SortedList();
        sl1.Add("@query", "Count");
        sl1.Add("@ProductSub_Name", txtProduct.Text);
        string count = ERP.ExecuteScalarSP("productsub_sp", sl1).ToString();
        Label1.Visible = false;
        if (count == "0")
        {
            SortedList sl = new SortedList();
            sl.Add("@query", "Insert1");
            sl.Add("@Product_Main_ID", ddProduct.SelectedItem.Value);
            sl.Add("@ProductSub_Name", txtProduct.Text);
            sl.Add("@Description", txtDescription.Text);
            int n = Convert.ToInt32(ERP.ExecuteNonQuerySP("productsub_sp", sl));
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
        sl.Add("@ProductSub_ID", ViewState["ProductSub_ID"]);
        sl.Add("@Product_Main_ID", ddProduct.SelectedItem.Value);
        sl.Add("@ProductSub_Name", txtProduct.Text);
        sl.Add("@Description", txtDescription.Text);
        int n = Convert.ToInt32(ERP.ExecuteNonQuerySP("productsub_sp", sl));
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
            sl.Add("@ProductSub_ID", e.CommandArgument.ToString());
            SqlDataReader dr = ERP.GetDataReaderSP("productsub_sp", sl);
            while (dr.Read())
            {
                int A = Convert.ToInt32(dr["ProductSub_ID"].ToString());
                ddProduct.SelectedValue = dr["Product_Main_ID"].ToString();
                txtProduct.Text = dr["ProductSub_Name"].ToString();
                txtDescription.Text = dr["Description"].ToString();
                ViewState["ProductSub_ID"] = A;

            }
            grid_bind();
        }
        else
        {
            if (e.CommandName == "Deletee")
            {
                SortedList sl = new SortedList();
                sl.Add("@query", "Delete1");
                sl.Add("@ProductSub_ID", e.CommandArgument);
                ERP.ExecuteNonQuerySP("productsub_sp", sl);
                grid_bind();
            }
        }

    }
    protected void ddProduct_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
}