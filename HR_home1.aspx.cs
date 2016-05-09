using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class HR_Home1 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Session["log_in2"]==null)
            {
                Response.Redirect("Default.aspx");
            }
        }
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        Session["log_in2"] = null;
        Response.Redirect("Default.aspx");
    }
}