using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Collections;

public partial class Super_Admin_Schemes_Master : System.Web.UI.Page
{
    ERPStoreProcedure ERP = new ERPStoreProcedure();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            city_bind();
        }
        grid_bind();
        lblMessage.Visible = false;
    }
    public void grid_bind()
    {
        SortedList sl = new SortedList();
        sl.Add("@query", "Select grid");
        GridView1.DataSource = ERP.GetDataReaderSP("Schemes_master_sp", sl);
        GridView1.DataBind();
    }
    public void city_bind()
    {
        SortedList sl = new SortedList();
        sl.Add("@query", "Select grid");
        ddCityName.DataSource = ERP.GetDataReaderSP("city_sp", sl);
        ddCityName.DataTextField = "City_Name";
        ddCityName.DataValueField = "City_ID";
        ddCityName.DataBind();
    }

    public void B_Amount()
    {
        int i = Convert.ToInt32(txtRechargeAmount.Text);
        int j = Convert.ToInt32(txtBenificialAmount.Text);
        int k = j - i;
        lblBenifit.Text = k.ToString();
    }
    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        SortedList sl1 = new SortedList();
        sl1.Add("@query", "Count");
        sl1.Add("@City_ID", ddCityName.SelectedItem.Value);
        sl1.Add("@Recharge_Amount", txtRechargeAmount.Text);
        sl1.Add("@Date_From", txtDateFrom.Text);
        sl1.Add("@Date_To", txtDateTo.Text);
        string count = ERP.ExecuteScalarSP("Schemes_master_sp", sl1).ToString();
        if (count == "0")
        {
            SortedList sl = new SortedList();
            sl.Add("@query", "Insert1");
            sl.Add("@City_ID", ddCityName.SelectedItem.Value);
            sl.Add("@Recharge_Amount", txtRechargeAmount.Text);
            sl.Add("@Benificial_Amount", txtBenificialAmount.Text);
            sl.Add("@Date_From", txtDateFrom.Text);
            sl.Add("@Date_To", txtDateTo.Text);
            sl.Add("@After_Expiration", txtAfterExpiration.Text);
            ERP.ExecuteNonQuerySP("Schemes_master_sp", sl);
            grid_bind();
        }
        else
        {
            lblMessage.Visible = true;
            lblMessage.Text = "Already exist";
        }
    }
    protected void btnCancel_Click(object sender, EventArgs e)
    {
        SortedList sl = new SortedList();
        sl.Add("@query", "Update1");
        sl.Add("@Schemes_ID", ViewState["Schemes_ID"]);
        sl.Add("@City_ID", ddCityName.SelectedItem.Value);
        sl.Add("@Recharge_Amount", txtRechargeAmount.Text);
        sl.Add("@Benificial_Amount", txtBenificialAmount.Text);
        sl.Add("@Date_From", txtDateFrom.Text);
        sl.Add("@Date_To", txtDateTo.Text);
        sl.Add("@After_Expiration", txtAfterExpiration.Text);
        ERP.ExecuteNonQuerySP("Schemes_master_sp", sl);
        grid_bind();
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
            sl.Add("@Schemes_ID", e.CommandArgument.ToString());
            SqlDataReader dr = ERP.GetDataReaderSP("Schemes_master_sp", sl);
            while (dr.Read())
            {
                int A = Convert.ToInt32(dr["Schemes_ID"].ToString());
                ddCityName.SelectedValue = dr["City_ID"].ToString();
                txtRechargeAmount.Text = dr["Recharge_Amount"].ToString();
                txtBenificialAmount.Text = dr["Benificial_Amount"].ToString();
                txtDateFrom.Text = dr["Date_From"].ToString();
                txtDateTo.Text = dr["Date_To"].ToString();
                txtAfterExpiration.Text = dr["After_Expiration"].ToString();
                ViewState["Schemes_ID"] = A;
                B_Amount();
            }
            grid_bind();
        }
        else
        {
            if (e.CommandName == "Deletee")
            {
                SortedList sl = new SortedList();
                sl.Add("@query", "Delete1");
                sl.Add("@Schemes_ID", e.CommandArgument);
                ERP.ExecuteNonQuerySP("Schemes_master_sp", sl);
                grid_bind();
            }
        }
    }
    protected void txtBenificialAmount_TextChanged(object sender, EventArgs e)
    {
        B_Amount();    
    }
}