using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Collections;

public partial class Order_Placement : System.Web.UI.Page
{
    ERPStoreProcedure ERP = new ERPStoreProcedure();
    protected void Page_Load(object sender, EventArgs e)
    {
        Panel1.Visible = false;
        Panel2.Visible = true;
        btnAddNewOrder.Visible = false;
        if (!IsPostBack)
        {
            mainproduct_bind();
            vendor_bind();
           // grid_bind();
        }
        lblDate.Text = System.DateTime.Now.ToString();
    }

    public void grid_bind()
    {
        SortedList sl = new SortedList();
        sl.Add("@query", "Select vendor");
        GridView1.DataSource = ERP.GetDataReaderSP("vendor_prod_detail_sp", sl);
        GridView1.DataBind();    
    }

    public void vendor_bind()
    {
        SortedList sl = new SortedList();
        sl.Add("@query", "Select grid");
        ddVendorName.DataSource = ERP.GetDataReaderSP("vendorregistration_sp", sl);
        ddVendorName.DataTextField="Vendor_Name";
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

    /*
    public void vendor_bind()
    {
        SortedList sl = new SortedList();
        sl.Add("@query", "Select vendor");
        ddVendorName.DataSource = ERP.GetDataReaderSP("vendorregistration_sp", sl);
        ddVendorName.DataTextField = "Vendor_Name";
        ddVendorName.DataValueField = "Vendor_ID";
        ddVendorName.DataBind();
    }*/
    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        
        SortedList sl = new SortedList();
        sl.Add("@query", "Select vendor");
        sl.Add("@Main_Product_ID", ddProductMainCategory.SelectedItem.Value);
        sl.Add("@Sub_Product_ID", ddProductSubCategory.SelectedItem.Value);
        sl.Add("@Product_ID", ddProductName.SelectedItem.Value);
        //ERP.ExecuteNonQuerySP("vendor_prod_detail_sp", sl);
        //grid_bind();
        GridView1.DataSource = ERP.GetDataReaderSP("vendor_prod_detail_sp", sl);
        GridView1.DataBind();        
    }
    protected void ddProductMainCategory_SelectedIndexChanged(object sender, EventArgs e)
    {
        subproduct_bind();
    }
    protected void ddProductSubCategory_SelectedIndexChanged(object sender, EventArgs e)
    {
        productname_bind();
    }
    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
    protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "Orderr")
        {
            Panel2.Visible = false;
            Panel1.Visible = true;
            GridView1.Visible = false;
            SortedList sl1 = new SortedList();
            sl1.Add("@query", "Order selection");
            sl1.Add("@Prod_Supp_ID", e.CommandArgument.ToString());
            SqlDataReader dr1 = ERP.GetDataReaderSP("vendor_prod_detail_sp", sl1);
            while (dr1.Read())
            {
                lblVendorName.Text = dr1["Vendor_Name"].ToString();                
                lblVendorID.Text=dr1["Vendor_ID"].ToString();
                lblVendorContactNo.Text = dr1["VHOffice_Contact_No"].ToString();
                int A = Convert.ToInt32(dr1["Prod_Supp_ID"].ToString());
                lblProductID.Text = dr1["Product_ID"].ToString();
                lblUnitPrice.Text = dr1["Unit_Price"].ToString();                
            }
            /*
            SortedList sl = new SortedList();
            sl.Add("@query", "Order selection");
            sl.Add("@Prod_Supp_ID", e.CommandArgument.ToString());
            SqlDataReader dr = ERP.GetDataReaderSP("vendor_prod_detail_sp", sl);
            while (dr.Read())
            {
                int A = Convert.ToInt32(dr["Prod_Supp_ID"].ToString());
                lblProductName.Text = dr["Product_ID"].ToString();
                lblColor.Text = dr["Color_Name"].ToString();
                lblUnitPrice.Text = dr["Unit_Price"].ToString();                
            }*/
        }
    }
    protected void btnOrderSubmit_Click(object sender, EventArgs e)
    {
        int o = Convert.ToInt32(lblUnitPrice.Text);
        int n = Convert.ToInt32(txtQuantity.Text);
        int l = o * n;
        lblTotal.Text = Convert.ToString(l);
        Label4.Text = Convert.ToString(l);
        Label5.Text = "Order submitted successfully";
        btnAddNewOrder.Visible = true;
        Panel2.Visible = false;
        System.Windows.Forms.MessageBox.Show("Product ID : "+lblProductID.Text + "\n\n" + "Quantity : " + txtQuantity.Text + "\n\n" + "Total Payable Price : " + lblTotal.Text);
        SortedList sl = new SortedList();
        sl.Add("@query","Insert1");
        sl.Add("@Vendor_ID",lblVendorID.Text);
        sl.Add("@Product_Main_ID", ddProductMainCategory.SelectedItem.Value);
        sl.Add("@Product_Sub_ID",ddProductSubCategory.SelectedItem.Value);
        sl.Add("@Product_ID", ddProductName.SelectedItem.Value);
        sl.Add("@Unit_Price",lblUnitPrice.Text);
        sl.Add("@Color",txtColor.Text);
        sl.Add("@Quantity",txtQuantity.Text);
        sl.Add("@Price", lblTotal.Text);
        sl.Add("@Description", txtDescription.Text);
        sl.Add("@Order_Date", lblDate.Text);
        ERP.ExecuteNonQuerySP("order_placement_sp", sl);        
    }
    protected void btnAddNewOrder_Click(object sender, EventArgs e)
    {
        Response.Redirect("Order Placement.aspx");
    }

    protected void ddProductName_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
}
