using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Manager_Default_Manager : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btnViewLeave_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/Manager/leave active HOD.aspx");
    }
}