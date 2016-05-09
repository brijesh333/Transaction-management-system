using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Collections;

public partial class Branch_Main_Master1 : System.Web.UI.Page
{
    ERPStoreProcedure ERP = new ERPStoreProcedure();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            Panel1.Visible = false;
            country_bind();
            department_bind();
            grid_bind();
        }
    }

    public void country_bind()
    {
        SortedList sl = new SortedList();
        sl.Add("@query", "Select grid");
        ddCountryName.DataSource = ERP.GetDataReaderSP("country_sp", sl);
        ddCountryName.DataTextField = "Country_Name";
        ddCountryName.DataValueField = "Country_ID";
        ddCountryName.DataBind();
        state_bind();
    }

    public void state_bind()
    {
        SortedList sl = new SortedList();
        sl.Add("@query", "Selectstate");
        sl.Add("@Country_ID", ddCountryName.SelectedItem.Value);
        ddStateName.DataSource = ERP.GetDataReaderSP("state_sp", sl);
        ddStateName.DataTextField = "State_Name";
        ddStateName.DataValueField = "State_ID";
        ddStateName.DataBind();
        city_bind();
    }

    public void city_bind()
    {
        SortedList sl = new SortedList();
        sl.Add("@query", "Selectcity");
        sl.Add("@State_ID", ddStateName.SelectedItem.Value);
        ddCityName.DataSource = ERP.GetDataReaderSP("city_sp", sl);
        ddCityName.DataTextField = "City_Name";
        ddCityName.DataValueField = "City_ID";
        ddCityName.DataBind();
        branch_bind();
    }

    public void branch_bind()
    {
        SortedList sl = new SortedList();
        sl.Add("@query", "Selectbranch");
        sl.Add("@City_ID", ddCityName.SelectedItem.Value);
        ddBranchName.DataSource = ERP.GetDataReaderSP("branch_sp", sl);
        ddBranchName.DataTextField = "Branch_Name";
        ddBranchName.DataValueField = "Branch_ID";
        ddBranchName.DataBind();
    }

    public void department_bind()
    {
        SortedList sl = new SortedList();
        sl.Add("@query", "Select grid");
        ddDepartment.DataSource = ERP.GetDataReaderSP("department_sp", sl);
        ddDepartment.DataTextField = "Department_Name";
        ddDepartment.DataValueField = "Department_ID";
        ddDepartment.DataBind();
        designation_bind();
    }

    public void designation_bind()
    {
        SortedList sl = new SortedList();
        sl.Add("@query", "Select Department");
        sl.Add("Department_ID", ddDepartment.SelectedItem.Value);
        ddDesignation.DataSource = ERP.GetDataReaderSP("designation_sp", sl);
        ddDesignation.DataTextField = "Designation";
        ddDesignation.DataValueField = "Designation_ID";
        ddDesignation.DataBind();
    }

    public void p_clear()
    {
        for (int i = 0; i < cbFacilities.Items.Count; i++)
        {
            cbFacilities.Items[i].Selected = false;
        }
    }

    public void q_clear()
    {
        for (int i = 0; i < cbDealsInProduct.Items.Count; i++)
        {
            cbDealsInProduct.Items[i].Selected = false;
        }
    }

    public void grid_bind()
    {
        SortedList sl = new SortedList();
        sl.Add("@query", "Select grid");
        GridView1.DataSource = ERP.GetDataReaderSP("branch_main_sp", sl);
        GridView1.DataBind();
    }

    public void next_page()
    {
        TabContainer1.ActiveTabIndex = TabContainer1.ActiveTabIndex + 1;
    }

    public void previous_page()
    {
        TabContainer1.ActiveTabIndex = TabContainer1.ActiveTabIndex - 1;
    }

    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        SortedList sl1 = new SortedList();
        sl1.Add("@query", "Count");
        sl1.Add("@Country_ID", ddCountryName.SelectedItem.Value);
        sl1.Add("@State_ID", ddStateName.SelectedItem.Value);
        sl1.Add("@City_ID", ddCityName.SelectedItem.Value);
        sl1.Add("@Branch_ID", ddBranchName.SelectedItem.Value);
        sl1.Add("@Branch_Shop_Name", txtBranchShopName.Text);
        string count = ERP.ExecuteScalarSP("branch_main_sp", sl1).ToString();
        Label3.Visible = false;
        if (count == "0")
        {
            SortedList sl = new SortedList();
            sl.Add("@query", "Insert1");
            sl.Add("@Country_ID", ddCountryName.SelectedItem.Value);
            sl.Add("@State_ID", ddStateName.SelectedItem.Value);
            sl.Add("@City_ID", ddCityName.SelectedItem.Value);
            sl.Add("@Branch_ID", ddBranchName.SelectedItem.Value);
            sl.Add("@Branch_Shop_Name", txtBranchShopName.Text);
            sl.Add("@Address", txtAddress.Text);
            sl.Add("@Contact_Person_Name", txtContactPersonName.Text);
            sl.Add("@Conatct_Person_No", txtCPContactNo.Text);
            sl.Add("@Department_ID", ddDepartment.SelectedItem.Value);
            sl.Add("@Designation_ID", ddDesignation.SelectedItem.Value);
            sl.Add("@Email_ID", txtEmailID.Text);
            sl.Add("@Website", txtWebsite.Text);
            sl.Add("@Established_Year", txtEstablishedYear.Text);
            sl.Add("@Govt_Reg_Detail", txtGovtRegDetail.Text);
            sl.Add("@Ownership", rblOwnership.SelectedItem.Value);
            sl.Add("@Rent_Charges", txtRentCharges.Text);
            sl.Add("@Deposite", txtDeposite.Text);
            sl.Add("@Rented_From", txtRentedFrom.Text);
            sl.Add("@Rented_To", txtRentedTo.Text);
            sl.Add("@Original_Owner_Name", txtOriginalOwnerName.Text);
            sl.Add("@Original_Owner_Contact", txtOriginalOwnerContact.Text);
            for (int i = 0; i < cbFacilities.Items.Count - 1; i++)
            {
                if (cbFacilities.Items[i].Selected)
                {
                    Label1.Text += cbFacilities.Items[i].Text + ",";
                }
            }
            sl.Add("@Facilities", Label1.Text);
            sl.Add("@Working_From", txtWorkingFrom.Text);
            sl.Add("@Working_To", txtWorkingTo.Text);
            for (int i = 0; i < cbDealsInProduct.Items.Count - 1; i++)
            {
                if (cbDealsInProduct.Items[i].Selected)
                {
                    Label2.Text += cbDealsInProduct.Items[i].Text + ",";
                }

            }
            sl.Add("@Deals_Product", Label2.Text);

            string image1 = ImageUpload1.FileName;
            ImageUpload1.SaveAs(Server.MapPath("~/Upload/Branch Main/Image") + image1);
            sl.Add("@Image1", image1);

            string image2 = ImageUpload2.FileName;
            ImageUpload1.SaveAs(Server.MapPath("~/Upload/Branch Main/Image") + image2);
            sl.Add("@Image2", image1);

            string image3 = ImageUpload3.FileName;
            ImageUpload1.SaveAs(Server.MapPath("~/Upload/Branch Main/Image") + image3);
            sl.Add("@Image3", image3);

            string certificate1 = CertificateUpload1.FileName;
            ImageUpload1.SaveAs(Server.MapPath("~/Upload/Branch Main/Image") + certificate1);
            sl.Add("@Certificate1", certificate1);

            string certificate2 = CertificateUpload2.FileName;
            ImageUpload1.SaveAs(Server.MapPath("~/Upload/Branch Main/Image") + certificate2);
            sl.Add("@Certificate2", certificate2);

            string certificate3 = CertificateUpload3.FileName;
            ImageUpload1.SaveAs(Server.MapPath("~/Upload/Branch Main/Image") + certificate3);
            sl.Add("@Certificate3", certificate3);

            string other1 = OtherUpload1.FileName;
            ImageUpload1.SaveAs(Server.MapPath("~/Upload/Branch Main/Other") + other1);
            sl.Add("@Other1", other1);

            string other2 = OtherUpload2.FileName;
            ImageUpload1.SaveAs(Server.MapPath("~/Upload/Branch Main/Other") + other2);
            sl.Add("@Other2", other2);

            int n = Convert.ToInt32(ERP.ExecuteNonQuerySP("branch_main_sp", sl));
        }
        else
        {
            Label3.Visible = true;
            Label3.Text = "Already Exist";
        }
        grid_bind();
    }

    protected void RadioButtonList1_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (rblOwnership.SelectedItem.Text == "Rent")
        {
            Panel1.Visible = true;
        }
        else
        {
            Panel1.Visible = false;
        }
    }

    protected void ddCountryName_SelectedIndexChanged(object sender, EventArgs e)
    {
        state_bind();
    }

    protected void ddStateName_SelectedIndexChanged(object sender, EventArgs e)
    {
        city_bind();
    }

    protected void ddCityName_SelectedIndexChanged(object sender, EventArgs e)
    {
        branch_bind();
    }

    protected void ddDepartment_SelectedIndexChanged(object sender, EventArgs e)
    {
        designation_bind();
    }

    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {
    }

    protected void GridView1_RowCommand1(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "Editt")
        {
            SortedList sl = new SortedList();
            sl.Add("@query", "Select1");
            sl.Add("@Main_Branch_ID", e.CommandArgument.ToString());
            SqlDataReader dr = ERP.GetDataReaderSP("branch_main_sp", sl);
            while (dr.Read())
            {
                int A = Convert.ToInt32(dr["Main_Branch_ID"].ToString());
                ddCountryName.SelectedValue = dr["Country_ID"].ToString();
                ddStateName.SelectedValue = dr["State_ID"].ToString();
                ddCityName.SelectedValue = dr["City_ID"].ToString();
                ddBranchName.SelectedValue = dr["Branch_ID"].ToString();
                txtBranchShopName.Text = dr["Branch_Shop_Name"].ToString();
                txtAddress.Text = dr["Address"].ToString();
                txtContactPersonName.Text = dr["Contact_Person_Name"].ToString();
                txtCPContactNo.Text = dr["Conatct_Person_No"].ToString();
                ddDepartment.SelectedValue = dr["Department_ID"].ToString();
                ddDesignation.SelectedValue = dr["Designation_ID"].ToString();
                txtEmailID.Text = dr["Email_ID"].ToString();
                txtWebsite.Text = dr["Website"].ToString();
                txtEstablishedYear.Text = dr["Established_Year"].ToString();
                txtGovtRegDetail.Text = dr["Govt_Reg_Detail"].ToString();
                rblOwnership.SelectedValue = dr["Ownership"].ToString();
                if (rblOwnership.SelectedValue == "Rent")
                {
                    Panel1.Visible = true;
                }
                txtRentCharges.Text = dr["Rent_Charges"].ToString();
                txtDeposite.Text = dr["Deposite"].ToString();
                txtOriginalOwnerName.Text = dr["Original_Owner_Name"].ToString();
                txtOriginalOwnerContact.Text = dr["Original_Owner_Contact"].ToString();
                txtRentedFrom.Text = dr["Rented_From"].ToString();
                txtRentedTo.Text = dr["Rented_To"].ToString();
                txtWorkingFrom.Text = dr["Working_From"].ToString();
                txtWorkingTo.Text = dr["Working_To"].ToString();
                Session["I1"] = dr["Image1"].ToString();
                Session["I2"] = dr["Image2"].ToString();
                Session["I3"] = dr["Image3"].ToString();
                Session["C1"] = dr["Certificate1"].ToString();
                Session["C2"] = dr["Certificate2"].ToString();
                Session["C3"] = dr["Certificate3"].ToString();
                Session["O1"] = dr["Other1"].ToString();
                Session["O2"] = dr["Other2"].ToString();

                string str = dr["Facilities"].ToString();
                string[] p = str.Split(',');
                p_clear();
                for (int i = 0; i < p.Length; i++)
                {
                    for (int j = 0; j < cbFacilities.Items.Count - 1; j++)
                    {
                        if (cbFacilities.Items[j].Text == p[i])
                            cbFacilities.Items[j].Selected = true;
                    }
                }

                string str1 = dr["Deals_Product"].ToString();
                string[] q = str1.Split(',');
                q_clear();
                for (int i = 0; i < q.Length - 1; i++)
                {
                    for (int j = 0; j < cbDealsInProduct.Items.Count; j++)
                    {
                        if (cbDealsInProduct.Items[j].Text == q[i])
                            cbDealsInProduct.Items[j].Selected = true;
                    }
                }

                ViewState["Main_Branch_ID"] = A;

            }
            grid_bind();
        }
        else
        {
            if (e.CommandName == "Deletee")
            {
                SortedList sl = new SortedList();
                sl.Add("@query", "Delete1");
                sl.Add("Main_Branch_ID", e.CommandArgument);
                ERP.ExecuteNonQuerySP("branch_main_sp", sl);
                grid_bind();
            }
        }
    }

    protected void btnUpdate_Click(object sender, EventArgs e)
    {
        /*SortedList sl1 = new SortedList();
        sl1.Add("@query", "Count");
        sl1.Add("@Country_ID", ddCountryName.SelectedItem.Value);
        sl1.Add("@State_ID", ddStateName.SelectedItem.Value);
        sl1.Add("@City_ID", ddCityName.SelectedItem.Value);
        sl1.Add("@Branch_ID", ddBranchName.SelectedItem.Value);
        sl1.Add("@Branch_Shop_Name", txtBranchShopName.Text);
        string count = ERP.ExecuteScalarSP("branch_main_sp", sl1).ToString();
        Label3.Visible = false;
        if (count == "0")
        {*/
        SortedList sl = new SortedList();
        sl.Add("@query", "Update1");
        sl.Add("@Main_Branch_ID", ViewState["Main_Branch_ID"]);
        sl.Add("@Country_ID", ddCountryName.SelectedItem.Value);
        sl.Add("@State_ID", ddStateName.SelectedItem.Value);
        sl.Add("@City_ID", ddCityName.SelectedItem.Value);
        sl.Add("@Branch_ID", ddBranchName.SelectedItem.Value);
        sl.Add("@Branch_Shop_Name", txtBranchShopName.Text);
        sl.Add("@Address", txtAddress.Text);
        sl.Add("@Contact_Person_Name", txtContactPersonName.Text);
        sl.Add("@Conatct_Person_No", txtCPContactNo.Text);
        sl.Add("@Department_ID", ddDepartment.SelectedItem.Value);
        sl.Add("@Designation_ID", ddDesignation.SelectedItem.Value);
        sl.Add("@Email_ID", txtEmailID.Text);
        sl.Add("@Website", txtWebsite.Text);
        sl.Add("@Established_Year", txtEstablishedYear.Text);
        sl.Add("@Govt_Reg_Detail", txtGovtRegDetail.Text);
        sl.Add("@Ownership", rblOwnership.SelectedItem.Value);
        sl.Add("@Rent_Charges", txtRentCharges.Text);
        sl.Add("@Deposite", txtDeposite.Text);
        sl.Add("@Rented_From", txtRentedFrom.Text);
        sl.Add("@Rented_To", txtRentedTo.Text);
        sl.Add("@Original_Owner_Name", txtOriginalOwnerName.Text);
        sl.Add("@Original_Owner_Contact", txtOriginalOwnerContact.Text);
        for (int i = 0; i < cbFacilities.Items.Count; i++)
        {
            if (cbFacilities.Items[i].Selected)
            {
                Label1.Text += cbFacilities.Items[i].Text + ",";
            }
        }
        sl.Add("@Facilities", Label1.Text);
        sl.Add("@Working_From", txtWorkingFrom.Text);
        sl.Add("@Working_To", txtWorkingTo.Text);
        for (int i = 0; i < cbDealsInProduct.Items.Count; i++)
        {
            if (cbDealsInProduct.Items[i].Selected)
            {
                Label2.Text += cbDealsInProduct.Items[i].Text + ",";
            }

        }

        sl.Add("@Deals_Product", Label2.Text);

        if (ImageUpload1.HasFile)
        {
            string image1 = ImageUpload1.FileName;
            ImageUpload1.SaveAs(Server.MapPath("~/Upload/Branch Main/Image") + image1);
            sl.Add("@Image1", image1);
        }
        else
        {
            sl.Add("@Image1", Session["I1"]);
        }

        if (ImageUpload2.HasFile)
        {
            string image2 = ImageUpload2.FileName;
            ImageUpload1.SaveAs(Server.MapPath("~/Upload/Branch Main/Image") + image2);
            sl.Add("@Image2", image2);
        }
        else
        {
            sl.Add("@Image2", Session["I2"]);
        }

        if (ImageUpload3.HasFile)
        {
            string image3 = ImageUpload3.FileName;
            ImageUpload1.SaveAs(Server.MapPath("~/Upload/Branch Main/Image") + image3);
            sl.Add("@Image3", image3);

        }
        else
        {
            sl.Add("@Image3", Session["I3"]);
        }

        if (CertificateUpload1.HasFile)
        {
            string certificate1 = CertificateUpload1.FileName;
            ImageUpload1.SaveAs(Server.MapPath("~/Upload/Branch Main/Image") + certificate1);
            sl.Add("@Certificate1", certificate1);

        }
        else
        {
            sl.Add("@Certificate1", Session["C1"]);
        }

        if (CertificateUpload2.HasFile)
        {
            string certificate2 = CertificateUpload2.FileName;
            ImageUpload1.SaveAs(Server.MapPath("~/Upload/Branch Main/Image") + certificate2);
            sl.Add("@Certificate2", certificate2);

        }
        else
        {
            sl.Add("@Certificate2", Session["C2"]);
        }

        if (CertificateUpload3.HasFile)
        {
            string certificate3 = CertificateUpload3.FileName;
            ImageUpload1.SaveAs(Server.MapPath("~/Upload/Branch Main/Image") + certificate3);
            sl.Add("@Certificate3", certificate3);
        }
        else
        {
            sl.Add("@Certificate3", Session["C3"]);
        }

        if (OtherUpload1.HasFile)
        {
            string other1 = OtherUpload1.FileName;
            ImageUpload1.SaveAs(Server.MapPath("~/Upload/Branch Main/Other") + other1);
            sl.Add("@Other1", other1);
        }
        else
        {
            sl.Add("Other1", Session["O1"]);
        }

        if (OtherUpload2.HasFile)
        {
            string other2 = OtherUpload2.FileName;
            ImageUpload1.SaveAs(Server.MapPath("~/Upload/Branch Main/Other") + other2);
            sl.Add("@Other2", other2);
        }
        else
        {
            sl.Add("@Other2", Session["O2"]);
        }

        int n = Convert.ToInt32(ERP.ExecuteNonQuerySP("branch_main_sp", sl));
        /*}
        else
        {
            Label3.Visible = true;
            Label3.Text = "Already Exist";
        }*/
        grid_bind();

    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        next_page();
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        next_page();
    }
    protected void Button3_Click(object sender, EventArgs e)
    {
        previous_page();
    }
    protected void Button4_Click(object sender, EventArgs e)
    {
        previous_page();
    }
}