using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.Sql;
using System.Data.SqlClient;
using System.Collections;

public partial class Vendor_Registration : System.Web.UI.Page
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
        sl1.Add("@Vendor_Name", txtCPersonName.Text);
        sl1.Add("@Vendor_Email", txtCPersonEmail.Text);
        string count = ERP.ExecuteScalarSP("vendorregistration_sp", sl1).ToString();
        Label1.Visible = false;
        if (count == "0")
        {
            SortedList sl = new SortedList();
            sl.Add("@query", "Insert1");
            sl.Add("@Vendor_Name", txtCPersonName.Text);
            sl.Add("@Company_Name", txtCompanyName.Text);
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
            sl.Add("@VBank_Name2", txtCBankName2.Text);
            sl.Add("@VBank_Branch_Name2", txtCBranchName2.Text);
            sl.Add("@VBank_Branch_Address2", txtBranchAddress2.Text);
            sl.Add("@VBank_Account_No2", txtAccountNo2.Text);
            sl.Add("@VBank_Name3", txtCBankName3.Text);
            sl.Add("@VBank_Branch_Name3", txtCBranchName3.Text);
            sl.Add("@VBank_Branch_Address3", txtBranchAddress3.Text);
            sl.Add("@VBank_Account_No3", txtAccountNo3.Text);
                        
            string document1 = Updoc1.FileName;
            Updoc1.SaveAs(Server.MapPath("~/Upload/Document/") + document1);
            sl.Add("@Document_Upload1", document1);

            string document2 = Updoc2.FileName;
            Updoc2.SaveAs(Server.MapPath("~/Upload/Document/") + document2);
            sl.Add("@Document_Upload2", document2);

            string document3 = Updoc2.FileName;
            Updoc3.SaveAs(Server.MapPath("~/Upload/Document/") + document3);
            sl.Add("@Document_Upload3", document3);

            string document4 = Updoc4.FileName;
            Updoc4.SaveAs(Server.MapPath("~/Upload/Document/") + document4);
            sl.Add("@Document_Upload4", document4);

            string certificate1 = Certi1.FileName;
            Certi1.SaveAs(Server.MapPath("~/Upload/Certificate/") + certificate1);
            sl.Add("@Certificate_Upload1", certificate1);

            string certificate2 = Certi2.FileName;
            Certi2.SaveAs(Server.MapPath("~/Upload/Certificate/") + certificate2);
            sl.Add("@Certificate_Upload2", certificate2);

            string certificate3 = Certi3.FileName;
            Certi3.SaveAs(Server.MapPath("~/Upload/Certificate/") + certificate3);
            sl.Add("@Certificate_Upload3", certificate3);

            string Rew1 = Reward1.FileName;
            Reward1.SaveAs(Server.MapPath("~/Upload/Reward/") + Rew1);
            sl.Add("@Other_Reward1", Rew1);

            string Rew2 = Reward2.FileName;
            Reward2.SaveAs(Server.MapPath("~/Upload/Reward/") + Rew2);
            sl.Add("@Other_Reward2", Rew2);

            string Rew3 = Reward3.FileName;
            Reward3.SaveAs(Server.MapPath("~/Upload/Reward/") + Rew3);
            sl.Add("@Other_Reward3", Rew3);


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
        sl1.Add("@Vendor_Name", txtCPersonName.Text);
        sl1.Add("@Vendor_Email", txtCPersonEmail.Text);
        string count = ERP.ExecuteScalarSP("vendorregistration_sp", sl1).ToString();
        Label1.Visible = false;
        if (count == "0")
        {
            SortedList sl = new SortedList();
            sl.Add("@query", "Update1");
            sl.Add("@Vendor_ID", ViewState["Vendor_ID"]);
            sl.Add("@Vendor_Name", txtCPersonName.Text);
            sl.Add("@Company_Name", txtCompanyName.Text);
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
            sl.Add("@VBank_Name2", txtCBankName2.Text);
            sl.Add("@VBank_Branch_Name2", txtCBranchName2.Text);
            sl.Add("@VBank_Branch_Address2", txtBranchAddress2.Text);
            sl.Add("@VBank_Account_No2", txtAccountNo2.Text);
            sl.Add("@VBank_Name3", txtCBankName3.Text);
            sl.Add("@VBank_Branch_Name3", txtCBranchName3.Text);
            sl.Add("@VBank_Branch_Address3", txtBranchAddress3.Text);
            sl.Add("@VBank_Account_No3", txtAccountNo3.Text);

            if (Certi1.HasFile)
            {

                string certificate1 = Certi1.FileName;
                Certi1.SaveAs(Server.MapPath("~/Upload/Certificate/") + certificate1);
                sl.Add("@Certificate_Upload1", certificate1);
            }
            else
            {
                sl.Add("@Certificate_Upload1", Session["certificate1"]);
            }
            if (Certi2.HasFile)
            {

                string certificate2 = Certi2.FileName;
                Certi2.SaveAs(Server.MapPath("~/Upload/Certificate/") + certificate2);
                sl.Add("@Certificate_Upload2", certificate2);
            }
            else
            {
                sl.Add("@Certificate_Upload2", Session["certificate2"]);
            }
            if (Certi3.HasFile)
            {

                string certificate3 = Certi3.FileName;
                Certi3.SaveAs(Server.MapPath("~/Upload/Certificate/") + certificate3);
                sl.Add("@Certificate_Upload3", certificate3);
            }
            else
            {
                sl.Add("@Certificate_Upload3", Session["certificate3"]);
            }
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
            if (Updoc3.HasFile)
            {
                string document3 = Updoc3.FileName;
                Updoc3.SaveAs(Server.MapPath("~/Upload/Document/") + document3);
                sl.Add("@Document_Upload3", document3);
            }
            else
            {
                sl.Add("@Document_Upload3", Session["document3"]);
            }
            if (Updoc4.HasFile)
            {
                string document4 = Updoc4.FileName;
                Updoc4.SaveAs(Server.MapPath("~/Upload/Document/") + document4);
                sl.Add("@Document_Upload4", document4);
            }
            else
            {
                sl.Add("@Document_Upload4", Session["document4"]);
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
            if (Reward2.HasFile)
            {
                string Rew2 = Reward2.FileName;
                Reward2.SaveAs(Server.MapPath("~/Upload/Reward/") + Rew2);
                sl.Add("@Other_Reward2", Rew2);
            }
            else
            {
                sl.Add("@Other_Reward2", Session["otherreward2"]);
            }
            if (Reward3.HasFile)
            {
                string Rew3 = Reward3.FileName;
                Reward3.SaveAs(Server.MapPath("~/Upload/Reward/") + Rew3);
                sl.Add("@Other_Reward3", Rew3);
            }
            else
            {
                sl.Add("@Other_Reward3", Session["otherreward3"]);
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
                txtCPersonName.Text = dr["Vendor_Name"].ToString();
                txtCompanyName.Text = dr["Company_Name"].ToString();
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
                txtCBankName1.Text=dr["VBank_Name1"].ToString();
                txtCBranchName1.Text=dr["VBank_Branch_Name1"].ToString();
                txtBranchAddress1.Text=dr["VBank_Branch_Address1"].ToString();
                txtAccountNo1.Text=dr["VBank_Account_No1"].ToString();
                
                txtCBankName2.Text = dr["VBank_Name2"].ToString();
                txtCBranchName2.Text = dr["VBank_Branch_Name2"].ToString();
                txtBranchAddress2.Text = dr["VBank_Branch_Address2"].ToString();
                txtAccountNo2.Text = dr["VBank_Account_No2"].ToString();
                
                txtCBankName3.Text = dr["VBank_Name3"].ToString();
                txtCBranchName3.Text = dr["VBank_Branch_Name3"].ToString();
                txtBranchAddress3.Text = dr["VBank_Branch_Address3"].ToString();
                txtAccountNo3.Text = dr["VBank_Account_No3"].ToString();
                
                
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

    protected void btnAddAnother_Click(object sender, EventArgs e)
    {
        Panel1.Visible = true;
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        Panel1.Visible = true;
    }
}