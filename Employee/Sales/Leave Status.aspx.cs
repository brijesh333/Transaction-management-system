using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Collections;
public partial class employee_leave_status : System.Web.UI.Page
{
    ERPStoreProcedure ERP = new ERPStoreProcedure();
    protected void Page_Load(object sender, EventArgs e)
    {
        data_bind();
    }
    public void data_bind()
    {
        SortedList sl = new SortedList();
        sl.Add("@query", "Select for l_status");
        sl.Add("@Employee_ID",Session["Employee_ID"]);
        SqlDataReader dr = ERP.GetDataReaderSP("emp_reg_sp",sl);
        while (dr.Read())
        {
            Label1.Text = dr["Full_Name"].ToString();
            Label2.Text = dr["Department_Name"].ToString();
            Label3.Text = dr["Designation"].ToString();
            Label4.Text = dr["DOJ"].ToString();
            Label8.Text = dr["ML"].ToString();
            Label9.Text = dr["PL"].ToString();
            Label10.Text = dr["CL"].ToString();            
        }
    }
}