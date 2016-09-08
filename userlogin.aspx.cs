using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class user_userlogin : System.Web.UI.Page
{
    SqlHelper ob = new SqlHelper();
    protected void Page_Load(object sender, EventArgs e)
    {

    }
  
    protected void Button2_Click(object sender, EventArgs e)
    {
        string[] param = { "@action", "@userid" };
        object[] value = { "Getpassword", txtuid.Text };
        ob.RetiveDS(param, value, "proc_regd");
        if (ob.ds.Tables[0].Rows.Count > 0)
        {
            if (ob.ds.Tables[0].Rows[0].ItemArray[0].ToString() == txtpass.Text)
            {
                Session["userid"] = txtuid.Text;
                Response.Redirect("~/user/inboxview.aspx");
            }
            else
            {
                Label1.Text = "invalid password";
            }


        }


        else
        {
            Label1.Text = "invalid userid";
        }
    }
    protected void LinkButton1_Click(object sender, EventArgs e)
    {
        Response.Redirect("forgotpass.aspx");
    }
}