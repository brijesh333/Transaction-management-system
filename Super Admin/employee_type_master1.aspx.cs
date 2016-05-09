using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Collections;

public partial class employee_type_master1 : System.Web.UI.Page
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
        GridView1.DataSource = ERP.GetDataReaderSP("emp_type_sp", sl);
        GridView1.DataBind();
    }

    protected void btnInsert_Click(object sender, EventArgs e)
    {
        SortedList sl = new SortedList();
        sl.Add("@query", "Count");
        sl.Add("@Emp_Type", txtEmp_Type.Text);
        string count = ERP.ExecuteScalarSP("emp_type_sp", sl).ToString();
        Label1.Visible = false;
        if (count == "0")
        {
            SortedList sl1 = new SortedList();
            sl1.Add("@query", "Insert1");
            sl1.Add("@Emp_Type", txtEmp_Type.Text);
            sl1.Add("@Description", txtDescription.Text);
            int n = Convert.ToInt32(ERP.ExecuteNonQuerySP("emp_type_sp", sl1));
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
        sl1.Add("@Emp_Type_ID", ViewState["Emp_Type_ID"]);
        sl1.Add("@Emp_Type", txtEmp_Type.Text);
        sl1.Add("@Description", txtDescription.Text);
        int n = Convert.ToInt32(ERP.ExecuteNonQuerySP("emp_type_sp", sl1));
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
            sl.Add("@Emp_Type_ID", e.CommandArgument.ToString());
            SqlDataReader dr = ERP.GetDataReaderSP("emp_type_sp", sl);
            while (dr.Read())
            {
                int A = Convert.ToInt32(dr["Emp_Type_ID"].ToString());
                txtEmp_Type.Text = dr["Emp_Type"].ToString();
                txtDescription.Text = dr["Description"].ToString();
                ViewState["Emp_Type_ID"] = A;

            }
            grid_bind();
        }
        else
        {
            if (e.CommandName == "Deletee")
            {
                SortedList sl = new SortedList();
                sl.Add("@query", "Delete1");
                sl.Add("@Emp_Type_ID", e.CommandArgument);
                ERP.ExecuteNonQuerySP("emp_type_sp", sl);
                grid_bind();
            }
        }
    }
}