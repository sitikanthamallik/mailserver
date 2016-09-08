using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class user_composemsg : System.Web.UI.Page
{
    SqlHelper ob = new SqlHelper();
    string file="";
    protected void Page_Load(object sender, EventArgs e)
    {
        
    }
    protected void btn1_Click(object sender, EventArgs e)
    {
        if (attachfile.HasFiles)
        {
            attachfile.PostedFile.SaveAs(Server.MapPath("~/user/attachfile/" + attachfile.FileName));
            file = attachfile.FileName;
        }
        string[] parm = { "@action", "@SendTo", "@SendFrom", "@Subject", "@Message", "@AttachFile", "@Status", "@Date" };
        object[] valu = { "Insert", txtto.Text, Session["userid"], txtsub.Text, txtmsg.Text, attachfile.FileName, "no", DateTime.Now.ToString() };
        if (SqlHelper.Insert_Stmt(parm, valu, "inboxproc") > 0)
        {
            string[] parm1 = { "@action", "@Sendto", "@Sendfrom", "@Subject", "@Message", "@AttachFile", "@Status", "@Date" };
            object[] valu1 = { "Insert", txtto.Text, Session["userid"], txtsub.Text, txtmsg.Text, attachfile.FileName, "no", DateTime.Now.ToString() };
            if (SqlHelper.Insert_Stmt(parm1, valu1, "sentproc") > 0)
            {
                Response.Write("<script>alert('inserted')</script>");

            }
        }

    }
    protected void btn2_Click(object sender, EventArgs e)
    {
        if (attachfile.HasFiles)
        {
            file = attachfile.FileName;
        }
        string[] parm2 = { "@action", "@Userid", "@Sub", "@Message", "@AttachFile",  "@Date" };
        object[] valu2 = { "Insert", Session["userid"], txtsub.Text, txtmsg.Text, attachfile.FileName,  DateTime.Now.ToString() };
        if (SqlHelper.Insert_Stmt(parm2, valu2, "draftproc") > 0)
        {
                Response.Write("<script>alert('saved to draft')</script>");

            
        }

    }
}