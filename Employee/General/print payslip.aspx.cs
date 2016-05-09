using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Employee_General_print_payslip : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Page.IsPostBack == false)
        {
            string htmlcode = Convert.ToString(Session["htmlcodetoprint"]);
            Session["htmlcodetoprint"] = null;
            Response.Write(htmlcode);
            Response.Write("<script language='javascript'>window.print();</script>");
        }
    }
}