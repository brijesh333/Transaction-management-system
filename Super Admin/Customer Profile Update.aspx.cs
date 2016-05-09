using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Collections;

public partial class Employee_General_Customer_Profile_Update : System.Web.UI.Page
{
    ERPStoreProcedure ERP = new ERPStoreProcedure();
    protected void Page_Load(object sender, EventArgs e)
    {
        Panel1.Visible = false;
        if (!IsPostBack)
        {
            country_bind();
        }
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
    protected void btnProceed_Click(object sender, EventArgs e)
    {
        SortedList sl = new SortedList();
        sl.Add("@query", "Select1");
        sl.Add("@Customer_ID", txtCustomerID.Text);
        SqlDataReader dr = ERP.GetDataReaderSP("cust_reg_sp", sl);
        /*DataTable dt = new DataTable();
        dt.Load(dr);        */
        if (dr.HasRows)
        {
            while (dr.Read())
            {
                Panel1.Visible = true;
                int A = Convert.ToInt32(dr["Customer_ID"]);
                lblCustomerName.Text = dr["Customer_Name"].ToString();
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
                ViewState["Customer_ID"] = A;
            }            
        }
        else
        {
            System.Windows.Forms.MessageBox.Show("This ID is not available or not yet registered");
        }      
    }
    protected void ddCountry_SelectedIndexChanged(object sender, EventArgs e)
    {
        state_bind();
    }
    protected void btnUpdate_Click(object sender, EventArgs e)
    {
        SortedList sl = new SortedList();
        sl.Add("@Query", "Update profile");
        sl.Add("@Customer_ID", ViewState["Customer_ID"]);
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
        int n = Convert.ToInt32(ERP.ExecuteNonQuerySP("cust_reg_sp", sl));
    }
    protected void ddState_SelectedIndexChanged(object sender, EventArgs e)
    {
        city_bind();
    }
    protected void ddCity_SelectedIndexChanged(object sender, EventArgs e)
    {
        branch_bind();
    }
}