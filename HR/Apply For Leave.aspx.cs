using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Collections;

public partial class Employee_Account_Apply_For_Leave : System.Web.UI.Page
{
    ERPStoreProcedure ERP = new ERPStoreProcedure();
    double i = 0;
    int temp = 0;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            leave_bind();
            grid_bind();
        }
        leave();

    }
    public void leave_bind()
    {
        SortedList sl = new SortedList();
        sl.Add("@query", "Select grid");
        ddType.DataSource = ERP.GetDataReaderSP("leave_sp", sl);
        ddType.DataTextField = "Leave_Type";
        ddType.DataValueField = "Leave_ID";
        ddType.DataBind();
    }

    public void grid_bind()
    {
        SortedList sl = new SortedList();
        sl.Add("@query", "Select grid");
        GridView1.DataSource = ERP.GetDataReaderSP("leaveForm_sp", sl);
        GridView1.DataBind();
    }

    public void leave_count()
    {
        if (rbLeave.SelectedItem.Value.Equals("More than 1 day"))
        {
            //string str1 = txtDateFrom.Text;
            Panel4.Visible = true;
            string dt1 = txtDateFrom.Text;            
            DateTime d1 = Convert.ToDateTime(dt1.ToString());
            string dt2 = txtDateTo.Text;
            DateTime d2 = Convert.ToDateTime(dt2.ToString());
            TimeSpan t1 = d2.Subtract(d1);
            i = Convert.ToDouble(t1.Days + 1);
        }
        else
        {
            if (rbLeave.SelectedItem.Value.Equals("Half"))
            {
                i = 0.50;
            }
            else
            {
                i = 1;
            }
        }
    }

    public void leave_check()
    {
        SortedList sl = new SortedList();
        sl.Add("@query", "Select emp data");
        sl.Add("@Employee_ID", Session["Employee_ID"]);
        SqlDataReader dr = ERP.GetDataReaderSP("Emp_ls_sp", sl);
        DataTable dt = new DataTable();
        dt.Load(dr);
        int st1 = Convert.ToInt32(dt.Rows[0]["ML"]);
        int st2 = Convert.ToInt32(dt.Rows[0]["PL"]);
        int st3 = Convert.ToInt32(dt.Rows[0]["CL"]);
        if (ddType.SelectedItem.Value.ToString().Equals("7"))
        {
            if (i > st1)
            {
                temp = 1;
            }
        }
        else if (ddType.SelectedItem.Value.ToString().Equals("8"))
        {
            if (i > st1)
            {
                temp = 1;
            }
        }
        else if (ddType.SelectedItem.Value.ToString().Equals("9"))
        {
            if (i > st1)
            {
                temp = 1;
            }
        }
    }

    protected void btnInsert_Click(object sender, EventArgs e)
    {
        leave_count();
        leave_check();
        SortedList sl = new SortedList();
        sl.Add("@query", "Insert1");
        sl.Add("@Leave_Sub", txtSubOfLeave.Text);
        sl.Add("@Leave_Type", ddType.SelectedItem.Value);
        sl.Add("@Leave_For", rbLeave.SelectedItem.Value);
        sl.Add("@Date_From", txtDateFrom.Text);
        sl.Add("@Date_To", txtDateTo.Text);
        sl.Add("@Shift", rbShift.SelectedItem.Value);
        sl.Add("@Other_Detail", txtOtherDetails.Text);
        sl.Add("@Date1", txtDate.Text);
        sl.Add("@Employee_ID", Session["Employee_ID"].ToString());
        string str = fuDocument.FileName;
        fuDocument.SaveAs(Server.MapPath("~/Upload/D") + str);
        sl.Add("@Document_Upload", str);
        Session["Temp"] = txtDate.Text;
        
        sl.Add("@Leave_Days", i.ToString());
        int n = Convert.ToInt32(ERP.ExecuteNonQuerySP("leaveForm_sp", sl));
        grid_bind();
        //clear();
        //sub_man();

    }
    protected void btnUpdate_Click(object sender, EventArgs e)
    {
        SortedList sl = new SortedList();
        sl.Add("@query", "Update1");
        sl.Add("@Leave_Form_ID", ViewState["Leave_Form_ID"]);
        sl.Add("@Leave_Sub", txtSubOfLeave.Text);
        sl.Add("@Leave_Type", ddType.SelectedItem.Value);
        sl.Add("@Leave_For", rbLeave.SelectedItem.Value);
        sl.Add("@Date_From", txtDateFrom.Text);
        sl.Add("@Date_To", txtDateTo.Text);
        sl.Add("@Shift", rbShift.SelectedItem.Value);
        sl.Add("@Other_Detail", txtOtherDetails.Text);
        sl.Add("@Date1", txtDate.Text);

        if (fuDocument.HasFile)
        {
            string str = fuDocument.FileName;
            fuDocument.SaveAs(Server.MapPath("~/Upload/D") + str);
            sl.Add("@Document_Upload", str);
        }
        else
        {
            sl.Add("@Document_Upload", Session["A"]);
        }

        int n = Convert.ToInt32(ERP.ExecuteNonQuerySP("leaveForm_sp", sl));
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
            sl.Add("@Leave_Form_ID", e.CommandArgument.ToString());
            SqlDataReader dr = ERP.GetDataReaderSP("leaveForm_sp", sl);
            while (dr.Read())
            {
                int A = Convert.ToInt32(dr["Leave_Form_ID"].ToString());
                txtSubOfLeave.Text = dr["Leave_Sub"].ToString();
                ddType.SelectedValue = dr["Leave_Type"].ToString();
                rbLeave.SelectedValue = dr["Leave_For"].ToString();
                txtDateFrom.Text = dr["Date_From"].ToString();
                txtDateTo.Text = dr["Date_To"].ToString();
                rbShift.SelectedValue = dr["Shift"].ToString();
                txtOtherDetails.Text = dr["Other_Detail"].ToString();
                txtDate.Text = dr["Date1"].ToString();
                ViewState["Leave_Form_ID"] = A;
                Session["A"] = dr["Document_Upload"].ToString();
                Label1.Text = dr["Document_Upload"].ToString();
                Label1.Visible = true;
            }
            grid_bind();
        }
        else
        {
            if (e.CommandName == "Deletee")
            {
                SortedList sl = new SortedList();
                sl.Add("@query", "Delete1");
                sl.Add("@Leave_Form_ID", e.CommandArgument);
                ERP.ExecuteNonQuerySP("leaveForm_sp", sl);
                grid_bind();
            }
        }
    }
    public void leave()
    {
        Panel3.Visible = false;
        Panel4.Visible = false;
        Panel3.Visible = false;

        if (rbLeave.SelectedValue == "Full" || rbLeave.SelectedValue == "Half")
        {
            Panel3.Visible = true;
            Panel4.Visible = false;

            /*if (rbLeave.SelectedValue == "Full")
            {
                Panel3.Visible = true;
                Panel4.Visible = false;
                
            }
            else
            {
                Panel3.Visible = true;
                Panel4.Visible = false;
                
            }*/
        }
        else if (rbLeave.SelectedValue == "More than 1 day")
        {
            Panel4.Visible = true;
            Panel3.Visible = false;

        }
    }
    protected void rbLeave_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
}