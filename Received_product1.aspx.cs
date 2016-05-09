using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Collections;

public partial class Received_product1 : System.Web.UI.Page
{    
    ERPStoreProcedure ERP = new ERPStoreProcedure();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            mainproduct_bind();
        }
    }
  

    public void mainproduct_bind()
    {
        SortedList sl = new SortedList();
        sl.Add("@query", "Select grid");
        ddProductMainCategory.DataSource = ERP.GetDataReaderSP("product_sp", sl);
        ddProductMainCategory.DataTextField = "Product_Name";
        ddProductMainCategory.DataValueField = "Product_Main_ID";
        ddProductMainCategory.DataBind();
        subproduct_bind();
    }

    public void subproduct_bind()
    {
        SortedList sl = new SortedList();
        sl.Add("@query", "Select product");
        sl.Add("@Product_Main_ID", ddProductMainCategory.SelectedItem.Value);
        ddProductSubCategory.DataSource = ERP.GetDataReaderSP("Productsub_sp", sl);
        ddProductSubCategory.DataTextField = "ProductSub_Name";
        ddProductSubCategory.DataValueField = "ProductSub_ID";
        ddProductSubCategory.DataBind();
        productname_bind();
    }

    public void productname_bind()
    {
        SortedList sl = new SortedList();
        sl.Add("@query", "Select sub product");
        sl.Add("@Product_Sub_ID", ddProductSubCategory.SelectedItem.Value);
        ddProductName.DataSource = ERP.GetDataReaderSP("prod_form_master_sp", sl);
        ddProductName.DataTextField = "Prod_Name";
        ddProductName.DataValueField = "Product_ID";
        ddProductName.DataBind();
    }
    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        SortedList sl=new SortedList();
        sl.Add("@query", "Select main_sub_product");
        sl.Add("@Product_ID",ddProductName.SelectedItem.Value);
        SqlDataReader dr=ERP.GetDataReaderSP("prod_form_master_sp",sl);
        while (dr.Read())
	    {
            lblMainProduct.Text = dr["Product_Name"].ToString();     
            lblSubProduct.Text=dr["ProductSub_Name"].ToString();
            lblProduct.Text=dr["Prod_Name"].ToString();
	    }
        dr.Close();
        string main_product = lblMainProduct.Text.Substring(0,2);
        string sub_product = lblSubProduct.Text.Substring(0,2);
        string product = lblProduct.Text.Substring(0,2);
        string str;
        if (txtColor.Text != null)
        {
            string color = txtColor.Text.Substring(0, 2);        
            str = main_product + sub_product + product + color;
        }
        else
        {
            str = main_product + sub_product + product;
        }
        
        int n = Convert.ToInt16(txtQuantity.Text);
        for (int i = 0; i <n ; i++)
        {
            string s = str + i;
            SortedList sl2 = new SortedList();
            sl2.Add("@query", "Count");
            sl2.Add("@Item_Code", s.ToString());
            string count= ERP.ExecuteNonQuerySP("product_stock_sp",sl2).ToString();
            if (count == "0")
            {
                SortedList sl1 = new SortedList();
                sl1.Add("@query", "Insert1");
                sl1.Add("@Main_Produce_ID", ddProductMainCategory.SelectedItem.Value);
                sl1.Add("@Sub_Product_ID", ddProductSubCategory.SelectedItem.Value);
                sl1.Add("@Product_ID", ddProductName.SelectedItem.Value);
                sl1.Add("@Color", txtColor.Text);
                sl1.Add("@Item_Code", s.ToString());
                int m = Convert.ToInt32(ERP.ExecuteNonQuerySP("product_stock_sp", sl1));
            }
            else
            {

            }
        }        
    }
    protected void ddProductMainCategory_SelectedIndexChanged(object sender, EventArgs e)
    {
        subproduct_bind();
    }
    protected void ddProductSubCategory_SelectedIndexChanged(object sender, EventArgs e)
    {
        productname_bind();
    }
    protected void ddProductName_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
}