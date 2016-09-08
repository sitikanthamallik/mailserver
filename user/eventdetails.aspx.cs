using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class user_eventdetails : System.Web.UI.Page
{
    SqlHelper ob = new SqlHelper();
    protected void Page_Load(object sender, EventArgs e)
    {
        btnadd.Attributes.Add("onclick", "return validation()");

    }
    protected void btnadd_Click(object sender, EventArgs e)
    {
          string[] parm = { "@action","@eventid", "@event", "@description", "@eventdate","userid" };
          object[] valu = { "Insert", txteventid.Text, txteventname.Text, eventdesc.Text, eventdate.Text, Session["userid"] };

        
        if (SqlHelper.Insert_Stmt(parm, valu, "eventproc") > 0)
        {
            Response.Write("<script>alert('new event Inserted')</script>");
            Response.Redirect("inboxview.aspx");
        }
    }
}