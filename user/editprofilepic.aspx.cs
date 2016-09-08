using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class user_editprofilepic : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Button1.Attributes.Add("onclick", "return validation()");

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        if (FileUpload1.HasFile)
        {


            FileUpload1.PostedFile.SaveAs(Server.MapPath("~/user/profileimage/" + FileUpload1.FileName));

            string[] parm = { "@action", "@profilepic", "@userid" };
            object[] valu = { "profileimgupdate", FileUpload1.FileName, Session["userid"] };
            if (SqlHelper.Insert_Stmt(parm, valu, "proc_regd") > 0)
            {
                Label1.Text = "profile image  updated";
            }
        }
        else
        {
            Label1.Text = "please select file";
        }
    }
}