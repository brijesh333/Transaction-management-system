using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Collections;
public partial class vender_product_detail_form : System.Web.UI.Page
{
    ERPStoreProcedure ERP = new ERPStoreProcedure();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            mainproduct_bind();
            vendor_bind();            
            grid_bind();
            lblMessage.Visible = false;
        }
    }
    public void vendor_bind()
    {
        SortedList sl= new SortedList();
        sl.Add("@query", "Select vendor");
        ddVendorName.DataSource = ERP.GetDataReaderSP("vendorregistration_sp",sl);
        ddVendorName.DataTextField = "Vendor_Name";
        ddVendorName.DataValueField = "Vendor_ID";
        ddVendorName.DataBind();       
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

    
    public void grid_bind()
    {
        SortedList sl = new SortedList();
        sl.Add("@query", "Select grid");
        GridView1.DataSource = ERP.GetDataReaderSP("vendor_prod_detail_sp", sl);
        GridView1.DataBind();
    }

    protected void btnAdd_Click(object sender, EventArgs e)
    {
        SortedList sl1 = new SortedList();
        sl1.Add("@query","Count");
        sl1.Add("@Vendor_ID", ddVendorName.SelectedItem.Value);
        sl1.Add("@Main_Product_ID", ddProductMainCategory.SelectedItem.Value);
        sl1.Add("@Sub_Product_ID", ddProductSubCategory.SelectedItem.Value);
        sl1.Add("@Product_ID", ddProductName.SelectedItem.Value);
        string count = ERP.ExecuteScalarSP("vendor_prod_detail_sp", sl1).ToString();
        if (count == "0")
        {
            SortedList sl = new SortedList();
            sl.Add("@query", "Insert1");
            sl.Add("@Vendor_ID", ddVendorName.SelectedItem.Value);
            sl.Add("@Main_Product_ID", ddProductMainCategory.SelectedItem.Value);
            sl.Add("@Sub_Product_ID", ddProductSubCategory.SelectedItem.Value);
            sl.Add("@Product_ID", ddProductName.SelectedItem.Value);
            sl.Add("@Color", txtColor.Text);
            sl.Add("@Unit_Price", txtUnitPrice.Text);
            ERP.ExecuteNonQuerySP("vendor_prod_detail_sp", sl);
            grid_bind();
        }
        else
        {
            lblMessage.Visible = true;
            lblMessage.Text = "Data Already Exist";
        }
        
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
            sl.Add("@Prod_Supp_ID", e.CommandArgument.ToString());
            SqlDataReader dr = ERP.GetDataReaderSP("vendor_prod_detail_sp", sl);
            while (dr.Read())
            {
                int A = Convert.ToInt32(dr["Prod_Supp_ID"].ToString());
                ddVendorName.SelectedValue = dr["Vendor_ID"].ToString();
                ddProductMainCategory.SelectedValue = dr["Main_Product_ID"].ToString();
                subproduct_bind();
                ddProductSubCategory.SelectedValue = dr["Sub_Product_ID"].ToString();
                productname_bind();
                ddProductName.SelectedValue = dr["Product_ID"].ToString();
                txtColor.Text = dr["Color"].ToString();
                txtUnitPrice.Text = dr["Unit_Price"].ToString();
                ViewState["Prod_Supp_ID"] = A;
            }
            grid_bind();
        }
        else
        {
            if (e.CommandName == "Deletee")
            {
                SortedList sl = new SortedList();
                sl.Add("@query", "Delete1");
                sl.Add("@Prod_Supp_ID", e.CommandArgument);
                ERP.ExecuteNonQuerySP("vendor_prod_detail_sp", sl);
                grid_bind();
            }
        }
    }

    protected void ddProductMainCategory_SelectedIndexChanged(object sender, EventArgs e)
    {
        subproduct_bind();
    }
    protected void btnUpdate_Click(object sender, EventArgs e)
    {

    }
    protected void ddProductSubCategory_SelectedIndexChanged(object sender, EventArgs e)
    {
        productname_bind();
    }
    protected void ddProductName_SelectedIndexChanged(object sender, EventArgs e)
    {
 
    }
    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        Panel1.Visible = false;
    }
    protected void GridView2_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
    protected void btnSubmit_Click1(object sender, EventArgs e)
    {

    }
}