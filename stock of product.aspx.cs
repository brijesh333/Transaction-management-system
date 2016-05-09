using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Collections;

public partial class stock_of_product : System.Web.UI.Page
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
        SortedList sl = new SortedList();
        sl.Add("@query", "Select stock");
        sl.Add("@Main_Product_ID", ddProductMainCategory.SelectedItem.Value);
        sl.Add("@Sub_Product_ID", ddProductSubCategory.SelectedItem.Value);
        sl.Add("@Product_ID", ddProductName.SelectedItem.Value);
        SqlDataReader dr = ERP.GetDataReaderSP("Select1",sl);
        while (dr.Read())
        {
            lblQuantity.Text = dr["Avail_Quantity"].ToString();
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