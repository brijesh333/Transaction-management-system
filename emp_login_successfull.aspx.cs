using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Collections;
public partial class emp_login_successfull : System.Web.UI.Page
{
    ERPStoreProcedure ERP = new ERPStoreProcedure();

    protected void Page_Load(object sender, EventArgs e)
    {        
        lblDName.Text = Session["U_Name"].ToString();
        country_bind();
        if (!IsPostBack)
        {
            country_bind();            
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


    protected void Button1_Click(object sender, EventArgs e)
    {
        Panel1.Visible = true;
        Button1.Visible = false;
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
            lblDesignation.Text= dr["Prev_Designation_ID"].ToString();
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
            txtSecurityAnswer.Text = dr["Security_Answer"].ToString();
            lblPassportNo.Text = dr["Passport_No"].ToString();
            lblBankAccNo.Text = dr["Bank_Acc_No"].ToString();
            lblPFNo.Text = dr["PF_No"].ToString();
            }            
    }
    protected void btnLeave_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/Manager/Leave Form.aspx");
    }
    protected void btnUpdate_Click(object sender, EventArgs e)
    {

    }
}