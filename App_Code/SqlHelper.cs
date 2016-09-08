using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

/// <summary>
/// Summary description for SqlHelper
/// </summary>
public class SqlHelper
{
    public static SqlConnection con;
    public static SqlCommand cmd;
    public static SqlDataAdapter da;
    public static SqlParameter pa;
    public DataSet ds = new DataSet();

    public SqlHelper()
    {
        //
        // TODO: Add constructor logic here
        //
        con = new SqlConnection(ConfigurationManager.ConnectionStrings["constr"].ToString());
    }
    public static int Insert_Stmt(string[] param, object[] val, string procname)
    {
        int res = 0;
        try
        {
            if (con.State == ConnectionState.Closed)
            {
                con.Open();
            }
            cmd = new SqlCommand(procname, con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandTimeout = 20000000;
            for (int i = 0; i < param.Length; i++)
            {
                pa = new SqlParameter(param[i], val[i]);
                cmd.Parameters.Add(pa);
            }
            res = cmd.ExecuteNonQuery();
        }
        catch (Exception)
        {
        }
        finally
        {
            con.Close();
        }

        return res;
    }
    public DataSet RetiveDS(string[] param, object[] val, string procname)
    {
        try
        {
            if (con.State == ConnectionState.Closed)
            {
                con.Open();
            }
            cmd = new SqlCommand(procname, con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandTimeout = 20000000;
            for (int i = 0; i < param.Length; i++)
            {
                pa = new SqlParameter(param[i], val[i]);
                cmd.Parameters.Add(pa);
            }
            da = new SqlDataAdapter(cmd);
            ds.Reset();
            ds.Clear();
            da.Fill(ds);
        }
        catch (Exception)
        {
        }
        finally
        {
            con.Close();
        }

        return ds;
    }
}