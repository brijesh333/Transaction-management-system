using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.Sql;
using System.Data.SqlClient;
using System.Collections;

public partial class HR_Employee_Registration : System.Web.UI.Page
{    
    ERPStoreProcedure ERP = new ERPStoreProcedure();
    protected void Page_Load(object sender, EventArgs e)
    {
        first_degree();
        second_degree();
        third_degree();
        fourth_degree();
        jobtype_bind();
        securityquestion_bind();

        if (!IsPostBack)
        {
            //department_bind();
            Pre_dept_bind();
            country_bind();
            grid_bind();
        }
        GridView1.Visible = false;
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
    }

    public void first_degree()
    {
        SortedList sl = new SortedList();
        sl.Add("@query", "Select grid");
        ddFirstDegree.DataSource = ERP.GetDataReaderSP("firstdegree_sp", sl);
        ddFirstDegree.DataTextField = "Degree_Name";
        ddFirstDegree.DataValueField = "First_Degree_ID";
        ddFirstDegree.DataBind();
    }

    public void second_degree()
    {
        SortedList sl = new SortedList();
        sl.Add("@query", "Select grid");
        ddSecongDegree.DataSource = ERP.GetDataReaderSP("seconddegree_sp", sl);
        ddSecongDegree.DataTextField = "Degree_Name";
        ddSecongDegree.DataValueField = "Second_Degree_ID";
        ddSecongDegree.DataBind();
    }

    public void third_degree()
    {
        SortedList sl = new SortedList();
        sl.Add("@query", "Select grid");
        ddThirdDegree.DataSource = ERP.GetDataReaderSP("thirddegree_sp", sl);
        ddThirdDegree.DataTextField = "Degree_Name";
        ddThirdDegree.DataValueField = "Third_Degree_ID";
        ddThirdDegree.DataBind();
    }

    public void fourth_degree()
    {
        SortedList sl = new SortedList();
        sl.Add("@query", "Select grid");
        ddFourthDegree.DataSource = ERP.GetDataReaderSP("fourthdegree_sp", sl);
        ddFourthDegree.DataTextField = "Degree_Name";
        ddFourthDegree.DataValueField = "Fourth_Degree_ID";
        ddFourthDegree.DataBind();
    }

    public void grid_bind()
    {
        SortedList sl = new SortedList();
        sl.Add("@query", "Select grid");
        GridView1.DataSource = ERP.GetDataReaderSP("emp_reg_sp", sl);
        GridView1.DataBind();

    }

    /*public void department_bind()
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
     }*/

    public void jobtype_bind()
    {
        SortedList sl = new SortedList();
        sl.Add("@query", "Select grid");
        ddJobType.DataSource = ERP.GetDataReaderSP("jobtype_sp", sl);
        ddJobType.DataTextField = "Job_type";
        ddJobType.DataValueField = "Job_ID";
        ddJobType.DataBind();
    }

    public void securityquestion_bind()
    {
        SortedList sl = new SortedList();
        sl.Add("@query", "Select grid");
        ddSecurityQuestion.DataSource = ERP.GetDataReaderSP("security_sp", sl);
        ddSecurityQuestion.DataTextField = "Security_Question";
        ddSecurityQuestion.DataValueField = "Security_ID";
        ddSecurityQuestion.DataBind();
    }

    public void Pre_dept_bind()
    {
        SortedList sl = new SortedList();
        sl.Add("@query", "Select grid");
        ddPreviousDepartment.DataSource = ERP.GetDataReaderSP("department_sp", sl);
        ddPreviousDepartment.DataTextField = "Department_Name";
        ddPreviousDepartment.DataValueField = "Department_ID";
        ddPreviousDepartment.DataBind();
        prev_designation_bind();
    }

    public void prev_designation_bind()
    {
        SortedList sl = new SortedList();
        sl.Add("@query", "Select Department");
        sl.Add("Department_ID", ddPreviousDepartment.SelectedItem.Value);
        ddPreviousDesignation.DataSource = ERP.GetDataReaderSP("designation_sp", sl);
        ddPreviousDesignation.DataTextField = "Designation";
        ddPreviousDesignation.DataValueField = "Designation_ID";
        ddPreviousDesignation.DataBind();
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
        sl1.Add("@User_Name1", txtUserName.Text);
        sl1.Add("@Email", txtEmail.Text);
        string count = ERP.ExecuteScalarSP("emp_reg_sp", sl1).ToString();
        Label7.Visible = false;
        if (count == "0")
        {
            SortedList sl = new SortedList();
            sl.Add("@query", "Insert manager");
            sl.Add("@Full_Name", txtFullName.Text);
            sl.Add("@Parmenant_Address", txtPAddress.Text);
            sl.Add("@Current_Address", txtCAddress.Text);
            sl.Add("@DOB", txtDOB.Text);
            sl.Add("@Gender", rdGender.SelectedItem.Value);
            sl.Add("@Marital_Status", rdMaritalStatus.SelectedItem.Value);
            sl.Add("@Country_ID", ddCountry.SelectedItem.Value);
            sl.Add("@State_ID", ddState.SelectedItem.Value);
            sl.Add("@City_ID", ddCity.SelectedItem.Value);
            sl.Add("@Pin_Code", txtPinCode.Text);
            sl.Add("@Contact_No", txtContactNo.Text);
            sl.Add("@Email", txtEmail.Text);
            sl.Add("@Blood_Group", txtBloodGroup.Text);
            sl.Add("@Qualification", txtQualification.Text);
            sl.Add("@Affiliated_University", txtAffiliatedUniversity.Text);
            sl.Add("@Skills_Set", txtSkillsSet.Text);
            sl.Add("@First_Degree_ID", ddFirstDegree.SelectedItem.Value);
            sl.Add("@Second_Degree_ID", ddSecongDegree.SelectedItem.Value);
            sl.Add("@Third_Degree_ID", ddThirdDegree.SelectedItem.Value);
            sl.Add("@Fourth_Degree_ID", ddFourthDegree.SelectedItem.Value);
            sl.Add("@Job_ID", ddJobType.SelectedItem.Value);
            sl.Add("@Prev_Company", txtPreviousCompany.Text);
            sl.Add("@PreDept_ID ", ddPreviousDepartment.SelectedItem.Value);
            sl.Add("@DOJ", txtDOJ.Text);
            sl.Add("@DOL", txtDOL.Text);
            sl.Add("@Last_Salary", txtLastSalary.Text);
            sl.Add("@Experience", txtExperience.Text);
            sl.Add("@Pre_Com_Contact", txtPreComContact.Text);
            sl.Add("@Pre_Com_Email_ID", txtPreCompanyEmail.Text);
            sl.Add("@E_Person_Name", txtE_PersonName.Text);
            sl.Add("@E_Relationship", txtE_Relationship.Text);
            sl.Add("@E_Address", txtE_Address.Text);
            sl.Add("@E_Contact_No", txtE_ConatctNo.Text);
            sl.Add("@User_Name1", txtUserName.Text);
            sl.Add("@Password", txtPassword.Text);
            sl.Add("@Security_ID", ddSecurityQuestion.SelectedItem.Value);
            sl.Add("@Security_Answer", txtSecurityAnswer.Text);
            sl.Add("@Passport_No", txtPassportNo.Text);
            sl.Add("@Bank_Acc_No", txtBankAccountNo.Text);
            sl.Add("@PF_No", txtPFNo.Text);
            sl.Add("@Prev_Designation_ID", ddPreviousDesignation.SelectedItem.Value);

            string certificate = fuCertificate.FileName;
            fuCertificate.SaveAs(Server.MapPath("~/Upload/Certificate/") + certificate);
            sl.Add("@Certificate_Upload", certificate);

            string document = fuDocument.FileName;
            fuDocument.SaveAs(Server.MapPath("~/Upload/Document/") + document);
            sl.Add("@Document_Upload", document);

            string photo = fuPhoto.FileName;
            fuPhoto.SaveAs(Server.MapPath("~/Upload/Photo/") + photo);
            sl.Add("@Photo_Upload", photo);

            int n = Convert.ToInt32(ERP.ExecuteNonQuerySP("emp_reg_sp", sl));
            grid_bind();
        }
        else
        {
            Label7.Text = "Already Exist";
            Label7.Visible = true;
        }
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
            sl.Add("@Employee_ID", e.CommandArgument.ToString());
            SqlDataReader dr = ERP.GetDataReaderSP("emp_reg_sp", sl);
            while (dr.Read())
            {
                int A = Convert.ToInt32(dr["Employee_ID"].ToString());
                txtFullName.Text = dr["Full_Name"].ToString();
                txtPAddress.Text = dr["Parmenant_Address"].ToString();
                txtCAddress.Text = dr["Current_Address"].ToString();
                txtDOB.Text = dr["DOB"].ToString();
                rdGender.SelectedValue = dr["Gender"].ToString();
                rdMaritalStatus.SelectedValue = dr["Marital_Status"].ToString();
                ddCountry.SelectedItem.Value = dr["Country_ID"].ToString();
                ddState.SelectedItem.Value = dr["State_ID"].ToString();
                ddCity.SelectedItem.Value = dr["City_ID"].ToString();
                txtPinCode.Text = dr["Pin_Code"].ToString();
                txtContactNo.Text = dr["Contact_No"].ToString();
                txtEmail.Text = dr["Email"].ToString();
                txtBloodGroup.Text = dr["Blood_Group"].ToString();
                txtQualification.Text = dr["Qualification"].ToString();
                txtAffiliatedUniversity.Text = dr["Affiliated_University"].ToString();
                txtSkillsSet.Text = dr["Skills_Set"].ToString();
                ddFirstDegree.SelectedValue = dr["First_Degree_ID"].ToString();
                ddSecongDegree.SelectedValue = dr["Second_Degree_ID"].ToString();
                ddThirdDegree.SelectedValue = dr["Third_Degree_ID"].ToString();
                ddFourthDegree.SelectedValue = dr["Fourth_Degree_ID"].ToString();
                /*ddDepartment.SelectedValue = dr["Department_ID"].ToString();
                ddDesignation.SelectedValue = dr["Designation_ID"].ToString();*/
                ddJobType.SelectedValue = dr["Job_ID"].ToString();
                txtPreviousCompany.Text = dr["Prev_Company"].ToString();
                ddPreviousDepartment.SelectedValue = dr["PreDept_ID"].ToString();
                ddPreviousDesignation.SelectedValue = dr["Prev_Designation_ID"].ToString();
                txtDOJ.Text = dr["DOJ"].ToString();
                txtDOL.Text = dr["DOL"].ToString();
                txtLastSalary.Text = dr["Last_Salary"].ToString();
                txtExperience.Text = dr["Experience"].ToString();
                txtPreComContact.Text = dr["Pre_Com_Contact"].ToString();
                txtPreCompanyEmail.Text = dr["Pre_Com_Email_ID"].ToString();
                txtE_PersonName.Text = dr["E_Person_Name"].ToString();
                txtE_Relationship.Text = dr["E_Relationship"].ToString();
                txtE_Address.Text = dr["E_Address"].ToString();
                txtE_ConatctNo.Text = dr["E_Contact_No"].ToString();
                txtUserName.Text = dr["User_Name1"].ToString();
                txtPassword.Text = dr["Password"].ToString();
                txtConfirmPassword.Text = dr["Password"].ToString();
                ddSecurityQuestion.SelectedValue = dr["Security_ID"].ToString();
                txtSecurityAnswer.Text = dr["Security_Answer"].ToString();
                txtPassportNo.Text = dr["Passport_No"].ToString();
                txtBankAccountNo.Text = dr["Bank_Acc_No"].ToString();
                txtPFNo.Text = dr["PF_No"].ToString();
                ViewState["Employee_ID"] = A;
                Session["A"] = dr["Certificate_Upload"].ToString();
                Label8.Text = dr["Certificate_Upload"].ToString();
                Session["B"] = dr["Document_Upload"].ToString();
                Label9.Text = dr["Document_Upload"].ToString();
                Session["C"] = dr["Photo_Upload"].ToString();
                Label10.Text = dr["Photo_Upload"].ToString();
            }
            grid_bind();
        }
        else
        {
            if (e.CommandName == "Deletee")
            {
                SortedList sl = new SortedList();
                sl.Add("@query", "Delete1");
                sl.Add("@Employee_ID", e.CommandArgument);
                ERP.ExecuteNonQuerySP("emp_reg_sp", sl);
                grid_bind();
            }
        }
    }
    protected void btnUpdate_Click(object sender, EventArgs e)
    {
        SortedList sl1 = new SortedList();
        sl1.Add("@query", "Count");
        sl1.Add("@User_Name1", txtUserName.Text);
        sl1.Add("@Email", txtEmail.Text);
        string count = ERP.ExecuteScalarSP("emp_reg_sp", sl1).ToString();
        Label7.Visible = false;
        if (count == "0")
        {
            SortedList sl = new SortedList();
            sl.Add("@query", "Update1");
            sl.Add("@Employee_ID", ViewState["Employee_ID"]);
            sl.Add("@Full_Name", txtFullName.Text);
            sl.Add("@Parmenant_Address", txtPAddress.Text);
            sl.Add("@Current_Address", txtCAddress.Text);
            sl.Add("@DOB", txtDOB.Text);
            sl.Add("@Gender", rdGender.SelectedItem.Value);
            sl.Add("@Marital_Status", rdMaritalStatus.SelectedItem.Value);
            sl.Add("@Country_ID", ddCountry.SelectedItem.Value);
            sl.Add("@State_ID", ddState.SelectedItem.Value);
            sl.Add("@City_ID", ddCity.SelectedItem.Value);
            sl.Add("@Pin_Code", txtPinCode.Text);
            sl.Add("@Contact_No", txtContactNo.Text);
            sl.Add("@Email", txtEmail.Text);
            sl.Add("@Blood_Group", txtBloodGroup.Text);
            sl.Add("@Qualification", txtQualification.Text);
            sl.Add("@Affiliated_University", txtAffiliatedUniversity.Text);
            sl.Add("@Skills_Set", txtSkillsSet.Text);
            sl.Add("@First_Degree_ID", ddFirstDegree.SelectedItem.Value);
            sl.Add("@Second_Degree_ID", ddSecongDegree.SelectedItem.Value);
            sl.Add("@Third_Degree_ID", ddThirdDegree.SelectedItem.Value);
            sl.Add("@Fourth_Degree_ID", ddFourthDegree.SelectedItem.Value);
            /*sl.Add("@Department_ID", ddDepartment.SelectedItem.Value);
            sl.Add("@Designation_ID", ddDesignation.SelectedItem.Value);*/
            sl.Add("@Job_ID", ddJobType.SelectedItem.Value);
            sl.Add("@Prev_Company", txtPreviousCompany.Text);
            sl.Add("@PreDept_ID ", ddPreviousDepartment.SelectedItem.Value);
            sl.Add("@DOJ", txtDOJ.Text);
            sl.Add("@DOL", txtDOL.Text);
            sl.Add("@Last_Salary", txtLastSalary.Text);
            sl.Add("@Experience", txtExperience.Text);
            sl.Add("@Pre_Com_Contact", txtPreComContact.Text);
            sl.Add("@Pre_Com_Email_ID", txtPreCompanyEmail.Text);
            sl.Add("@E_Person_Name", txtE_PersonName.Text);
            sl.Add("@E_Relationship", txtE_Relationship.Text);
            sl.Add("@E_Address", txtE_Address.Text);
            sl.Add("@E_Contact_No", txtE_ConatctNo.Text);
            sl.Add("@User_Name1", txtUserName.Text);
            sl.Add("@Password", txtPassword.Text);
            sl.Add("@Security_ID", ddSecurityQuestion.SelectedItem.Value);
            sl.Add("@Security_Answer", txtSecurityAnswer.Text);
            sl.Add("@Passport_No", txtPassportNo.Text);
            sl.Add("@Bank_Acc_No", txtBankAccountNo.Text);
            sl.Add("@PF_No", txtPFNo.Text);
            sl.Add("@Prev_Designation_ID", ddPreviousDesignation.SelectedItem.Value);

            if (fuCertificate.HasFile)
            {
                string certificate = fuCertificate.FileName;
                fuCertificate.SaveAs(Server.MapPath("~/Upload/Certificate/") + certificate);
                sl.Add("@Certificate_Upload", certificate);
            }
            else
            {
                sl.Add("@Certificate_Upload", Session["A"]);
            }

            if (fuDocument.HasFile)
            {
                string document = fuDocument.FileName;
                fuDocument.SaveAs(Server.MapPath("~/Upload/Document/") + document);
                sl.Add("@Document_Upload", document);
            }
            else
            {
                sl.Add("@Document_Upload", Session["B"]);
            }

            if (fuPhoto.HasFile)
            {
                string photo = fuPhoto.FileName;
                fuPhoto.SaveAs(Server.MapPath("~/Upload/Photo/") + photo);
                sl.Add("@Photo_Upload", photo);
            }
            else
            {
                sl.Add("@Photo_Upload", Session["C"]);
            }

            int n = Convert.ToInt32(ERP.ExecuteNonQuerySP("emp_reg_sp", sl));
            grid_bind();
        }
        else
        {
            Label7.Text = "Already Exist";
            Label7.Visible = true;
        }
    }
    protected void ddCountry_SelectedIndexChanged(object sender, EventArgs e)
    {
        state_bind();
    }
    protected void ddState_SelectedIndexChanged(object sender, EventArgs e)
    {
        city_bind();
    }
    protected void ddDepartment_SelectedIndexChanged(object sender, EventArgs e)
    {
        //designation_bind();
    }
    protected void ddPreviousDepartment_SelectedIndexChanged(object sender, EventArgs e)
    {
        prev_designation_bind();
    }
    protected void btnNext_Click(object sender, EventArgs e)
    {
        next_page();
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        next_page();
    }
    protected void Button3_Click(object sender, EventArgs e)
    {
        next_page();
    }
    protected void Button5_Click(object sender, EventArgs e)
    {
        next_page();
    }
    protected void Button7_Click(object sender, EventArgs e)
    {
        next_page();
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        previous_page();
    }
    protected void Button4_Click(object sender, EventArgs e)
    {
        previous_page();
    }
    protected void Button6_Click(object sender, EventArgs e)
    {
        previous_page();
    }
    protected void Button8_Click(object sender, EventArgs e)
    {
        previous_page();
    }
    protected void Button9_Click(object sender, EventArgs e)
    {
        previous_page();
    }

}