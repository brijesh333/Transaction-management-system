using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Web.Security;
using System.Web.UI.HtmlControls;
using System.Data.OleDb;
using System.Data.SqlClient;
using System.IO;
using System.Diagnostics;

public partial class Smartcard : System.Web.UI.Page
{    
    ERPStoreProcedure ERP = new ERPStoreProcedure();
    string sqlstmt = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        Process p = new Process();
        p.StartInfo.FileName = @"D:\MIS\Smartcomm.exe";
        // p.StartInfo.FileName = @"D:\MIS\Smartcomm.exe";
        p.StartInfo.Arguments = " /A";
        p.Start();

        bindgrid();
        DeleteDuplication();
        //bindDataGrid();

    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        SortedList s1 = new SortedList();
        s1.Add("@query", "Findata");
        SqlDataReader dr = ERP.GetDataReaderSP("UserSp", s1);
        DataTable ds = new DataTable();
        ds.Load(dr);
        if (ds.Rows.Count > 0)
        {
            GridView1.DataSource = ERP.GetDataReaderSP("UserSp", s1);
            GridView1.DataBind();
        }
        else
        {

        }
    }

    public void DeleteDuplication()
    {
        SortedList s1 = new SortedList();
        s1.Add("@query", "DeleteDulplicateRows");
        ERP.ExecuteNonQuerySP("UserSp", s1);
    }
    public void bindDataGrid()  
    {
        //DELETE  FROM Txt WHERE ID NOT IN ( SELECT MAX(ID) FROM Txt GROUP BY Dt, Tm)
        SortedList s1 = new SortedList();
        s1.Add("@query", "BindThreeTables");
        SqlDataReader dr = ERP.GetDataReaderSP("UserSp", s1);
        DataTable ds = new DataTable();
        ds.Load(dr);
        if (ds.Rows.Count > 0)
        {
            GridView1.DataSource = ds;
            GridView1.DataBind();
        }
        else
        {
            GridView1.DataSource = null;
            GridView1.DataBind();
        }
    }

    public void bindgrid()    
    {
        string txtFileName = "*" + DateTime.Now.Month.ToString() + "_" + DateTime.Now.Year.ToString().Substring(2, 2) + ".txt";

        //string[] importfiles = Directory.GetFiles(@"D:\MIS", "*10_12.txt"); 
        string[] importfiles = Directory.GetFiles(@"D:\MIS\", txtFileName);//(@"D:\", txtFileName);
        // using (SqlConnection con = new SqlConnection("Data Source=Aliabbas;Initial Catalog=StDb;Integrated Security=True"))
        using (SqlConnection con = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["DatabaseConnectionString"].ToString()))
        {
            string sqlStatement = "INSERT INTO Txt (UserId, Dt, Tm) VALUES     (@Text,@Date,@Time)";
           using (SqlCommand cmd = new SqlCommand(sqlStatement, con))
            {
               cmd.Parameters.Add("@Text", SqlDbType.VarChar, 4000);
                
               cmd.Parameters.Add("@Date", SqlDbType.DateTime);

                // loop through all files found
                foreach (string importfile in importfiles)
                {
                    // read the lines from the text file
                    string[] allLines = File.ReadAllLines(importfile);

                    con.Open();

                    // start counting from index = 1 --> skipping the header (index=0)
                    for (int index = 0; index < allLines.Length; index++)
                    {
                        string[] items = allLines[index].Split(new char[] { '|' });
                        string[] spl = items[0].ToString().Split(' ');
                        string datenew = spl[1].ToString();
                        string yearnew = datenew.Substring(0, 4);
                        string monthnew = datenew.Substring(4, 2);
                        string dateenew = datenew.Substring(6, 2);

                        DateTime dt = Convert.ToDateTime(dateenew + "/" + monthnew + "/" + yearnew);
                        //DateTime dt = Convert.ToDateTime(monthnew + "/" + dateenew + "/" + yearnew);
                        //DateTime dt = Convert.ToDateTime(monthnew + "/" + dateenew + "/" + yearnew);

                        //cmd.Parameters.Add("@Date", dt);
                        cmd.Parameters.Add("@Time", spl[3]);
                        //cmd.Parameters.Add("@Text",spl[5]);

                      //  cmd.ExecuteNonQuery();
                        SortedList s = new SortedList();
                        s.Add("@query","Insert1");
                        s.Add("@Date", dt);
                        s.Add("@Time", spl[3]);
                        s.Add("@Text", spl[5]);
                        ERP.ExecuteNonQuerySP("UserSp", s);
                    }
                    con.Close();
                }
            }
        }
    }
}
