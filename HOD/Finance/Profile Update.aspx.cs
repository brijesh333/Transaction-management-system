using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Collections;
public partial class HR_profile_update1 : System.Web.UI.Page
{
    ERPStoreProcedure ERP = new ERPStoreProcedure();
    protected void Page_Load(object sender, EventArgs e)
    {
        view_detail();
        if (!IsPostBack)
        {
            country_bind();
            securityquestion_bind();
        }
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
    public void securityquestion_bind()
    {
        SortedList sl = new SortedList();
        sl.Add("@query", "Select grid");
        ddSecurityQuestion.DataSource = ERP.GetDataReaderSP("security_sp", sl);
        ddSecurityQuestion.DataTextField = "Security_Question";
        ddSecurityQuestion.DataValueField = "Security_ID";
        ddSecurityQuestion.DataBind();
    }


    public void next_page()
    {
        TabContainer1.ActiveTabIndex = TabContainer1.ActiveTabIndex + 1;
    }

    public void previous_page()
    {
        TabContainer1.ActiveTabIndex = TabContainer1.ActiveTabIndex - 1;
    }

    public void view_detail()
    {
        SortedList sl = new SortedList();
        sl.Add("@query", "Select Login Successful");
        sl.Add("@User_Name1",Session["U_Name"]);
        SqlDataReader dr = ERP.GetDataReaderSP("emp_reg_sp", sl);
        while (dr.Read())
        {
            //int A = Convert.ToInt32(dr["Employee_ID"].ToString());
            lblFullName.Text = dr["Full_Name"].ToString();
            txtPAddress.Text = dr["Parmenant_Address"].ToString();
            txtCAddress.Text = dr["Current_Address"].ToString();
            lblDOB.Text = dr["DOB"].ToString();
            lblGender.Text = dr["Gender"].ToString();
            rdMaritalStatus.SelectedValue = dr["Marital_Status"].ToString();
            ddCountry.SelectedValue = dr["Country_ID"].ToString();
            ddState.SelectedValue = dr["State_ID"].ToString();
            //ddCity.SelectedValue = dr["City_ID"].ToString();
            txtPinCode.Text = dr["Pin_Code"].ToString();
            txtContactNo.Text = dr["Contact_No"].ToString();
            txtEmailID.Text = dr["Email"].ToString();
            lblBloodGroup.Text = dr["Blood_Group"].ToString();
            lblQualification.Text = dr["Qualification"].ToString();
            lblAffectedUniversity.Text = dr["Affiliated_University"].ToString();
            txtSkillsSet.Text = dr["Skills_Set"].ToString();
            lbl1Degree.Text = dr["First_Degree_ID"].ToString();
            lbl2Degree.Text = dr["Second_Degree_ID"].ToString();
            lbl3Degree.Text = dr["Third_Degree_ID"].ToString();
            lbl4Degree.Text = dr["Fourth_Degree_ID"].ToString();
            lblDepartment.Text = dr["Department_ID"].ToString();
            lblDesignation.Text = dr["Designation_ID"].ToString();
            lblJobType.Text = dr["Job_ID"].ToString();
            lblPreviousComName.Text = dr["Prev_Company"].ToString();
            lblPreviousDept.Text = dr["PreDept_ID"].ToString();
            lblDesignation.Text = dr["Prev_Designation_ID"].ToString();
            lblDOJ.Text = dr["DOJ"].ToString();
            lblDOL.Text = dr["DOL"].ToString();
            lblLastSalary.Text = dr["Last_Salary"].ToString();
            lblExperience.Text = dr["Experience"].ToString();
            lblPreComContact.Text = dr["Pre_Com_Contact"].ToString();
            lblPreComEmailID.Text = dr["Pre_Com_Email_ID"].ToString();
            txtE_PersonaName.Text = dr["E_Person_Name"].ToString();
            txtE_Relation.Text = dr["E_Relationship"].ToString();
            txtE_Address.Text = dr["E_Address"].ToString();
            txtE_ContactNo.Text = dr["E_Contact_No"].ToString();
            lblUserName.Text = dr["User_Name1"].ToString();
            txtPassword.Text = dr["Password"].ToString();
            txtConfirmPassword.Text = dr["Password"].ToString();
            ddSecurityQuestion.SelectedValue = dr["Security_ID"].ToString();
            txtSecurity.Text = dr["Security_Answer"].ToString();
            lblPassportNo.Text = dr["Passport_No"].ToString();
            lblBankAccNo.Text = dr["Bank_Acc_No"].ToString();
            lblPFNo.Text = dr["PF_No"].ToString();
        }
    }

    protected void btnNext_Click(object sender, EventArgs e)
    {
        next_page();
    }
    protected void btnNext0_Click(object sender, EventArgs e)
    {
        next_page();
    }
    protected void btnNext1_Click(object sender, EventArgs e)
    {
        next_page();
    }
    protected void btnNext2_Click(object sender, EventArgs e)
    {
        next_page();
    }
    protected void btnPrevious2_Click(object sender, EventArgs e)
    {
        previous_page();
    }
    protected void btnPrevious_Click(object sender, EventArgs e)
    {
        previous_page();
    }
    protected void btnPrevious0_Click(object sender, EventArgs e)
    {
        previous_page();
    }
    protected void btnPrevious1_Click(object sender, EventArgs e)
    {
        previous_page();
    }
    protected void btnUpdate0_Click(object sender, EventArgs e)
    {
        SortedList sl = new SortedList();
        sl.Add("@query", "Update profile");
        sl.Add("@User_Name1", Session["U_Name"]);
        //sl.Add("@Full_Name", lblFullName.Text);
        sl.Add("@Parmenant_Address", txtPAddress.Text);
        sl.Add("@Current_Address", txtCAddress.Text);
        //sl.Add("@DOB", lblDOB.Text);
        //sl.Add("@Gender", lblGender.Text);
        sl.Add("@Marital_Status", rdMaritalStatus.SelectedItem.Value);
        sl.Add("@Country_ID", ddCountry.SelectedItem.Value);
        sl.Add("@State_ID", ddState.SelectedItem.Value);
        sl.Add("@City_ID", ddCity.SelectedItem.Value);
        sl.Add("@Pin_Code", txtPinCode.Text);
        sl.Add("@Contact_No", txtContactNo.Text);
        sl.Add("@Email", txtEmailID.Text);
        //sl.Add("@Blood_Group", lblBloodGroup.Text);
        //sl.Add("@Qualification", lblQualification.Text);
        //sl.Add("@Affiliated_University", lblAffectedUniversity.Text);
        sl.Add("@Skills_Set", txtSkillsSet.Text);
        //sl.Add("@First_Degree_ID", lbl1Degree.Text);
        //sl.Add("@Second_Degree_ID", lbl2Degree.Text);
        //sl.Add("@Third_Degree_ID", lbl3Degree.Text);
        //sl.Add("@Fourth_Degree_ID", lbl4Degree.Text);
        /*sl.Add("@Department_ID", ddDepartment.SelectedItem.Value);
        sl.Add("@Designation_ID", ddDesignation.SelectedItem.Value);*/
        //sl.Add("@Job_ID", lblJobType.Text);
        //sl.Add("@Prev_Company", lblPreviousComName.Text);
        //sl.Add("@PreDept_ID ", lblPreviousDept.Text);
        //sl.Add("@DOJ", lblDOJ.Text);
        //sl.Add("@DOL", lblDOL.Text);
        //sl.Add("@Last_Salary", lblLastSalary.Text);
        //sl.Add("@Experience", lblExperience.Text);
        //sl.Add("@Pre_Com_Contact", lblPreComContact.Text);
        //sl.Add("@Pre_Com_Email_ID", lblPreComEmailID.Text);
        sl.Add("@E_Person_Name", txtE_PersonaName.Text);
        sl.Add("@E_Relationship", txtE_Relation.Text);
        sl.Add("@E_Address", txtE_Address.Text);
        sl.Add("@E_Contact_No", txtE_ContactNo.Text);
        sl.Add("@Password", txtPassword.Text);
        sl.Add("@Security_ID", ddSecurityQuestion.SelectedItem.Value);
        sl.Add("@Security_Answer", txtSecurity.Text);
        //sl.Add("@Passport_No", lblPassportNo.Text);
        //sl.Add("@Bank_Acc_No", lblBankAccNo.Text);
        //sl.Add("@PF_No", lblPFNo.Text);
        //sl.Add("@Prev_Designation_ID", lblPreviousDesignation.Text);
        ERP.ExecuteNonQuerySP("emp_reg_sp", sl);
    }
}