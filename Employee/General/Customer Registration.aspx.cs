using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Collections;

public partial class Employee_General_Customer_Registration : System.Web.UI.Page
{
    ERPStoreProcedure ERP = new ERPStoreProcedure();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            country_bind();
            grid_bind();
        }
        lblMsg.Visible = false;
    }
    public void grid_bind()
    {
        SortedList sl = new SortedList();
        sl.Add("@query", "Select grid");
        GridView1.DataSource = ERP.GetDataReaderSP("cust_reg_sp", sl);
        GridView1.DataBind();

    }

    public void country_bind()
    {
        SortedList sl = new SortedList();
        sl.Add("@query", "Select grid");
        ddCountry.DataSource = ERP.GetDataReaderSP("country_sp", sl);
        ddCountry.DataTextField = "Country_Name";
        ddCountry.DataValueField = "Country_ID";
        ddCountry.DataBind();
        state_bind();

    }

    public void state_bind()
    {
        SortedList sl = new SortedList();
        sl.Add("@query", "Selectstate");
        sl.Add("@Country_ID", ddCountry.SelectedItem.Value);
        ddState.DataSource = ERP.GetDataReaderSP("state_sp", sl);
        ddState.DataTextField = "State_Name";
        ddState.DataValueField = "State_ID";
        ddState.DataBind();
        city_bind();
    }

    public void city_bind()
    {
        SortedList sl = new SortedList();
        sl.Add("@query", "Selectcity");
        sl.Add("@State_ID", ddState.SelectedItem.Value);
        ddCity.DataSource = ERP.GetDataReaderSP("city_sp", sl);
        ddCity.DataTextField = "City_Name";
        ddCity.DataValueField = "City_ID";
        ddCity.DataBind();
        branch_bind();
    }

    public void branch_bind()
    {
        SortedList sl = new SortedList();
        sl.Add("@query", "Selectbranch");
        sl.Add("@City_ID", ddCity.SelectedItem.Value);
        ddBranch.DataSource = ERP.GetDataReaderSP("branch_sp", sl);
        ddBranch.DataTextField = "Branch_Name";
        ddBranch.DataValueField = "Branch_ID";
        ddBranch.DataBind();
    }

    public void cust_acc_entry()
    {
        SortedList sl = new SortedList();
        sl.Add("@query", "Select ID");
        sl.Add("@Customer_ID", Session["Customer_ID"].ToString());
        SqlDataReader dr = ERP.GetDataReaderSP("fingerprint_sp", sl);
        DataTable dt = new DataTable();
        dt.Load(dr);
        string f_ID = dt.Rows[0]["Fingerprint_ID"].ToString();

        SortedList sl1 = new SortedList();
        sl1.Add("@query", "Select ID");
        sl1.Add("@Customer_ID", Session["Customer_ID"].ToString());
        SqlDataReader dr1 = ERP.GetDataReaderSP("RFID_sp", sl1);
        DataTable dt1 = new DataTable();
        dt1.Load(dr1);
        string RFID_ID = dt1.Rows[0]["RFID_ID"].ToString();

        SortedList sl2 = new SortedList();
        sl2.Add("@query", "Insert1");  
        sl2.Add("@Customer_ID", Session["Customer_ID"].ToString());
        sl2.Add("@Fingerprint_ID", f_ID.ToString());
        sl2.Add("@RFID_ID", RFID_ID.ToString());
        ERP.ExecuteNonQuerySP("cust_access_sp", sl2);

    }

    protected void btnInsert_Click(object sender, EventArgs e)
    {
        SortedList sl4 = new SortedList();
        sl4.Add("@query", "Count");
        sl4.Add("@Customer_Name", txtCustomerName.Text);
        sl4.Add("@Email_ID", txtEmailID.Text);
        sl4.Add("@Mob_No", txtMobileNo.Text);
        string count = ERP.ExecuteScalarSP("cust_reg_sp",sl4).ToString();
        if (count == "0")
        {
            SortedList sl = new SortedList();
            sl.Add("@query", "Insert1");
            sl.Add("@Customer_Name", txtCustomerName.Text);
            sl.Add("@Address", txtCustomerAddress.Text);
            sl.Add("@Gender", rbGender.SelectedItem.Value);
            sl.Add("@Marital_Status", rbMaritalStatus.SelectedItem.Value);
            sl.Add("@Country_ID", ddCountry.SelectedItem.Value);
            sl.Add("@State_ID", ddState.SelectedItem.Value);
            sl.Add("@City_ID", ddCity.SelectedItem.Value);
            sl.Add("@Branch_ID", ddBranch.SelectedItem.Value);
            sl.Add("@Pin_Code", txtPinCode.Text);
            sl.Add("@Contact_No", txtContact.Text);
            sl.Add("@Email_ID", txtEmailID.Text);
            sl.Add("@Mob_No", txtMobileNo.Text);
            sl.Add("@Occupation", txtOccupation.Text);
            sl.Add("@DOB", txtDOB.Text);
            sl.Add("@FingerPrint_ID", txtFingerprint.Text);
            int n = Convert.ToInt32(ERP.ExecuteNonQuerySP("cust_reg_sp", sl));
            grid_bind();
            lblMsg.Visible = false;
        }
        else
        {
            lblMsg.Visible = true;
            lblMsg.Text = "Already Exist";
        }

        SortedList sl3 = new SortedList();
        sl3.Add("@query","Select data");
        sl3.Add("@Customer_Name", txtCustomerName.Text);
        sl3.Add("@Email_ID", txtEmailID.Text);
        sl3.Add("@Mob_No", txtMobileNo.Text);
        SqlDataReader dr = ERP.GetDataReaderSP("cust_reg_sp",sl3);       
        while (dr.Read())
        {
            Session["Customer_ID"] = dr["Customer_ID"].ToString();
        }

        SortedList sl1 = new SortedList();
        sl1.Add("@query", "Insert1");
        sl1.Add("@Customer_ID",Session["Customer_ID"].ToString());
        sl1.Add("@Fingerprint", txtFingerprint.Text);
        ERP.ExecuteNonQuerySP("fingerprint_sp", sl1);

        SortedList sl2 = new SortedList();
        sl2.Add("@query", "Insert1");
        sl2.Add("@Customer_ID", Session["Customer_ID"].ToString());
        sl2.Add("@RFID_code", txtFingerprint.Text);
        ERP.ExecuteNonQuerySP("RFID_sp", sl2);

        cust_acc_entry();
    }
    protected void btnUpdate_Click(object sender, EventArgs e)
    {
        SortedList sl = new SortedList();
        sl.Add("@query", "Update1");
        sl.Add("Customer_ID", ViewState["Customer_ID"]);
        sl.Add("@Customer_Name", txtCustomerName.Text);
        sl.Add("@Address", txtCustomerAddress.Text);
        sl.Add("@Gender", rbGender.SelectedItem.Value);
        sl.Add("@Marital_Status", rbMaritalStatus.SelectedItem.Value);
        sl.Add("@Country_ID", ddCountry.SelectedItem.Value);
        sl.Add("@State_ID", ddState.SelectedItem.Value);
        sl.Add("@City_ID", ddCity.SelectedItem.Value);
        sl.Add("@Pin_Code", txtPinCode.Text);
        sl.Add("@Contact_No", txtContact.Text);
        sl.Add("@Email_ID", txtEmailID.Text);
        sl.Add("@Mob_No", txtMobileNo.Text);
        sl.Add("@Occupation", txtOccupation.Text);
        sl.Add("@DOB", txtDOB.Text);
        int n = Convert.ToInt32(ERP.ExecuteNonQuerySP("cust_reg_sp", sl));
        grid_bind();


    }
    protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "Editt")
        {
            SortedList sl = new SortedList();
            sl.Add("@query", "Select1");
            sl.Add("@Customer_ID", e.CommandArgument.ToString());
            SqlDataReader dr = ERP.GetDataReaderSP("cust_reg_sp", sl);
            while (dr.Read())
            {
                int A = Convert.ToInt32(dr["Customer_ID"].ToString());
                txtCustomerName.Text = dr["Customer_Name"].ToString();
                txtCustomerAddress.Text = dr["Address"].ToString();
                txtPinCode.Text = dr["Pin_Code"].ToString();
                ddCountry.SelectedValue = dr["Country_ID"].ToString();
                ddState.SelectedValue = dr["State_ID"].ToString();
                ddCity.SelectedValue = dr["City_ID"].ToString();
                ddBranch.SelectedValue = dr["Branch_ID"].ToString();
                txtContact.Text = dr["Contact_No"].ToString();
                txtMobileNo.Text = dr["Mob_No"].ToString();
                txtEmailID.Text = dr["Email_ID"].ToString();
                txtOccupation.Text = dr["Occupation"].ToString();
                rbGender.SelectedValue = dr["Gender"].ToString();
                rbMaritalStatus.SelectedValue = dr["Marital_Status"].ToString();
                txtDOB.Text = dr["DOB"].ToString();
                ViewState["Customer_ID"] = A;
            }
            grid_bind();
        }
        else
        {
            if (e.CommandName == "Deletee")
            {
                SortedList sl = new SortedList();
                sl.Add("@query", "Delete1");
                sl.Add("@Customer_ID", e.CommandArgument);
                ERP.ExecuteNonQuerySP("cust_reg_sp", sl);
                grid_bind();
            }
        }

    }
    protected void ddCountry_SelectedIndexChanged(object sender, EventArgs e)
    {
        state_bind();
    }
    protected void ddState_SelectedIndexChanged(object sender, EventArgs e)
    {
        city_bind();
    }
    protected void ddCity_SelectedIndexChanged(object sender, EventArgs e)
    {
        branch_bind();
    }
    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
}