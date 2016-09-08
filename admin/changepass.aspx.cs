using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_changepass : System.Web.UI.Page
{
        SqlHelper ob = new SqlHelper();

    protected void Page_Load(object sender, EventArgs e)
    {
        btn1.Attributes.Add("onclick", "return validation()");

    }

    protected void btn1_Click(object sender, EventArgs e)
    {
        string[] param = { "@action", "@adminid" };
        object[] value = { "Getadminpassword", Session["adminid"] };
        ob.RetiveDS(param, value, "adminproc");
        if (ob.ds.Tables[0].Rows.Count > 0)
        {
            if (ob.ds.Tables[0].Rows[0].ItemArray[0].ToString() == txtcurr.Text)
            {
                string[] parm = { "@action", "@adminpass", "@adminid" };
                object[] valu = { "adminpassupdate", txtnewpass.Text, Session["adminid"] };
                if (SqlHelper.Insert_Stmt(parm, valu, "adminproc") > 0)
                {
                    Label1.Text = "password updated";
                }
            }
            else
            {
                Label1.Text = "invalid current password";
            }
        }
    }
}