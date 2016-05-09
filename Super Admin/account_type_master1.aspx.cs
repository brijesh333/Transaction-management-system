using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Collections;

public partial class account_type_master1 : System.Web.UI.Page
{
    ERPStoreProcedure ERP = new ERPStoreProcedure();
    protected void Page_Load(object sender, EventArgs e)
    {

        grid_bind();
    }
    public void grid_bind()
    {
        SortedList sl = new SortedList();
        sl.Add("@query", "Select grid");
        GridView1.DataSource = ERP.GetDataReaderSP("acc_type_sp", sl);
        GridView1.DataBind();
    }

    protected void txtAccountName_TextChanged(object sender, EventArgs e)
    {

    }
    protected void btnInsert_Click(object sender, EventArgs e)
    {
        SortedList sl = new SortedList();
        sl.Add("@query", "Count");
        sl.Add("@Acc_Type", txtAccountType.Text);
        sl.Add("@Acc_Description", txtAccountDes.Text);
        string count = ERP.ExecuteScalarSP("acc_type_sp", sl).ToString();
        Label1.Visible = false;
        if (count == "0")
        {
            SortedList sl1 = new SortedList();
            sl1.Add("@query", "Insert1");
            sl1.Add("@Acc_Type", txtAccountType.Text);
            sl1.Add("@Acc_Description", txtAccountDes.Text);
            int n = Convert.ToInt32(ERP.ExecuteNonQuerySP("acc_type_sp", sl1));
            Label1.Visible = false;
            grid_bind();
        }
        else
        {
            Label1.Text = "Already Exist";
            Label1.Visible = true;
        }

    }
    protected void btnUpdate_Click(object sender, EventArgs e)
    {
        SortedList sl1 = new SortedList();
        sl1.Add("@query", "Update1");
        sl1.Add("@Acc_Type_ID", ViewState["Acc_Type_ID"]);
        sl1.Add("@Acc_Type", txtAccountType.Text);
        sl1.Add("@Acc_Description", txtAccountDes.Text);
        int n = Convert.ToInt32(ERP.ExecuteNonQuerySP("acc_type_sp", sl1));
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
            sl.Add("@Acc_Type_ID", e.CommandArgument.ToString());
            SqlDataReader dr = ERP.GetDataReaderSP("acc_type_sp", sl);
            while (dr.Read())
            {
                int A = Convert.ToInt32(dr["Acc_Type_ID"].ToString());
                txtAccountType.Text = dr["Acc_Type"].ToString();
                txtAccountDes.Text = dr["Acc_Description"].ToString();
                ViewState["Acc_Type_ID"] = A;

            }
            grid_bind();
        }
        else
        {
            if (e.CommandName == "Deletee")
            {
                SortedList sl = new SortedList();
                sl.Add("@query", "Delete1");
                sl.Add("@Acc_Type_ID", e.CommandArgument);
                ERP.ExecuteNonQuerySP("acc_type_sp", sl);
                grid_bind();
            }
        }

    }
}