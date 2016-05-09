using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Collections;

public partial class HOD_Account_View_Employee_Detail : System.Web.UI.Page
{
    ERPStoreProcedure ERP = new ERPStoreProcedure();
    protected void Page_Load(object sender, EventArgs e)
    {
        grid_bind();
        GridView1.Visible = true;
        Panel1.Visible = false;
    }

    public void grid_bind()
    {
        SortedList sl = new SortedList();
        sl.Add("@query","Select Emp_dept_branch_grid");
        sl.Add("@Department_ID",Session["Department_ID"].ToString());
        sl.Add("@Working_Branch_ID", Session["Working_Branch_ID"].ToString());
        GridView1.DataSource = ERP.GetDataReaderSP("emp_reg_sp",sl);
        GridView1.DataBind();
    }
    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {
        
    }
    protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "Vieww")
        {
            GridView1.Visible = false;
            Panel1.Visible = true;
            SortedList sl = new SortedList();
            sl.Add("@query", "Select1");
            sl.Add("@Employee_ID", e.CommandArgument.ToString());
            SqlDataReader dr = ERP.GetDataReaderSP("emp_reg_sp", sl);
            while (dr.Read())
            {
                lblFullName.Text = dr["Full_Name"].ToString();
                lblPAddress.Text = dr["Parmenant_Address"].ToString();
                lblCAddress.Text = dr["Current_Address"].ToString();
                lblDOB.Text = dr["DOB"].ToString();
                lblGender.Text = dr["Gender"].ToString();
                lblMaritalStatus.Text = dr["Marital_Status"].ToString();
                lblCountry.Text = dr["Country_ID"].ToString();
                lblState.Text = dr["State_ID"].ToString();
                lblCity.Text = dr["City_ID"].ToString();
                lblPinCode.Text = dr["Pin_Code"].ToString();
                lblEContactNo.Text = dr["Contact_No"].ToString();
                lblEmailID.Text = dr["Email"].ToString();
                lblBloodGroup.Text = dr["Blood_Group"].ToString();
                lblQualification.Text = dr["Qualification"].ToString();
                lblAffectedUniversity.Text = dr["Affiliated_University"].ToString();
                lblSkillSet.Text = dr["Skills_Set"].ToString();
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
                lblPersonName.Text = dr["E_Person_Name"].ToString();
                lblRelationship.Text = dr["E_Relationship"].ToString();
                lblAddress.Text = dr["E_Address"].ToString();
                lblEContactNo.Text = dr["E_Contact_No"].ToString();                                
            }            
        }
    }
}