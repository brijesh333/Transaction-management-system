using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Collections;

public partial class Employee_General_Customer_Recharge_Form : System.Web.UI.Page
{
    int fl = 0,total=0,am=0,ra=0;
    double ba=0,a=0,b=0;
    ERPStoreProcedure ERP = new ERPStoreProcedure();
    string ben_amount="",date_from="",date_to="";
    protected void Page_Load(object sender, EventArgs e)
    {
        grid_bind();
        GridView1.Visible = false;
        lblSchemes.Visible = false;
        ddSchemes.Visible = false;
        if (!IsPostBack)
        {
            schema_bind();
        }
        
    }
    public void grid_bind()
    {
        SortedList sl = new SortedList();
        sl.Add("@query", "Select schemes");
        sl.Add("@City_ID", Session["City_ID"].ToString());
        GridView1.DataSource = ERP.GetDataReaderSP("Schemes_master_sp", sl);
        GridView1.DataBind();        
    }
    public void schema_bind()
    {
        SortedList sl = new SortedList();
        sl.Add("@query", "Select schemes");
        sl.Add("@City_ID", Session["City_ID"]);
        ddSchemes.DataSource = ERP.GetDataReaderSP("Schemes_master_sp", sl);
        ddSchemes.DataTextField = "Schemes_ID";
        ddSchemes.DataValueField = "Schemes_ID";
        ddSchemes.DataBind();
    }
    public void rc_amount_check()
    {
        SortedList sl1 = new SortedList();
        sl1.Add("@query", "Select2");
        sl1.Add("@Customer_ID", txtCustomerID.Text);
        SqlDataReader dr = ERP.GetDataReaderSP("customer_rc_sp", sl1);
        DataTable dt = new DataTable();
        dt.Load(dr);
        int k = dt.Rows.Count;
        while (k>0)
        {
            total = total + Convert.ToInt32(dt.Rows[k]["RC_Amount"].ToString());
        }

    }

    public void schema_fetch()
    {        
        SortedList sl = new SortedList();
        sl.Add("@query", "Scheam fetch");
        sl.Add("@City_ID", Session["City_ID"].ToString());
        sl.Add("@Recharge_Amount",txtRechargeAmount.Text);        
        SqlDataReader dr = ERP.GetDataReaderSP("Schemes_master_sp", sl);
        DataTable dt = new DataTable();
        dt.Load(dr);
        if (dt.Rows.Count == 0)
        {

        }
        else
        {
            for(int i=0;i<dt.Rows.Count;i++)
            {
                DateTime date_from = Convert.ToDateTime(dt.Rows[i]["Date_From"]);
                Session["DF"] = dt.Rows[i]["Date_From"];
                DateTime date_to = Convert.ToDateTime(dt.Rows[i]["Date_To"]);
                Session["DT"] = dt.Rows[i]["Date_To"];
                TimeSpan df = date_to.Subtract(date_from);
                int n = Convert.ToInt32(df.Days + 1);
                DateTime td = Convert.ToDateTime(System.DateTime.Now.ToShortDateString());
                TimeSpan t = td.Subtract(date_from);
                int k = Convert.ToInt32(t.Days + 1);
                if (n > k && k >= 0)
                {
                    fl = 1;
                    a = Convert.ToDouble(dt.Rows[i]["Benificial_Amount"]);
                    b = Convert.ToDouble(dt.Rows[i]["Recharge_Amount"]);
                    ba = b - a;
                    Session["Schemes_ID"] = dt.Rows[i]["Schemes_ID"].ToString();
                }
            }
        }
    }

    public void ben_amount_fetch()
    {
        SortedList sl = new SortedList();
        sl.Add("@query", "Select data");
        sl.Add("@Schemes_ID", ddSchemes.SelectedItem.Value);
        SqlDataReader dr = ERP.GetDataReaderSP("Schemes_master_sp", sl);
        DataTable dt = new DataTable();
        dt.Load(dr);
        am = Convert.ToInt32(dt.Rows[0]["Benificial_Amount"]) - Convert.ToInt32(dt.Rows[0]["Recharge_Amount"]);
        Session["DF"] = dt.Rows[0]["Date_From"];
        Session["DT"] = dt.Rows[0]["Date_To"];
        ra = Convert.ToInt32(dt.Rows[0]["Recharge_Amount"]);
    }
    
    public void cust_rc_entry()
    {
        ben_amount_fetch();
        SortedList sl1 = new SortedList();
        sl1.Add("@query", "Select2");
        sl1.Add("@Customer_ID", txtCustomerID.Text);
        SqlDataReader dr = ERP.GetDataReaderSP("customer_rc_sp", sl1);
        DataTable dt = new DataTable();
        dt.Load(dr);
        if (dt.Rows.Count == 0)
        {
            SortedList sl = new SortedList();
            sl.Add("@query", "Insert1");
            sl.Add("@Customer_ID", txtCustomerID.Text);
            sl.Add("@RC_Date", System.DateTime.Now.ToShortDateString());
            sl.Add("@RC_Branch_ID", Session["Working_Branch_ID"].ToString());
            sl.Add("@Schemes_ID", ddSchemes.SelectedItem.Value);
            sl.Add("@RC_Amount", txtRechargeAmount.Text);
            string nisala = txtRechargeAmount.Text;
            if (nisala.ToString().Equals(ra.ToString()))
            {
                sl.Add("@RC_Benifit_Amount", am);
            }
            else
            {
                sl.Add("@RC_Benifit_Amount", 0);
            }            
            ERP.ExecuteNonQuerySP("customer_rc_sp", sl);
        }
        else
        {
            SortedList sl = new SortedList();
            sl.Add("@query", "Insert1");
            sl.Add("@Customer_ID", txtCustomerID.Text);
            sl.Add("@RC_Date", System.DateTime.Now.ToShortDateString());
            sl.Add("@RC_Branch_ID", Session["Working_Branch_ID"].ToString());
            sl.Add("@Schemes_ID", 0);
            sl.Add("@RC_Amount", txtRechargeAmount.Text);
            sl.Add("@RC_Benifit_Amount", 0);
            ERP.ExecuteNonQuerySP("customer_rc_sp", sl);

        }
    }

    protected void btnSubmit_Click(object sender, EventArgs e)
    {        
        SortedList sl = new SortedList();
        sl.Add("@query","Select1");
        sl.Add("@Customer_ID",txtCustomerID.Text);
        SqlDataReader dr = ERP.GetDataReaderSP("customer_bal_sp", sl);
        DataTable dt = new DataTable();
        dt.Load(dr);                
        if (dt.Rows.Count == 0)
        {
            SortedList sl1 = new SortedList();
            sl1.Add("@query", "Insert1");
            sl1.Add("@Customer_ID", txtCustomerID.Text);
            sl1.Add("@Regular_Bal", txtRechargeAmount.Text);
            sl1.Add("@Benifit_Bal", ba);
        }           
        else
        {
            double avail_bal = Convert.ToInt32( dt.Rows[0]["Regular_Bal"]);
            double ben_amount = Convert.ToInt32(dt.Rows[0]["Benifit_Bal"]);
            double new_bal = avail_bal + Convert.ToInt32(txtRechargeAmount.Text);
            double new_bbal = ben_amount + ba;
            SortedList sl2 = new SortedList();
            sl2.Add("@query", "Update1");
            sl2.Add("@Customer_ID",txtCustomerID.Text);
            sl2.Add("@Regular_Bal",new_bal);            
            ERP.ExecuteNonQuerySP("cust_bal_sp", sl2);            
        }
        //lblAvailableBalance.Text = dt.Rows[0]["Regular_Bal"].ToString();
        cust_rc_entry();
        schema_fetch();        
    }

    protected void btnProceed_Click(object sender, EventArgs e)
    {
        SortedList sl1 = new SortedList();
        sl1.Add("@query", "Select2");
        sl1.Add("@Customer_ID", txtCustomerID.Text);
        SqlDataReader dr1 = ERP.GetDataReaderSP("customer_rc_sp", sl1);
        DataTable dt1 = new DataTable();
        dt1.Load(dr1);
        if (dt1.Rows.Count == 0)
        {
            GridView1.Visible = true;
            lblSchemes.Visible = true;
            ddSchemes.Visible = true;            
        }
        else
        {
            GridView1.Visible = false;
            lblSchemes.Visible = false;
            ddSchemes.Visible = false;
        }
        
        SortedList sl = new SortedList();
        sl.Add("@query", "Select1");
        sl.Add("@Customer_ID", txtCustomerID.Text);
        SqlDataReader dr = ERP.GetDataReaderSP("cust_reg_sp", sl);
        while (dr.Read())
        {
            lblCustomerName.Text = dr["Customer_Name"].ToString();
            lblCustomerAddress.Text = dr["Address"].ToString();
            lblRegBranch.Text = dr["Branch_Name"].ToString();
        }
        /*
        SortedList sl2 = new SortedList();
        sl2.Add("@query", "Select1");
        sl2.Add("@Customer_ID", txtCustomerID.Text);
        SqlDataReader dr2 = ERP.GetDataReaderSP("cust_bal_sp", sl2);
        DataTable dt2 = new DataTable();
        dt2.Load(dr2);
        lblAvailableBalance.Text = dt2.Rows[0]["Regular_Bal"].ToString();
         */
    }
    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
    protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
    {

    }
    protected void ddSchemes_SelectedIndexChanged(object sender, EventArgs e)
    {
        
    }
}