using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Collections;

public partial class billing : System.Web.UI.Page
{
    ERPStoreProcedure ERP = new ERPStoreProcedure();
    int amount = 0, avail=0, deduct=0,payable=0;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            product_bind();    
        }
        //clear_grid();
    }

    public void product_bind()
    {
        SortedList sl = new SortedList();
        sl.Add("@query", "Select product");
        ddProductName.DataSource = ERP.GetDataReaderSP("prod_form_master_sp", sl);
        ddProductName.DataTextField = "Prod_Name";
        ddProductName.DataValueField = "Product_ID";        
        ddProductName.DataBind();
        ddProductName.Items.Insert(0, "-- Select --");
    }

    public void grid_bind()
    {
        SortedList sl = new SortedList();
        sl.Add("@query", "Select1");
        GridView1.DataSource = ERP.GetDataReaderSP("bill_temp_sp", sl);
        GridView1.DataBind();
    }

    public void clear_grid()
    {
        SortedList sl = new SortedList();
        sl.Add("@query", "Delete1");
        ERP.ExecuteNonQuerySP("bill_temp_sp", sl);
        grid_bind();
    }
    /*
    public void amount_calculation()
    {
        SortedList sl = new SortedList();
        sl.Add("@query", "Select2");
        SqlDataReader dr = ERP.GetDataReaderSP("bill_temp_sp", sl);
        DataTable dt = new DataTable();
        dt.Load(dr);
        int n = dt.Rows.Count;
        while(n>0)
        {
            amount = amount + Convert.ToInt32(dt.Rows[dt.Rows.Count - n]["Payable_Price"]);
            n--;
        }
        lblTotalAmount.Text = amount.ToString();
        if (amount > avail)
        {
            System.Windows.Forms.MessageBox.Show("Low Balance");
        }
        else
        {
            data_entry();            
        }       
    }
    */
    public void data_entry()
    {
        SortedList sl = new SortedList();
        sl.Add("@query", "Insert1");
        sl.Add("@Product_ID", ddProductName.SelectedItem.Value);
        sl.Add("@Item_Code", lblItemCode.Text);
        sl.Add("@Unit_Price", lblPerUnitPrice.Text);
        sl.Add("@Quantity", txtQuantity.Text);
        sl.Add("@Price", lblPrice.Text);
        sl.Add("@Discount", lblDiscount.Text);
        sl.Add("@Payable_Price", lblPayablePrice.Text);
        ERP.ExecuteNonQuerySP("bill_temp_sp", sl);
        grid_bind();
        txtQuantity.Text = "";
        pay_price_count();
    }

    public void pay_price_count()
    {
        SortedList sl = new SortedList();
        sl.Add("@query", "Select2");
        SqlDataReader dr = ERP.GetDataReaderSP("bill_temp_sp", sl);
        DataTable dt = new DataTable();
        dt.Load(dr);
        int n = dt.Rows.Count;
        while (n > 0)
        {
            payable = payable + Convert.ToInt32(dt.Rows[dt.Rows.Count - n]["Payable_Price"]);
            n--;
        }
        Session["payable"] = payable;
    }
    /*
    public void update_balance()
    {
        int bal=Convert.ToInt32(Session["avail"].ToString())-amount;
        SortedList sl1 = new SortedList();
        sl1.Add("@query", "Update avail bal");
        sl1.Add("@Customer_ID", txtCustomerID.Text);
        sl1.Add("@Regular_Bal",bal);
        ERP.ExecuteNonQuerySP("cust_bal_sp",sl1);
    }
    */
    protected void ddCustomerName_SelectedIndexChanged(object sender, EventArgs e)
    {

    }

    protected void btnProceed_Click(object sender, EventArgs e)
    {
        SortedList sl = new SortedList();
        sl.Add("@query","Select1");
        sl.Add("@Customer_ID",txtCustomerID.Text);
        SqlDataReader dr = ERP.GetDataReaderSP("cust_reg_sp",sl);
        while (dr.Read())
        {
            lblName.Text = dr["Customer_Name"].ToString();       
            lblContactNo.Text = dr["Mob_No"].ToString();
            lblEmailID.Text=dr["Email_ID"].ToString();
            lblAddress.Text = dr["Branch_Name"].ToString() + ", " + dr["City_Name"].ToString() + " ," + dr["State_Name"].ToString() + "," + dr["Country_Name"].ToString();
        }

        SortedList sl1 = new SortedList();
        sl1.Add("@query", "Select avail balance");
        sl1.Add("@Customer_ID", txtCustomerID.Text);
        SqlDataReader dr1 = ERP.GetDataReaderSP("customer_bal_sp", sl1);
        while (dr1.Read())
        {
            lblAvailBalance.Text = dr1["Regular_Bal"].ToString();
        }
        Session["avail"] = Convert.ToInt32(lblAvailBalance.Text);
    }

    protected void txtQuantity_TextChanged(object sender, EventArgs e)
    {
        //SortedList sl = new SortedList();
        //sl.Add("@query", "Select product price");
        //sl.Add("@Product_ID", ddProductName.SelectedItem.Value);
        //SqlDataReader dr = ERP.GetDataReaderSP("prod_form_master_sp", sl);
        //while (dr.Read())
        //{
        //    lblPerUnitPrice.Text = dr["Unit_Price"].ToString();
        //}
        int i = Convert.ToInt32(txtQuantity.Text);
        int j = Convert.ToInt32(lblPerUnitPrice.Text);
        int k=i*j;
        lblPrice.Text = k.ToString();
        lblDiscount.Text = 0.ToString();
        lblPayablePrice.Text = (Convert.ToInt32(lblPrice.Text) - Convert.ToInt32(lblDiscount.Text)).ToString();
    }
    
    protected void ddProductName_SelectedIndexChanged(object sender, EventArgs e)
    {
        SortedList sl = new SortedList();
        sl.Add("@query", "Select data");
        sl.Add("@Product_ID", ddProductName.SelectedItem.Value);
        SqlDataReader dr = ERP.GetDataReaderSP("stock_of_product_sp", sl);
        while (dr.Read())
        {
            lblPerUnitPrice.Text = dr["Unit_Sell_Price"].ToString();
        }

        SortedList sl1 = new SortedList();
        sl1.Add("@query", "Select code");
        sl1.Add("@Product_ID", ddProductName.SelectedItem.Value);
        SqlDataReader dr1 = ERP.GetDataReaderSP("product_stock_sp",sl1);
        DataTable dt=new DataTable();
        dt.Load(dr1);
        lblItemCode.Text = dt.Rows[0]["Item_Code"].ToString();        
    }

    public void stock_deduct()
    {
        SortedList sl2 = new SortedList();
        sl2.Add("@query", "Select1");
        SqlDataReader dr1 = ERP.GetDataReaderSP("bill_temp_sp", sl2);
        DataTable dt1 = new DataTable();
        dt1.Load(dr1);
        int n = Convert.ToInt32(dt1.Rows.Count);
        while (n > 0)
        {
            Session["Pro_ID"] = dt1.Rows[dt1.Rows.Count - n]["Product_ID"].ToString();
            SortedList sl = new SortedList();
            sl.Add("@query", "select stock");
            sl.Add("@Product_ID", Session["Pro_ID"]);
            SqlDataReader dr = ERP.GetDataReaderSP("stock_of_product_sp", sl);
            DataTable dt = new DataTable();
            dt.Load(dr);

            int avail_stock = Convert.ToInt32(dt.Rows[0]["Avail_Quantity"].ToString());
            int qty = Convert.ToInt32(dt1.Rows[dt1.Rows.Count - n]["Quantity"].ToString());
            int fin = avail_stock - qty;
            SortedList sl1 = new SortedList();
            sl1.Add("@query", "Update stock");
            sl1.Add("@Product_ID", Session["Pro_ID"]);
            sl1.Add("@Avail_Quantity", fin);
            ERP.ExecuteNonQuerySP("stock_of_product_sp", sl1);
            n--;
        }
        clear_grid();
    }

    public void payment()
    {
        SortedList sl1 = new SortedList();
        sl1.Add("@query","Select2");
        sl1.Add("@Customer_ID", txtCustomerID.Text);
        SqlDataReader dr = ERP.GetDataReaderSP("customer_rc_sp", sl1);
        DataTable dt = new DataTable();
        dt.Load(dr);
        Session["DRC"] = dt.Rows[0]["RC_Date"];

        int avail_bal = Convert.ToInt32(lblAvailBalance.Text);
        int rem_bal = avail_bal - Convert.ToInt32(Session["payable"]);
        if (rem_bal > 0)
        {
            SortedList sl = new SortedList();
            sl.Add("@query", "Update avail bal");
            sl.Add("@Customer_ID", txtCustomerID.Text);
            sl.Add("@Regular_Bal", rem_bal);
            ERP.ExecuteNonQuerySP("cust_bal_sp", sl);
        }
        else
        {
            System.Windows.Forms.MessageBox.Show("Low Balance");
        }
    }
    protected void btnProceedPayment_Click(object sender, EventArgs e)
    {        
        stock_deduct();
        payment();        
    }

    protected void btnAdd_Click(object sender, EventArgs e)
    {
        //lblTotalAmount.Text = Convert.ToInt32(lblTotalAmount.Text) + Convert.ToInt32(lblPayablePrice.Text);        
        //amount_calculation();
        data_entry();
    }
    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
    protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
    {        
        if (e.CommandName == "Deletee")
        {
            SortedList sl = new SortedList();
            sl.Add("@query", "Delete2");
            sl.Add("@Product_ID", e.CommandArgument);
            ERP.ExecuteNonQuerySP("bill_temp_sp", sl);
        }
        grid_bind();
    }
}