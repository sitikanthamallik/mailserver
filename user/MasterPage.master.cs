using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class user_MasterPage : System.Web.UI.MasterPage
{
    SqlHelper ob = new SqlHelper();

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["userid"] == null || Session["userid"] == "")
        {
            Response.Redirect("~/userlogin.aspx");
        }
        else
        {
            string[] parm = { "@action", "@userid" };
            object[] valu = { "getdata", Session["userid"] };
            ob.RetiveDS(parm, valu, "proc_regd");
            if (ob.ds.Tables[0].Rows.Count > 0)
            {
                lblname.Text = ob.ds.Tables[0].Rows[0].ItemArray[0].ToString();
                Image1.ImageUrl = "~/user/profileimage/" + ob.ds.Tables[0].Rows[0].ItemArray[1].ToString();

            }
        }
    }
    protected void LinkButton1_Click(object sender, EventArgs e)
    {
        Session.Abandon();
        Session.Clear();
        Response.Redirect("~/userlogin.aspx");
    }
    protected void LinkButton2_Click(object sender, EventArgs e)
    {
        Response.Redirect("viewevent.aspx");
    }
    protected void LinkButton3_Click(object sender, EventArgs e)
    {

        Response.Redirect("searchview.aspx?ser=" +txtsearch.Text);



    }
}
