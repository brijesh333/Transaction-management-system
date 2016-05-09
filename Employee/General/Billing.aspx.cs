using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Collections;
using System.Net;
using System.IO;

public partial class Employee_General_Billing : System.Web.UI.Page
{
    ERPStoreProcedure ERP = new ERPStoreProcedure();
    int amount = 0, avail = 0, deduct = 0, payable = 0, payable1=0, rem_bal=0,disc=0,disc_bal=0;
    double dis = 0;
    string rbal;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            product_bind();
        }
        //clear_grid();
        txtFingerPrint.Visible = false;
        txtSMSCode.Visible = false;
        lblSMSCode.Visible = false;
        lblBenBal.Visible = false;
        btnSend.Visible = false;
    }
    public void sms_Send()
    {

    }
    public void send(string uid, string password, string message, string no)
    {
        HttpWebRequest myReq = (HttpWebRequest)WebRequest.Create("http://ubaid.tk/sms/sms.aspx?uid=" + uid + "&pwd=" + password + "&msg=" + message + "&phone=" + no + "&provider=fullonsms");

        HttpWebResponse myResp = (HttpWebResponse)myReq.GetResponse();
        System.IO.StreamReader respStreamReader = new System.IO.StreamReader(myResp.GetResponseStream());
        string responseString = respStreamReader.ReadToEnd();
        respStreamReader.Close();
        myResp.Close();
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
        Session["Customer_ID"] = txtCustomerID.Text;
        SortedList sl = new SortedList();
        sl.Add("@query", "Select1");
        sl.Add("@Customer_ID", txtCustomerID.Text);
        SqlDataReader dr = ERP.GetDataReaderSP("cust_reg_sp", sl);
        while (dr.Read())
        {
            lblName.Text = dr["Customer_Name"].ToString();
            lblContactNo.Text = dr["Mob_No"].ToString();
            lblEmailID.Text = dr["Email_ID"].ToString();
            lblAddress.Text = dr["Branch_Name"].ToString() + ", " + dr["City_Name"].ToString() + " ," + dr["State_Name"].ToString() + "," + dr["Country_Name"].ToString();
        }

        SortedList sl1 = new SortedList();
        sl1.Add("@query", "Select avail balance");
        sl1.Add("@Customer_ID", txtCustomerID.Text);
        SqlDataReader dr1 = ERP.GetDataReaderSP("customer_bal_sp", sl1);
        while (dr1.Read())
        {
            lblAvailBalance.Text = dr1["Regular_Bal"].ToString();
            lblBenBal.Text = dr1["Benifit_Bal"].ToString();
        }
        Session["avail"] = Convert.ToInt32(lblAvailBalance.Text);
        discount_count();
    }

    public void discount_count()
    {
        SortedList sl = new SortedList();
        sl.Add("@query","Select2");
        sl.Add("@Customer_ID", txtCustomerID.Text);
        SqlDataReader dr = ERP.GetDataReaderSP("customer_rc_sp", sl);
        while (dr.Read())
        {
            disc = disc + Convert.ToInt32(dr["RC_Amount"].ToString());
        }
        if (disc<10000)
        {
            dis = 0.5;
        }
        else if (disc >= 10000 && disc <= 30000)
        {
            dis = 1;
        }
        else if (disc > 30000 && disc <= 50000)
        {
            dis = 1.5;
        }
        else if (disc > 50000 && disc <= 100000)
        {
            dis = 2;
        }
        else if(disc>100000)
        {
            dis = 3;
        }
        discount_update();
    }

    public void discount_update()
    {
        SortedList sl = new SortedList();
        sl.Add("@query", "Update discount");
        sl.Add("@Customer_ID", txtCustomerID.Text);
        sl.Add("@Discount",Convert.ToDouble(dis.ToString()));
        ERP.ExecuteNonQuerySP("customer_bal_sp", sl);
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
        int k = i * j;
        disc_count();
        lblPrice.Text = k.ToString();
        //lblDiscount.Text = 0.ToString();
        lblDiscount.Text = ((Convert.ToDouble(k)*Convert.ToDouble(lblDiscount.Text))/100).ToString();
        lblPayablePrice.Text = (Convert.ToInt32(lblPrice.Text) - Convert.ToInt32(lblDiscount.Text)).ToString();

    }
    
    public void disc_count()
    {
        SortedList sl = new SortedList();
        sl.Add("@Query", "Select1");
        sl.Add("@Customer_ID",txtCustomerID.Text);
        SqlDataReader dr = ERP.GetDataReaderSP("customer_bal_sp", sl);
        while (dr.Read())
        {
            lblDiscount.Text = dr["Discount"].ToString();
        }
    }
    
    protected void ddProductName_SelectedIndexChanged(object sender, EventArgs e)
    {
        SortedList sl = new SortedList();
        sl.Add("@query", "Select data");
        sl.Add("@Product_ID", ddProductName.SelectedItem.Value);
        SqlDataReader dr = ERP.GetDataReaderSP("stock_of_product_sp", sl);
        DataTable dt = new DataTable();
        dt.Load(dr);
        if (dt.Rows.Count > 0)
        {
            SortedList sl1 = new SortedList();
            sl1.Add("@query", "Select data");
            sl1.Add("@Product_ID", ddProductName.SelectedItem.Value);
            SqlDataReader dr2 = ERP.GetDataReaderSP("stock_of_product_sp", sl1);
            while (dr2.Read())
            {
                lblPerUnitPrice.Text = dr2["Unit_Sell_Price"].ToString();
            }
        }
        else
        {
            System.Windows.Forms.MessageBox.Show("This item is not available in stock");
        }
        

        /*SortedList sl1 = new SortedList();
        sl1.Add("@query", "Select code");
        sl1.Add("@Product_ID", ddProductName.SelectedItem.Value);
        SqlDataReader dr1 = ERP.GetDataReaderSP("product_stock_sp", sl1);
        DataTable dt = new DataTable();
        dt.Load(dr1);
        lblItemCode.Text = dt.Rows[0]["Item_Code"].ToString();*/
    }

    public void cust_data_entry()
    {
        SortedList sl = new SortedList();
        sl.Add("@query", "Select1");
        SqlDataReader dr = ERP.GetDataReaderSP("bill_temp_sp", sl);
        DataTable dt = new DataTable();
        dt.Load(dr);
        for (int p = 0; p < dt.Rows.Count; p++)
        {
            SortedList sl1 = new SortedList();
            sl1.Add("@query", "Insert1");
            sl1.Add("@Customer_ID",txtCustomerID.Text);
            sl1.Add("@Date1", System.DateTime.Now.ToShortDateString());
            sl1.Add("@Product_ID", dt.Rows[p]["Product_ID"]);
            sl1.Add("@Unit_Price", dt.Rows[p]["Unit_Price"]);
            sl1.Add("@Quantity", dt.Rows[p]["Quantity"]);
            sl1.Add("@Price", dt.Rows[p]["Price"]);
            sl1.Add("@Discount", dt.Rows[p]["Discount"]);
            sl1.Add("@Payable_Price", dt.Rows[p]["Payable_Price"]);
            sl1.Add("@Branch_ID", Session["Working_Branch_ID"].ToString());
            ERP.ExecuteNonQuerySP("bill_sp", sl1);
        }
        clear_grid();
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
            Session["Pro_ID"] = dt1.Rows[dt1.Rows.Count- n]["Product_ID"].ToString();
            SortedList sl = new SortedList();
            sl.Add("@query", "select stock");
            sl.Add("@Product_ID", Session["Pro_ID"]);
            SqlDataReader dr = ERP.GetDataReaderSP("stock_of_product_sp", sl);
            DataTable dt = new DataTable();
            dt.Load(dr);

            int avail_stock = Convert.ToInt32(dt.Rows[0]["Avail_Quantity"].ToString());
            int qty = Convert.ToInt32(dt1.Rows[dt.Rows.Count- n]["Quantity"].ToString());
            int fin = avail_stock - qty;
            SortedList sl1 = new SortedList();
            sl1.Add("@query", "Update stock");
            sl1.Add("@Product_ID", Session["Pro_ID"]);
            sl1.Add("@Avail_Quantity", fin);
            ERP.ExecuteNonQuerySP("stock_of_product_sp", sl1);
            n--;
        }        
    }

    public void payment()
    {
        SortedList sl1 = new SortedList();
        sl1.Add("@query", "Select2");
        sl1.Add("@Customer_ID", txtCustomerID.Text);
        SqlDataReader dr = ERP.GetDataReaderSP("customer_rc_sp", sl1);
        DataTable dt = new DataTable();
        dt.Load(dr);
        Session["DRC"] = dt.Rows[0]["RC_Date"];

        int avail_bal = Convert.ToInt32(lblAvailBalance.Text);
        int ben_bal = Convert.ToInt32(lblBenBal.Text);
        
        DateTime d1 = Convert.ToDateTime(Session["DRC"].ToString());
        DateTime d2 = Convert.ToDateTime(System.DateTime.Now.ToShortDateString());
        TimeSpan t1 = d1.Subtract(d2);
        
        rem_bal = avail_bal + ben_bal - Convert.ToInt32(Session["payable"]);        
        if (rem_bal > 0)
        {
            if (avail_bal > Convert.ToInt32(Session["payable"]))
            {
                SortedList sl = new SortedList();
                sl.Add("@query", "Update avail bal");
                sl.Add("@Customer_ID", txtCustomerID.Text);
                sl.Add("@Regular_Bal", rem_bal);
                ERP.ExecuteNonQuerySP("customer_bal_sp", sl);
            }
            else
            {
                ben_bal = ben_bal - (Convert.ToInt32(Session["payable"]) - avail_bal);
                SortedList sl2 = new SortedList();
                sl2.Add("@query", "Update new bal");
                sl2.Add("@Customer_ID", Session["Customer_ID"]);
                sl2.Add("@Regular_Bal", 0);
                sl2.Add("@Benifit_Bal", ben_bal);
                ERP.ExecuteNonQuerySP("customer_bal_sp", sl2);
            }
            
            cust_data_entry();
            payment_notify();
            payslip_generation();
        }
        else
        {
            System.Windows.Forms.MessageBox.Show("You have not sufficient balance for purchasing items" + "\n\n\nRecharge as soon as possible..and continue service.");
        }       
    }

    public void payslip_generation()
    {
        string htmlcode = "";
        htmlcode += "<h1 align=center class='mylabel' style='font-family:Monotype Corsiva;font-size:30px;color:white;background-color:black;'>Customer Payment Slip</h1>";
        //htmlcode += "<h2 align=center class='mylabel' style='font-family:Comic Sans MS;font-size:15px;'>Payslip for time Period " + lblFrom.Text + "&nbsp" + lblTo.Text + "</h2>";
        htmlcode += "<table width=97% class='mylabel' cellpadding=10 align=center>";
        htmlcode += "<tr><td colspan=2><hr></tr>";
        htmlcode += "<tr><tr><td align=right>Customer ID:</td><td>" + Session["Customer_ID"].ToString() + "</td></tr></tr>";
        htmlcode += "<tr><tr><td align=right>Customer Name:</td><td>" + lblName.Text + "</td></tr></tr>";
        htmlcode += "<tr><td align=right>Address:</td><td>" + lblAddress.Text + "</td></tr>";
        htmlcode += "<tr><td align=right>Email ID:</td><td>" + lblEmailID.Text + "</td></tr>";
        htmlcode += "<tr><td align=right>Contact No:</td><td>" + lblContactNo.Text + "</td></tr>";
        htmlcode += "<tr><td align=right>Date:</td><td>" + System.DateTime.Now.ToShortDateString() + "</td></tr>";
        htmlcode += "<tr><td align=right>Total bill:</td><td>" + lblTotalAmount.Text + "</td></tr>";
        //htmlcode += "<tr><td align=right style='font-weight:bold;border-top-style:solid;border-bottom-style:solid;border-top-color:black;border-bottom-color:black;'>Net Salary</td><td style='font-weight:bold;border-top-style:solid;border-bottom-style:solid;border-top-color:black;border-bottom-color:black;'>" + lblPaySalary.Text + "</td></tr>";
        htmlcode += "<tr><td align=right></td><td>&nbsp;</td></tr>";
        //htmlcode += "<tr><td align=right></td><td align=center style='font-weight:bold'>Signature of the<br>HOD<br>(Account Manager)</br></td>";
        htmlcode += "</table>";
        Session["htmlcodetoprint"] = htmlcode;
        Response.Write("<script language='javascript'>window.open('print.aspx','prn','toolbar=no,menubar=no,scrollbars=yes,location=no');</script>");
        Response.Redirect("print payslip.aspx");
    }
    /*
    public void print_slip()
    {
        string htmlcode = Convert.ToString(Session["htmlcodetoprint"]);
        Session["htmlcodetoprint"] = null;
        Response.Write(htmlcode);
        Response.Write("<script language='javascript'>window.print();</script>");
    }*/
    public void payment_notify()
    {
        try
        {
            string str= "Purchased amount :" + Session["payable"];
            rbal = "Remaining Balance :" + rem_bal.ToString();
            send("9737223368", "63641", str, rbal);
            // System.Windows.Forms.MessageBox.Show("Message Sent Successfully");
            //Response.Write("message send successfully......");
        }
        catch (Exception ex)
        {
            System.Windows.Forms.MessageBox.Show("Error Occured while sending SMS....!!!!");
            //Response.Write("Error Occured!!!");
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
        tot_am_show();
    }

    public void tot_am_show()
    {
        SortedList sl = new SortedList();
        sl.Add("@query", "Select2");
        SqlDataReader dr = ERP.GetDataReaderSP("bill_temp_sp", sl);
        DataTable dt = new DataTable();
        dt.Load(dr);
        int n = dt.Rows.Count;
        while (n > 0)
        {
            payable1 = payable1 + Convert.ToInt32(dt.Rows[dt.Rows.Count - 1]["Payable_Price"]);
            n--;
        }
        lblTotalAmount.Text = payable.ToString();
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
    protected void btnFingerPrint_Click(object sender, EventArgs e)
    {
        txtFingerPrint.Visible = true;
    }
    protected void btnSMS_Click(object sender, EventArgs e)
    {
        lblSMSCode.Visible = true;
        txtSMSCode.Visible = true;
        btnSend.Visible = true;
    }
    protected void btnSend_Click(object sender, EventArgs e)
    {
        try
        {
            send("9737223368", "63641", txtSMSCode.Text, lblContactNo.Text);
            // System.Windows.Forms.MessageBox.Show("Message Sent Successfully");
            //Response.Write("message send successfully......");

        }
        catch (Exception ex)
        {
            //System.Windows.Forms.MessageBox.Show("Error Occured....!!!!");
            Response.Write("Error Occured!!!");
        }
    }
}