using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.Sql;
using System.Data.SqlClient;
using System.Collections;

public partial class product_detail_master1 : System.Web.UI.Page
{
    ERPStoreProcedure ERP = new ERPStoreProcedure();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            product_bind();
            grid_bind();
        }
    }

    public void product_bind()
    {
        SortedList sl = new SortedList();
        sl.Add("@query", "Select grid");
        ddMainProduct.DataSource = ERP.GetDataReaderSP("product_sp", sl);
        ddMainProduct.DataTextField = "Product_Name";
        ddMainProduct.DataValueField = "Product_Main_ID";
        ddMainProduct.DataBind();
        subproduct_bind();
    }

    public void subproduct_bind()
    {
        SortedList sl = new SortedList();
        sl.Add("@query", "Select product");
        sl.Add("@Product_Main_ID", ddMainProduct.SelectedItem.Value);
        ddSubProduct.DataSource = ERP.GetDataReaderSP("Productsub_sp", sl);
        ddSubProduct.DataTextField = "ProductSub_Name";
        ddSubProduct.DataValueField = "ProductSub_ID";
        ddSubProduct.DataBind();
    }
    public void clear_data()
    {
        txtCompanyAddress.Text="";
        txtCompanyName.Text="";
        txtDes.Text = "";
        txtOtherProductColour.Text = "";
        txtProductCode.Text = "";
        txtProductModel.Text = "";
        txtProductname.Text = "";
        txtProductPrice.Text = "";
    }
    public void color_clear()
    {
        for (int i = 0; i < cbProductcolor.Items.Count; i++)
        {
            cbProductcolor.Items[i].Selected = false;
        }
    }

    public void grid_bind()
    {
        SortedList sl = new SortedList();
        sl.Add("@query", "Select grid");
        GridView1.DataSource = ERP.GetDataReaderSP("prod_form_master_sp", sl);
        GridView1.DataBind();
    }

    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        SortedList sl1 = new SortedList();
        sl1.Add("@query", "Count");
        sl1.Add("@Prod_Name", txtProductname.Text);
        string count = ERP.ExecuteScalarSP("prod_form_master_sp", sl1).ToString();
        Label1.Visible = false;
        if (count == "0")
        {
            SortedList sl = new SortedList();
            sl.Add("@query", "Insert1");
            sl.Add("@Product_Main_ID", ddMainProduct.SelectedItem.Value);
            sl.Add("@Product_Sub_ID", ddSubProduct.SelectedItem.Value);
            sl.Add("@Prod_Name", txtProductname.Text);
            sl.Add("@Prod_Description", txtDes.Text);
            sl.Add("@Prod_Code", txtProductCode.Text);
            sl.Add("@Prod_Model_No", txtProductModel.Text);
            sl.Add("@Prod_Price", txtProductPrice.Text);
            sl.Add("@Company_Name", txtCompanyAddress.Text);
            sl.Add("@Company_Address", txtCompanyAddress.Text);
            sl.Add("@Other_Color", txtOtherProductColour.Text);

            int i = 0;
            Label2.Text = null;
            for (i = 0; i < cbProductcolor.Items.Count - 1; i++)
            {
                if (cbProductcolor.Items[i].Selected)
                {
                    Label2.Text += cbProductcolor.Items[i].Text + ",";
                }
            }
            if (cbProductcolor.Items[5].Selected)
            {
                Label2.Text += txtOtherProductColour.Text;
            }
            sl.Add("@Available_Color", Label2.Text);
            ERP.ExecuteNonQuerySP("prod_form_master_sp", sl);
            grid_bind();
            clear_data();
        }
        else
        {
            Label1.Text = "Already Exist";
            Label1.Visible = true;
        }
    }


    protected void btnUpdate_Click(object sender, EventArgs e)
    {
        //SortedList sl1 = new SortedList();
        //sl1.Add("@query", "Count");
        //sl1.Add("@Prod_Name", txtProductname.Text);
        //string count = ERP.ExecuteScalarSP("prod_form_master_sp", sl1).ToString();
        //Label1.Visible = false;
        //if (count == "0")
        //{
            SortedList sl = new SortedList();
            sl.Add("@query", "Update1");
            sl.Add("@Product_ID", ViewState["Product_ID"]);
            sl.Add("@Product_Main_ID", ddMainProduct.SelectedItem.Value);
            sl.Add("@Product_Sub_ID", ddSubProduct.SelectedItem.Value);
            sl.Add("@Prod_Name", txtProductname.Text);
            sl.Add("@Prod_Description", txtDes.Text);
            sl.Add("@Prod_Code", txtProductCode.Text);
            sl.Add("@Prod_Model_No", txtProductModel.Text);
            sl.Add("@Prod_Price", txtProductPrice.Text);
            sl.Add("@Company_Name", txtCompanyName.Text);
            sl.Add("@Company_Address", txtCompanyAddress.Text);
            sl.Add("@Other_Color", txtOtherProductColour.Text);

            int i = 0;
            Label2.Text = "";
            for (i = 0; i < cbProductcolor.Items.Count - 1; i++)
            {
                if (cbProductcolor.Items[i].Selected)
                {
                    Label2.Text += cbProductcolor.Items[i].Text + ",";
                }
            }
            if (cbProductcolor.Items[5].Selected)
            {
                Label2.Text += txtOtherProductColour.Text;
            }
            sl.Add("@Available_Color", Label2.Text);
            int n = Convert.ToInt32(ERP.ExecuteNonQuerySP("prod_form_master_sp", sl));

            grid_bind();
        //}
        //else
        //{
        //    Label1.Text = "Already Exist";
        //    Label1.Visible = true;
        //}
    }
    protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "editt")
        {
            SortedList sl = new SortedList();
            sl.Add("@query", "Select1");
            sl.Add("@Product_ID", e.CommandArgument.ToString());
            SqlDataReader dr = ERP.GetDataReaderSP("prod_form_master_sp", sl);
            while (dr.Read())
            {
                int A = Convert.ToInt32(dr["Product_ID"].ToString());                
                ddMainProduct.SelectedValue = dr["Product_Main_ID"].ToString();
                subproduct_bind();
                ddSubProduct.SelectedItem.Value = dr["Product_Sub_ID"].ToString();
                txtProductname.Text = dr["Prod_Name"].ToString();
                txtDes.Text = dr["Prod_Description"].ToString();
                txtProductCode.Text = dr["Prod_Code"].ToString();
                txtProductModel.Text = dr["Prod_Model_No"].ToString();
                txtProductPrice.Text = dr["Prod_Price"].ToString();
                txtCompanyAddress.Text = dr["Company_Name"].ToString();
                txtCompanyAddress.Text = dr["Company_Address"].ToString();

                othercolour.Text = null;
                string c = dr["Available_Color"].ToString();
                string[] colours = c.Split(',');

                color_clear();
                Label4.Text = dr["Other_Color"].ToString();
                for (int k = 0; k < colours.Length; k++)
                {

                    if (colours[k] == cbProductcolor.Items[0].Text)

                        cbProductcolor.Items[0].Selected = true;

                    else if (colours[k] == cbProductcolor.Items[1].Text)
                        cbProductcolor.Items[1].Selected = true;
                    else if (colours[k] == cbProductcolor.Items[2].Text)
                        cbProductcolor.Items[2].Selected = true;
                    else if (colours[k] == cbProductcolor.Items[3].Text)
                        cbProductcolor.Items[3].Selected = true;
                    else if (colours[k] == cbProductcolor.Items[4].Text)
                        cbProductcolor.Items[4].Selected = true;

                    else
                    {
                        cbProductcolor.Items[5].Selected = true;
                        txtOtherProductColour.Visible = true;
                        othercolour.Visible = true;
                        txtOtherProductColour.Text = dr["Other_Color"].ToString();
                    }
                }
                ViewState["Product_ID"] = A;
            }
            grid_bind();
        }
        else
        {
            if (e.CommandName == "deletee")
            {
                SortedList sl = new SortedList();
                sl.Add("@query", "Delete1");
                sl.Add("@Product_ID", e.CommandArgument);
                ERP.ExecuteNonQuerySP("prod_form_master_sp", sl);
                grid_bind();
            }
        }
    }
    protected void cbProductcolor_SelectedIndexChanged1(object sender, EventArgs e)
    {
        if (cbProductcolor.Items[5].Selected)
        {
            othercolour.Visible = true;
            txtOtherProductColour.Visible = true;
        }
        else
        {
            othercolour.Visible = false;
            txtOtherProductColour.Visible = false;
        }
    }


    protected void ddMainProduct_SelectedIndexChanged1(object sender, EventArgs e)
    {
        subproduct_bind();
    }
}