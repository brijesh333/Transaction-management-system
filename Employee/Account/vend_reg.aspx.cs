using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Collections;
using System.Data;
using System.Data.SqlClient;

public partial class Employee_Account_vend_reg : System.Web.UI.Page
{
    ERPStoreProcedure ERP = new ERPStoreProcedure();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            business_bind();
            //product_bind();
            department_bind();
            grid_bind();
        }        
    }

    public void business_bind()
    {
        SortedList sl = new SortedList();
        sl.Add("@query", "Select grid");
        ddTypeOfBusiness.DataSource = ERP.GetDataReaderSP("business_type_sp", sl);
        ddTypeOfBusiness.DataTextField = "Bus_Type";
        ddTypeOfBusiness.DataValueField = "Bus_Type_ID";
        ddTypeOfBusiness.DataBind();
    }

    public void grid_bind()
    {
        SortedList sl = new SortedList();
        sl.Add("@query", "Select grid");
        GridView1.DataSource = ERP.GetDataReaderSP("vendorregistration_sp", sl);
        GridView1.DataBind();
    }

    /*public void product_bind()
    {
        SortedList sl = new SortedList();
        sl.Add("@query", "Select grid");
        ddProMain.DataSource = ERP.GetDataReaderSP("product_sp", sl);
        ddProMain.DataTextField = "Product_Name";
        ddProMain.DataValueField = "Product_Id";
        ddProMain.DataBind();
        subproduct_bind();
    }

    public void subproduct_bind()
    {
        SortedList sl = new SortedList();
        sl.Add("@query", "Select product");
        sl.Add("@Product_ID", ddProMain.SelectedItem.Value);
        ddProSub.DataSource = ERP.GetDataReaderSP("productsub_sp", sl);
        ddProSub.DataTextField = "ProductSub_Name";
        ddProSub.DataValueField = "ProductSub_ID";
        ddProSub.DataBind();       
    }*/

    public void department_bind()
    {
        SortedList sl = new SortedList();
        sl.Add("@query", "Select grid");
        ddCPersonDepartment.DataSource = ERP.GetDataReaderSP("department_sp", sl);
        ddCPersonDepartment.DataTextField = "Department_Name";
        ddCPersonDepartment.DataValueField = "Department_ID";
        ddCPersonDepartment.DataBind();
        designation_bind();
    }

    public void designation_bind()
    {
        SortedList sl = new SortedList();
        sl.Add("@query", "Select department");
        sl.Add("@Department_ID", ddCPersonDepartment.SelectedItem.Value);
        ddCPersonDesignation.DataSource = ERP.GetDataReaderSP("designation_sp", sl);
        ddCPersonDesignation.DataTextField = "Designation";
        ddCPersonDesignation.DataValueField = "Designation_ID";
        ddCPersonDesignation.DataBind();
    }

    protected void btnSubmit_Click1(object sender, EventArgs e)
    {
        SortedList sl1 = new SortedList();
        sl1.Add("@query", "Count");
        sl1.Add("@Vendor_Name", txtCRegistrationNo.Text);
        sl1.Add("@Vendor_Email", txtCPersonEmail.Text);
        string count = ERP.ExecuteScalarSP("vendorregistration_sp", sl1).ToString();
        Label1.Visible = false;
        if (count == "0")
        {
            SortedList sl = new SortedList();
            sl.Add("@query", "Insert1");
            sl.Add("@Vendor_Name", txtCRegistrationNo.Text);
            sl.Add("@Company_Name", txtCPersonName.Text);
            sl.Add("@Business_ID", ddTypeOfBusiness.SelectedItem.Value);
            sl.Add("@VHOffice_Address", txtHeadAddress.Text);
            sl.Add("@VHOffice_Contact_No", txtCHOfficeContact.Text);
            sl.Add("@VHOffice_Email", txtCHOfficeEmail.Text);
            sl.Add("@VHOffice_Website", txtCHOfficeWebsite.Text);
            sl.Add("@VendorDepartment_Id", ddCPersonDepartment.SelectedItem.Value);
            sl.Add("@VendorDesignation_Id", ddCPersonDesignation.SelectedItem.Value);
            sl.Add("@Vendor_Email", txtCPersonEmail.Text);
            sl.Add("@Vendor_Mobile_No", txtCPersonMobile.Text);
            sl.Add("@Vendor_Contact_No", txtCPersonContact.Text);
            sl.Add("@Vendor_Address", txtCPersonAddress.Text);
            sl.Add("@Company_Reg_No", txtCRegistrationNo.Text);
            sl.Add("@Company_Vat_No", txtCVatNo.Text);
            sl.Add("@Service_Tax_No", txtCServiceTaxNo.Text);
            sl.Add("@Establish_Year", txtCEstablishYear.Text);
            sl.Add("@Type_Of_Company", rbTypeOfCompany.Text);
            sl.Add("@ISO_Certificate", rbISO.Text);
            sl.Add("@VBank_Name1", txtCBankName1.Text);
            sl.Add("@VBank_Branch_Name1", txtCBranchName1.Text);
            sl.Add("@VBank_Branch_Address1", txtBranchAddress1.Text);
            sl.Add("@VBank_Account_No1", txtAccountNo1.Text);
            

            string document1 = Updoc1.FileName;
            Updoc1.SaveAs(Server.MapPath("~/Upload/Document/") + document1);
            sl.Add("@Document_Upload1", document1);

            string document2 = Updoc2.FileName;
            Updoc2.SaveAs(Server.MapPath("~/Upload/Document/") + document2);
            sl.Add("@Document_Upload2", document2);

            string Rew1 = Reward1.FileName;
            Reward1.SaveAs(Server.MapPath("~/Upload/Reward/") + Rew1);
            sl.Add("@Other_Reward1", Rew1);

            int n = Convert.ToInt32(ERP.ExecuteNonQuerySP("vendorregistration_sp", sl));
            grid_bind();
        }
        else
        {
            Label1.Text = "Already Exist";
            Label1.Visible = true;
        }


    }
    protected void Button2_Click(object sender, EventArgs e)
    {

        SortedList sl1 = new SortedList();
        sl1.Add("@query", "Count");
        sl1.Add("@Vendor_Name", txtCRegistrationNo.Text);
        sl1.Add("@Vendor_Email", txtCPersonEmail.Text);
        string count = ERP.ExecuteScalarSP("vendorregistration_sp", sl1).ToString();
        Label1.Visible = false;
        if (count == "0")
        {
            SortedList sl = new SortedList();
            sl.Add("@query", "Update1");
            sl.Add("@Vendor_ID", ViewState["Vendor_ID"]);
            sl.Add("@Vendor_Name", txtCRegistrationNo.Text);
            sl.Add("@Company_Name", txtCPersonName.Text);
            sl.Add("@Business_ID", ddTypeOfBusiness.SelectedItem.Value);
            sl.Add("@VHOffice_Address", txtHeadAddress.Text);
            sl.Add("@VHOffice_Contact_No", txtCHOfficeContact.Text);
            sl.Add("@VHOffice_Email", txtCHOfficeEmail.Text);
            sl.Add("@VHOffice_Website", txtCHOfficeWebsite.Text);
            sl.Add("@VendorDepartment_Id", ddCPersonDepartment.SelectedItem.Value);
            sl.Add("@VendorDesignation_Id", ddCPersonDesignation.SelectedItem.Value);
            sl.Add("@Vendor_Email", txtCPersonEmail.Text);
            sl.Add("@Vendor_Mobile_No", txtCPersonMobile.Text);
            sl.Add("@Vendor_Contact_No", txtCPersonContact.Text);
            sl.Add("@Vendor_Address", txtCPersonAddress.Text);
            sl.Add("@Company_Reg_No", txtCRegistrationNo.Text);
            sl.Add("@Company_Vat_No", txtCVatNo.Text);
            sl.Add("@Service_Tax_No", txtCServiceTaxNo.Text);
            sl.Add("@Establish_Year", txtCEstablishYear.Text);
            sl.Add("@Type_Of_Company", rbTypeOfCompany.Text);
            sl.Add("@ISO_Certified", rbISO.Text);
            sl.Add("@VBank_Name1", txtCBankName1.Text);
            sl.Add("@VBank_Branch_Name1", txtCBranchName1.Text);
            sl.Add("@VBank_Branch_Address1", txtBranchAddress1.Text);
            sl.Add("@VBank_Account_No1", txtAccountNo1.Text);
            

            if (Updoc1.HasFile)
            {
                string document1 = Updoc1.FileName;
                Updoc1.SaveAs(Server.MapPath("~/Upload/Document/") + document1);
                sl.Add("@Document_Upload1", document1);
            }
            else
            {
                sl.Add("@Document_Upload1", Session["document1"]);
            }
            if (Updoc2.HasFile)
            {
                string document2 = Updoc2.FileName;
                Updoc2.SaveAs(Server.MapPath("~/Upload/Document/") + document2);
                sl.Add("@Document_Upload2", document2);
            }
            else
            {
                sl.Add("@Document_Upload2", Session["document2"]);
            }
            
            if (Reward1.HasFile)
            {
                string Rew1 = Reward1.FileName;
                Reward1.SaveAs(Server.MapPath("~/Upload/Reward/") + Rew1);
                sl.Add("@Other_Reward1", Rew1);
            }
            else
            {
                sl.Add("@Other_Reward1", Session["otherreward1"]);
            }

            int n = Convert.ToInt32(ERP.ExecuteNonQuerySP("vendorregistration_SP", sl));
            grid_bind();

        }

        else
        {
            Label1.Text = "Already Exist";
            Label1.Visible = true;
        }
    }

    protected void GridView1_RowCommand1(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "Edite")
        {
            SortedList sl = new SortedList();
            sl.Add("@query", "Select1");
            sl.Add("@Vendor_ID", e.CommandArgument.ToString());
            SqlDataReader dr = ERP.GetDataReaderSP("vendorregistration_sp", sl);
            while (dr.Read())
            {
                int A = Convert.ToInt32(dr["Vendor_ID"].ToString());
                txtCRegistrationNo.Text = dr["Vendor_Name"].ToString();
                txtCPersonName.Text = dr["Company_Name"].ToString();
                ddTypeOfBusiness.SelectedValue = dr["Business_Id"].ToString();
                txtHeadAddress.Text = dr["VHOffice_Address"].ToString();
                txtCHOfficeContact.Text = dr["VHOffice_Contact_No"].ToString();
                txtCHOfficeEmail.Text = dr["VHOffice_Email"].ToString();
                txtCHOfficeWebsite.Text = dr["VHOffice_Website"].ToString();
                designation_bind();
                ddCPersonDesignation.SelectedValue = dr["VendorDesignation_ID"].ToString();
                txtCPersonEmail.Text = dr["Vendor_Email"].ToString();
                txtCPersonMobile.Text = dr["Vendor_Mobile_No"].ToString();
                txtCPersonContact.Text = dr["Vendor_Contact_No"].ToString();
                txtCPersonAddress.Text = dr["Vendor_Address"].ToString();

                txtCRegistrationNo.Text = dr["Company_Reg_No"].ToString();
                txtCVatNo.Text = dr["Company_Vat_No"].ToString();
                txtCServiceTaxNo.Text = dr["Service_Tax_No"].ToString();
                txtCEstablishYear.Text = dr["Establish_Year"].ToString();
                rbTypeOfCompany.SelectedValue = dr["Type_Of_Company"].ToString();
                rbISO.SelectedValue = dr["ISO_Certificate"].ToString();
                ddCPersonDepartment.SelectedValue = dr["VendorDepartment_Id"].ToString();
                txtCBankName1.Text = dr["VBank_Name1"].ToString();
                txtCBranchName1.Text = dr["VBank_Branch_Name1"].ToString();
                txtBranchAddress1.Text = dr["VBank_Branch_Address1"].ToString();
                txtAccountNo1.Text = dr["VBank_Account_No1"].ToString();
                
                Session["document1"] = dr["Document_Upload1"].ToString();
                Session["document2"] = dr["Document_Upload2"].ToString();
                Session["document3"] = dr["Document_Upload3"].ToString();
                Session["document4"] = dr["Document_Upload4"].ToString();
                Session["certificate1"] = dr["Certificate_Upload1"].ToString();
                Session["certificate2"] = dr["Certificate_Upload2"].ToString();
                Session["certificate3"] = dr["Certificate_Upload3"].ToString();
                Session["otherreward1"] = dr["Other_Reward1"].ToString();
                Session["otherreward2"] = dr["Other_Reward2"].ToString();
                Session["otherreward3"] = dr["Other_Reward3"].ToString();

                ViewState["Vendor_ID"] = A;
            }
            grid_bind();
        }
        else
        {
            if (e.CommandName == "Deletee")
            {
                SortedList sl = new SortedList();
                sl.Add("@query", "Delete1");
                sl.Add("@Vendor_ID", e.CommandArgument);
                ERP.ExecuteNonQuerySP("vendorregistration_sp", sl);
                grid_bind();
            }
        }
    }
    
    protected void ddCPersonDepartment_SelectedIndexChanged(object sender, EventArgs e)
    {
        designation_bind();
    }

    public void next_page()
    {
        TabContainer2.ActiveTabIndex = TabContainer2.ActiveTabIndex + 1;
    }

    public void previous_page()
    {
        TabContainer2.ActiveTabIndex = TabContainer2.ActiveTabIndex - 1;
    }

    protected void Button5_Click(object sender, EventArgs e)
    {
        previous_page();
    }
    protected void Button6_Click(object sender, EventArgs e)
    {
        next_page();
    }
    protected void Button3_Click(object sender, EventArgs e)
    {
        previous_page();
    }
    protected void Button4_Click(object sender, EventArgs e)
    {
        next_page();
    }
    protected void Button7_Click(object sender, EventArgs e)
    {
        next_page();
    }
    protected void Button9_Click(object sender, EventArgs e)
    {
        previous_page();
    }
    protected void Button8_Click(object sender, EventArgs e)
    {
        next_page();
    }
    protected void Button10_Click(object sender, EventArgs e)
    {
        previous_page();
    }
}