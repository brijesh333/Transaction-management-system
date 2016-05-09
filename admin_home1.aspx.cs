using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_home1 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Session["log_in_admin"] == null)
            {
                Response.Redirect("Default.aspx");
            }
        }      
    }
   
    protected void btnLog_Out_Click(object sender, EventArgs e)
    {
        Session["log_in_admin"] = null;
        Response.Redirect("Default.aspx");        
    }
}