using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Collections;

public partial class Leave : System.Web.UI.Page
{
    ERPStoreProcedure ERP = new ERPStoreProcedure();
    int i = 0;
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
        if (txtDate.Text.Equals(null))
        {
            DateTime d1 = Convert.ToDateTime(txtDateFrom.Text);
            DateTime d2 = Convert.ToDateTime(txtDateTo.Text);
            TimeSpan t1 = d2.Subtract(d1);
            i = Convert.ToInt32(t1.Days + 1);            
        }
        else
        {
            i = 1;
        }
    }
    
    protected void btnInsert_Click(object sender, EventArgs e)
    {
        SortedList sl = new SortedList();
        sl.Add("@query", "Insert1");
        sl.Add("@Leave_Sub",txtSubOfLeave.Text);
        sl.Add("@Leave_Type",ddType.SelectedItem.Value);
        sl.Add("@Leave_For",rbLeave.SelectedItem.Value);
        Label2.Text = rbLeave.SelectedItem.Value;
        sl.Add("@Date_From",txtDateFrom.Text);        
        sl.Add("@Date_To",txtDateTo.Text);        
        sl.Add("@Shift",rbShift.SelectedItem.Value);
        sl.Add("@Other_Detail",txtOtherDetails.Text);
        sl.Add("@Date1", txtDate.Text);        
        sl.Add("@Employee_ID", Session["Emp_ID"].ToString());
        string str = fuDocument.FileName;
        fuDocument.SaveAs(Server.MapPath("~/Upload/D")+str);
        sl.Add("@Document_Upload",str);
        leave_count();
        sl.Add("@Leave_Days", i.ToString());        
        int n = Convert.ToInt32(ERP.ExecuteNonQuerySP("leaveForm_sp", sl));
        grid_bind();
        //sub_man();
    }
    /*
    public void sub_man()
    {
        SqlDataReader dr = ERP.;
        DataTable dt = new DataTable();
        dt.Load(dr);
    }*/

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
        sl.Add("@Date1",txtDate.Text);
        
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
                txtSubOfLeave.Text=dr["Leave_Sub"].ToString();
                ddType.SelectedValue=dr["Leave_Type"].ToString();
                rbLeave.SelectedValue=dr["Leave_For"].ToString();
                txtDateFrom.Text=dr["Date_From"].ToString();
                txtDateTo.Text=dr["Date_To"].ToString();
                rbShift.SelectedValue=dr["Shift"].ToString();
                txtOtherDetails.Text = dr["Other_Detail"].ToString();
                txtDate.Text = dr["Date1"].ToString();
                ViewState["Leave_Form_ID"]=A;
                Session["A"]=dr["Document_Upload"].ToString();
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

    protected void rbLeave_SelectedIndexChanged(object sender, EventArgs e)
    {                    
    }

    public void leave()
    {
        Panel1.Visible = false;
        Panel2.Visible = false;
        Panel3.Visible = false;

        if (rbLeave.SelectedValue == "Full" || rbLeave.SelectedValue == "Half")
        {
            if (rbLeave.SelectedValue == "Full")
            {
                Panel1.Visible = true;
                Panel2.Visible = false;
                Panel3.Visible = false;
            }
            else
            {
                Panel1.Visible = true;
                Panel2.Visible = false;
                Panel3.Visible = true;           
            }
        }
        else if (rbLeave.SelectedValue == "More than 1 day")
        {
            Panel2.Visible = true;
            Panel1.Visible = false;
            Panel3.Visible = true;
        }
    }
}