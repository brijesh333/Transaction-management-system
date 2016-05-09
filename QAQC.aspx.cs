using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Collections;

public partial class QAQC : System.Web.UI.Page
{
    ERPStoreProcedure ERP = new ERPStoreProcedure();
    int i,tt;
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    public void stock_entry()
    {
        SortedList sl = new SortedList();
        sl.Add("@query","Select1");
        sl.Add("@Product_Main_ID", Convert.ToInt32(Session["Product_Main_ID"].ToString()));
        sl.Add("@Product_Sub_ID", Convert.ToInt32(Session["Product_Sub_ID"].ToString()));
        sl.Add("@Product_ID", Convert.ToInt32(Session["Product_ID"].ToString()));
        SqlDataReader dr = ERP.GetDataReaderSP("stock_of_product_sp", sl);
        DataTable dt = new DataTable();
        dt.Load(dr);
        if (dt.Rows.Count==0)
        {
            SortedList sl2 = new SortedList();
            sl2.Add("@query", "Insert1");
            sl2.Add("@Product_Main_ID", Convert.ToInt32(Session["Product_Main_ID"].ToString()));
            sl2.Add("@Product_Sub_ID", Convert.ToInt32(Session["Product_Sub_ID"].ToString()));
            sl2.Add("@Product_ID", Convert.ToInt32(Session["Product_ID"].ToString()));
            sl2.Add("@Avail_Quantity", lblReceivedQuantity.Text);
            sl2.Add("@Unit_Sell_Price", txtSalePrice.Text);
            ERP.ExecuteNonQuerySP("stock_of_product_sp", sl2);
        }
        else
        {            
            int stck = Convert.ToInt32(dt.Rows[0]["Avail_Quantity"]);
            int temp = Convert.ToInt32(lblReceivedQuantity.Text);
            int tot = stck + temp;
            SortedList sl1 = new SortedList();
            sl1.Add("@query", "Update1");
            sl1.Add("@Product_Main_ID", Convert.ToInt32(Session["Product_Main_ID"].ToString()));
            sl1.Add("@Product_Sub_ID", Convert.ToInt32(Session["Product_Sub_ID"].ToString()));
            sl1.Add("@Product_ID", Convert.ToInt32(Session["Product_ID"].ToString()));
            sl1.Add("@Avail_Quantity", tot.ToString());
            sl1.Add("@Unit_Sell_Price",txtSalePrice.Text);
            ERP.ExecuteNonQuerySP("stock_of_product_sp", sl1);
        }
    }

    protected void btnViewDetail_Click(object sender, EventArgs e)
    {
        SortedList sl = new SortedList();
        sl.Add("@query", "Select2");
        sl.Add("Order_ID", txtOrderNo.Text);
        SqlDataReader dr = ERP.GetDataReaderSP("order_placement_sp", sl);
        while (dr.Read())
        {
            lblVendorName.Text = dr["Vendor_Name"].ToString();
            lblOrderDate.Text=dr["Order_Date"].ToString();
            lblProductMainCategory.Text=dr["Product_Name"].ToString();
            lblProductSubCategory.Text=dr["ProductSub_Name"].ToString();
            lblProductName.Text=dr["Prod_Name"].ToString();
            lblColor.Text=dr["Color"].ToString();
            lblOrderQuantity.Text = dr["Quantity"].ToString();
            lblPurchasePrice.Text = dr["Unit_Price"].ToString();
            Session["Order_ID"] = dr["Order_ID"].ToString();
            Session["Vendor_ID"] = dr["Vendor_ID"].ToString();
            Session["Product_Main_ID"] = dr["Product_Main_ID"].ToString();
            Session["Product_Sub_ID"] = dr["Product_Sub_ID"].ToString();
            Session["Product_ID"] = dr["Product_ID"].ToString();
        }
        dr.Close();
    }
    protected void txtDamadgedQuantity_TextChanged(object sender, EventArgs e)
    {
        int i = Convert.ToInt32(lblOrderQuantity.Text);
        int j = Convert.ToInt32(txtDamadgedQuantity.Text);
        int k = i - j;
        lblReceivedQuantity.Text = k.ToString();
    }

    protected void btnApprove_Click(object sender, EventArgs e)
    {       
        SortedList sl = new SortedList();
        sl.Add("@query", "Select main_sub_product");
        sl.Add("@Product_ID", Session["Product_ID"].ToString());
        SqlDataReader dr = ERP.GetDataReaderSP("prod_form_master_sp", sl);
        while (dr.Read())
        {
            lblProductMainCategory.Text = dr["Product_Name"].ToString();
            lblProductSubCategory.Text = dr["ProductSub_Name"].ToString();
            lblProductName.Text = dr["Prod_Name"].ToString();
        }
        dr.Close();
        string main_product = lblProductMainCategory.Text.Substring(0, 2);
        string sub_product = lblProductSubCategory.Text.Substring(0, 2);
        string product = lblProductName.Text.Substring(0, 2);
        string str;
        if (lblColor.Text != null)
        {        
            string color = lblColor.Text.Substring(0, 2);
            str = main_product + sub_product + product + color;
        }
        else
        {
            str = main_product + sub_product + product;
        }

        int n = Convert.ToInt16(lblReceivedQuantity.Text);

        SortedList sl4 = new SortedList();
        sl4.Add("@query","Temp field");
        SqlDataReader dr2 = ERP.GetDataReaderSP("product_stock_sp", sl4);
        while (dr2.Read())
        {
            Label3.Text =dr2["max_id"].ToString();
            tt = Convert.ToInt32(Label3.Text);
        }
        dr2.Close();
        /*
        for (i = 0; i < n; i++)
        {
            string s = str + tt;
            SortedList sl2 = new SortedList();
            sl2.Add("@query", "Count");
            sl2.Add("@Item_Code", s.ToString());
            string count = ERP.ExecuteNonQuerySP("product_stock_sp", sl2).ToString();
            if (count != "0")
            {
                SortedList sl1 = new SortedList();
                sl1.Add("@query", "Insert1");
                sl1.Add("@Main_Produce_ID", Convert.ToInt32(Session["Product_Main_ID"].ToString()));
                sl1.Add("@Sub_Product_ID", Convert.ToInt32(Session["Product_Sub_ID"].ToString()));
                sl1.Add("@Product_ID", Convert.ToInt32(Session["Product_ID"].ToString()));
                sl1.Add("@Color", lblColor.Text);
                sl1.Add("@Item_Code", s.ToString());
                Label1.Text = s.ToString();
                int m = Convert.ToInt32(ERP.ExecuteNonQuerySP("product_stock_sp", sl1));
            }
            else
            {

            }
       }*/
        stock_entry();
        if(lblOrderQuantity.Text.Equals(lblReceivedQuantity.Text))
        {
            System.Windows.Forms.MessageBox.Show("Order completed..");
        }
        else
        {            
            SortedList sl5 = new SortedList();
            sl5.Add("@query","Insert1");
            sl5.Add("@Oreder_ID",Convert.ToInt32(Session["Order_ID"].ToString()));
            sl5.Add("@Oreder_Date",lblOrderDate.Text);
            sl5.Add("@Main_Product_ID", Convert.ToInt32(Session["Product_Main_ID"].ToString()));
            sl5.Add("@Sub_Product_ID", Convert.ToInt32(Session["Product_Sub_ID"].ToString()));
            sl5.Add("@Product_ID", Convert.ToInt32(Session["Product_ID"].ToString()));
            sl5.Add("@Color",lblColor.Text);
            sl5.Add("@Order_Quantity",lblOrderQuantity.Text);
            sl5.Add("@Damadged_Quantity",txtDamadgedQuantity.Text);
            sl5.Add("@Damadged_Description",txtDamadgedDescription.Text);
            ERP.ExecuteNonQuerySP("purchase_return_sp",sl5);
            System.Windows.Forms.MessageBox.Show("Product Name : " + lblProductName.Text + "\n" + "Damadged quantity : " + txtDamadgedQuantity.Text);
        }

        /*
        SortedList sl6 = new SortedList();
        sl6.Add("@query","Count");
        sl6.Add("@Main_Product_ID", Convert.ToInt32(Session["Product_Main_ID"].ToString()));
        sl6.Add("@Sub_Product_ID", Convert.ToInt32(Session["Product_Sub_ID"].ToString()));
        sl6.Add("@Product_ID", Convert.ToInt32(Session["Product_ID"].ToString()));
        string c = ERP.ExecuteScalarSP("stock_of_product_sp", sl6).ToString();
        if (c=="0")
        {
            SortedList sl7 = new SortedList();
            sl7.Add("@query", "Count");
            sl7.Add("@Main_Product_ID", Convert.ToInt32(Session["Product_Main_ID"].ToString()));
            sl7.Add("@Sub_Product_ID", Convert.ToInt32(Session["Product_Sub_ID"].ToString()));
            sl7.Add("@Product_ID", Convert.ToInt32(Session["Product_ID"].ToString()));
            sl7.Add("@Avail_Quantity",lblReceivedQuantity.Text);
            ERP.ExecuteNonQuerySP("stock_of_product_sp", sl7);
        }
        else
        {
            SortedList sl8 = new SortedList();
            sl8.Add("@query", "Update1");
            sl8.Add("@Main_Product_ID", Convert.ToInt32(Session["Product_Main_ID"].ToString()));
            sl8.Add("@Sub_Product_ID", Convert.ToInt32(Session["Product_Sub_ID"].ToString()));
            sl8.Add("@Product_ID", Convert.ToInt32(Session["Product_ID"].ToString()));
            sl8.Add("@Avail_Quantity", lblReceivedQuantity.Text);
            ERP.ExecuteNonQuerySP("stock_of_product_sp", sl8);
        }*/	   
    }
}