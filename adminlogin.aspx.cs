using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_adminlogin : System.Web.UI.Page
{
    SqlHelper ob = new SqlHelper();
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Button1_Click(object sender, EventArgs e)
    {

        string[] param = { "@action", "@adminid" };
        object[] value = { "Getadminpassword", txtadmin.Text };
        ob.RetiveDS(param, value, "adminproc");
        if (ob.ds.Tables[0].Rows.Count > 0)
        {
            if (ob.ds.Tables[0].Rows[0].ItemArray[0].ToString() == txtpass.Text)
            {
                Session["adminid"] = txtadmin.Text;
                Response.Redirect("~/admin/changepass.aspx");
            }
            else
            {
                Lbl.Text = "invalid password";
            }


        }


        else
        {
            Lbl.Text = "invalid userid";
        }
    }
    protected void LinkButton1_Click(object sender, EventArgs e)
    {
        Response.Redirect("adminforgotpass.aspx");
    }
}