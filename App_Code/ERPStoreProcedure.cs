using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;
using System.Collections;
using System.Text;
using System.Security.Cryptography;
using System.IO; //for sorted list.

/// <summary>
/// Summary description for ERPStoreProcedure
/// </summary>
public class ERPStoreProcedure
{
    String constr = System.Configuration.ConfigurationManager.ConnectionStrings["DatabaseConnectionString"].ConnectionString;
    public static string KEY = "K6u8#m2a";
	public ERPStoreProcedure()
	{
		//
		// TODO: Add constructor logic here
		//
	}

    //Insert,Update,Delete....
    public int ExecuteNonQuery1(string str)
    {
        //String constr = System.Configuration.ConfigurationManager.ConnectionStrings["ERPSolutionConnectionString"].ConnectionString;

        SqlConnection con = new SqlConnection(constr);

        SqlCommand cmd = new SqlCommand(str, con);


        int result = 0;

        try
        {

            con.Open();
            result = cmd.ExecuteNonQuery();


            con.Close();
        }
        catch (Exception ex)
        {
            result = -1;
            try
            {
                if (con.State == ConnectionState.Open)
                {
                    con.Close();
                }
            }
            catch (Exception ex2)
            {
                // ErrHandler.WriteError(ex2.ToString());
            }
            // ErrHandler.WriteError(ex.ToString());
        }

        return result;

    }

    //to get Single value....
    public Object ExecuteScalarQuery(String str)
    {
        //String constr = System.Configuration.ConfigurationManager.ConnectionStrings["ERPSolutionConnectionString"].ConnectionString;

        SqlConnection con = new SqlConnection(constr);



        SqlCommand cmd = new SqlCommand(str, con);

        Object result = null;

        try
        {

            con.Open();
            result = cmd.ExecuteScalar();

        }
        catch (Exception ex)
        {
            if (con.State == ConnectionState.Open)
                con.Close();

        }
        finally
        {
            if (con.State == ConnectionState.Open)
                con.Close();
        }


        return result;
    }
    //"SELECT Mail_From as from, Mail_To, Mail_Subject, Mail_Body, Mail_SendDate FROM SendMail"
    //to get one row OR multiple row...
    public SqlDataReader GetDataReaderQuery(string str)
    {        
        //String constr = System.Configuration.ConfigurationManager.ConnectionStrings["ERPSolutionConnectionString"].ConnectionString;
        SqlConnection con = new SqlConnection(constr);

        SqlCommand cmd = new SqlCommand(str, con);
        SqlDataReader dr;
        int x;

        try
        {

            con.Open();
            dr = cmd.ExecuteReader();
        }

        catch (Exception ex)
        {
            //	websurveytool.ErrHandler.WriteError(ex.ToString);
            return null;
        }

        // Return the datareader result
        return dr;
        dr.Close();
    }

    //For stored procedure....

    //for insert,update, delete...
    public int ExecuteNonQuerySP(string sp, SortedList sl)
    {
        //String constr = System.Configuration.ConfigurationManager.ConnectionStrings["ERPSolutionConnectionString"].ConnectionString;
        SqlConnection con = new SqlConnection(constr);
        SqlCommand cmd = new SqlCommand(sp, con);
        int result = 0;

        try
        {
            cmd.CommandType = CommandType.StoredProcedure;

            for (int x = 0; x <= sl.Count - 1; x++)
            {
                cmd.Parameters.AddWithValue((String)sl.GetKey(x), sl.GetByIndex(x));
            }
            
            con.Open();
            
            result = cmd.ExecuteNonQuery(); 

            con.Close();
        }
        catch (Exception ex)
        {
            result = -2;
            try
            {
                if (con.State == ConnectionState.Open)
                {
                    con.Close();
                }
            }
            catch (Exception ex2)
            {
                // ErrHandler.WriteError(ex2.ToString());
            }
            // ErrHandler.WriteError(ex.ToString());
        }
        return result;
        }


    public Object ExecuteScalarSP(String sp, SortedList sl)
    {
        //String constr = System.Configuration.ConfigurationManager.ConnectionStrings["ERPSolutionConnectionString"].ConnectionString;
        SqlConnection con = new SqlConnection(constr);
        SqlCommand cmd = new SqlCommand(sp, con);
        Object result = null;

        try
        {
            cmd.CommandType = CommandType.StoredProcedure;

            for (int i = 0; i < sl.Count; i++)
            {
                cmd.Parameters.AddWithValue((String)sl.GetKey(i), sl.GetByIndex(i));
            }

            con.Open();
            result = cmd.ExecuteScalar();
            //myConnection.Close();
        }
        catch (Exception ex)
        {
            if (con.State == ConnectionState.Open)
                con.Close();
            // ErrHandler.WriteError(ex.ToString());
        }
        finally
        {
            if (con.State == ConnectionState.Open)
                con.Close();
        }
        return result;
    }


    public SqlDataReader GetDataReaderSP(string sSQL, SortedList paramList)
    {

        //String constr = System.Configuration.ConfigurationManager.ConnectionStrings["ERPSolutionConnectionString"].ConnectionString;
        SqlConnection con = new SqlConnection(constr);

        SqlCommand cmd = new SqlCommand(sSQL, con);
        SqlDataReader dr;
        int x;

        try
        {
            cmd.CommandType = CommandType.StoredProcedure;
            for (x = 0; x <= paramList.Count - 1; x++)
            {
                cmd.Parameters.AddWithValue((String)paramList.GetKey(x), paramList.GetByIndex(x));
            }
            con.Open();
          
            dr = cmd.ExecuteReader(CommandBehavior.CloseConnection);
        }
        catch (Exception ex)
        {
            //	websurveytool.ErrHandler.WriteError(ex.ToString);
            return null;
        }
        
        // Return the datareader result
        return dr;
    }
    public string DecryptQueryString(string stringToDecrypt)
    {
        byte[] key = { };
        byte[] IV = { 0x01, 0x12, 0x23, 0x34, 0x45, 0x56, 0x67, 0x78 };
        stringToDecrypt = stringToDecrypt.Replace(" ", "+");
        byte[] inputByteArray = new byte[stringToDecrypt.Length];

        try
        {
            key = Encoding.UTF8.GetBytes(KEY);
            DESCryptoServiceProvider des = new DESCryptoServiceProvider();
            inputByteArray = Convert.FromBase64String(stringToDecrypt);
            MemoryStream ms = new MemoryStream();
            CryptoStream cs = new CryptoStream(ms, des.CreateDecryptor(key, IV), CryptoStreamMode.Write);
            cs.Write(inputByteArray, 0, inputByteArray.Length);
            cs.FlushFinalBlock();
            Encoding encoding = Encoding.UTF8;
            return encoding.GetString(ms.ToArray());
        }
        catch (Exception ex)
        {
            throw ex;
        }
    }
    public string EncryptQueryString(string stringToEncrypt)
    {
        byte[] key = { };
        byte[] IV = { 0x01, 0x12, 0x23, 0x34, 0x45, 0x56, 0x67, 0x78 };
        try
        {
            key = Encoding.UTF8.GetBytes(KEY);
            using (DESCryptoServiceProvider oDESCrypto = new DESCryptoServiceProvider())
            {
                byte[] inputByteArray = Encoding.UTF8.GetBytes(stringToEncrypt);
                MemoryStream oMemoryStream = new MemoryStream();
                CryptoStream oCryptoStream = new CryptoStream(oMemoryStream,
                oDESCrypto.CreateEncryptor(key, IV), CryptoStreamMode.Write);
                oCryptoStream.Write(inputByteArray, 0, inputByteArray.Length);
                oCryptoStream.FlushFinalBlock();
                return Convert.ToBase64String(oMemoryStream.ToArray());
            }
        }
        catch (Exception ex)
        {
            throw ex;
        }
    }
}