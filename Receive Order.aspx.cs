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
    protected void Page_Load(object sender, EventArgs e)
    {
        Panel1.Visible = true ;
        Panel2.Visible = false;
        grid_bind();
    }
    
    public void grid_bind()
    {
        SortedList sl = new SortedList();
        sl.Add("@query", "Select grid");
        GridView1.DataSource = ERP.GetDataReaderSP("received_product_sp", sl);
        GridView1.DataBind();
    }
    
    protected void btnViewDetail_Click(object sender, EventArgs e)
    {
        Panel1.Visible = true;
        SortedList sl = new SortedList();
        sl.Add("@query","Select2");
        sl.Add("Order_ID",txtOrderNo.Text);
        SqlDataReader dr = ERP.GetDataReaderSP("order_placement_sp", sl);
        while (dr.Read())
        {
            lblOrderNo.Text = dr["Order_ID"].ToString();
            lblVendorID.Text = dr["Vendor_ID"].ToString();
            lblProductID.Text = dr["Product_ID"].ToString();
            lblColor.Text = dr["Color"].ToString();
            lblDescription.Text = dr["Description"].ToString();
            lblOrderQuantity.Text = dr["Quantity"].ToString();
            Label9.Text = dr["Product_Main_ID"].ToString();
            Label10.Text = dr["Product_Sub_ID"].ToString();
            Label11.Text = dr["Unit_Price"].ToString();
            Label13.Text = dr["Price"].ToString();
            lblOrderDate.Text = dr["Order_Date"].ToString();
        }
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        lblRQ.Text = txtReceivedQuantity.Text;
        lblDQ.Text = txtDamagedQuantity.Text;
        lblDD.Text = txtDamadgesDescription.Text;
        SortedList sl = new SortedList();
        sl.Add("@query", "Insert1");
        sl.Add("@Order_ID", lblOrderNo.Text);
        sl.Add("@Vendor_ID", lblVendorID.Text);
        sl.Add("@Product_Main_ID", Label9.Text);
        sl.Add("@Product_Sub_ID", Label10.Text);
        sl.Add("@Product_ID", lblProductID.Text);
        sl.Add("@Color", lblColor.Text);
        sl.Add("@Unit_Price", Label11.Text);
        sl.Add("@Quantity", lblOrderQuantity.Text);
        sl.Add("@Received_Quantity", txtReceivedQuantity.Text);
        sl.Add("@Damadged_Quantity", txtDamagedQuantity.Text);
        sl.Add("@Damadged_Description", txtDamadgesDescription.Text);
        sl.Add("@Price", Label13.Text);
        sl.Add("@Description", lblDescription.Text);
        sl.Add("@Receive_Date", txtDate.Text);
        int n=Convert.ToInt32(ERP.ExecuteNonQuerySP("received_product_sp", sl));
        lbltemp.Text = "after submit";   
    }

    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
    protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
    {

    }
    protected void txtReceivedQuantity_TextChanged(object sender, EventArgs e)
    {
        int i = Convert.ToInt32(lblOrderQuantity.Text);
        int j = Convert.ToInt32(txtReceivedQuantity.Text);
        int k = i - j;
        lblRemainingQuantity.Text = k.ToString();
    }
    protected void btnOK_Click(object sender, EventArgs e)
    {
        Panel2.Visible=true;
    }
}