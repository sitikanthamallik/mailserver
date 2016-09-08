using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_MasterPage : System.Web.UI.MasterPage
{
    SqlHelper ob = new SqlHelper();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["adminid"] == null || Session["adminid"] == "")
        {
            Response.Redirect("~/adminlogin.aspx");
        }
     

    }
}
