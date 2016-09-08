using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_newsitem : System.Web.UI.Page
{
    SqlHelper ob = new SqlHelper();
    protected void Page_Load(object sender, EventArgs e)
    {
        btn1.Attributes.Add("onclick", "return validation()");
    }
    protected void btn1_Click(object sender, EventArgs e)
    {
        if (newsimage.HasFile)

        {  string[] parm = { "@action", "@headlines", "@details", "@newsimage", "@date" };
        object[] valu = { "Insert",txtheadline.Text, txtdetails.Text,newsimage.FileName, DateTime.Now.ToShortDateString() };

        newsimage.PostedFile.SaveAs(Server.MapPath("~/admin/newsimage/" + newsimage.FileName));
        if (SqlHelper.Insert_Stmt(parm, valu, "newsproc") > 0)
        {
            Response.Write("<script>alert('News Inserted')</script>");
        }
      }
    }
}