using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class feedback1 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    public void reset()
    {
        txtName.Text = " ";
        txtEmailID.Text = " ";
        txtFeedback.Text = " ";
    }
    protected void btnReset_Click(object sender, EventArgs e)
    {
        reset();   
    }
    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        Label1.Text = "We get your valuable feedback.....Thank you ....";
        reset();
    }
}