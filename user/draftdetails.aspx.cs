using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class user_draftdetails : System.Web.UI.Page
{
    SqlHelper ob = new SqlHelper();
    string file = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            disp();

        }
    }
    public void disp()
   {
    string[] param4 = { "@action", "@DraftID" };
    object[] value4 = { "getdraft", Request.QueryString["id"] };
        ob.RetiveDS(param4, value4, "draftproc");
        if (ob.ds.Tables[0].Rows.Count > 0)
        {   
            txtsub.Text = ob.ds.Tables[0].Rows[0].ItemArray[4].ToString();
            txtmsg.Text = ob.ds.Tables[0].Rows[0].ItemArray[5].ToString();
            if (ob.ds.Tables[0].Rows[0].ItemArray[6].ToString() == "")
            {
                HyperLink1.Visible = false;
                attachfile.Visible = true;
            }
            else
            {
                HyperLink1.Visible = true;

                HyperLink1.NavigateUrl = "~/user/attachfile/" + ob.ds.Tables[0].Rows[0].ItemArray[6].ToString();
                HyperLink1.Text = ob.ds.Tables[0].Rows[0].ItemArray[6].ToString();
                
            }
        }

}
    protected void btn1_Click(object sender, EventArgs e)
    {
        if (attachfile.HasFiles)
        {
            attachfile.PostedFile.SaveAs(Server.MapPath("~/user/attachfile/" + attachfile.FileName));
            file = attachfile.FileName;
        }
        else
        {
        file=HyperLink1.Text;
        }
        string[] parm = { "@action", "@SendTo", "@SendFrom", "@Subject", "@Message", "@AttachFile", "@Status", "@Date" };
        object[] valu = { "Insert", txtto.Text, Session["userid"], txtsub.Text, txtmsg.Text, file, "no", DateTime.Now.ToString() };
        if (SqlHelper.Insert_Stmt(parm, valu, "inboxproc") > 0)
        {
            string[] parm1 = { "@action", "@Sendto", "@Sendfrom", "@Subject", "@Message", "@AttachFile", "@Status", "@Date" };
            object[] valu1 = { "Insert", txtto.Text, Session["userid"], txtsub.Text, txtmsg.Text, file, "no", DateTime.Now.ToString() };
            if (SqlHelper.Insert_Stmt(parm1, valu1, "sentproc") > 0)
            {
                string[] parm2 = { "@action", "@DraftID" };
                object[] valu2 = { "Delete",Request.QueryString["id"]  };
           
                if (SqlHelper.Insert_Stmt(parm2, valu2, "draftproc") > 0)
                {
                    Response.Write("<script>alert('sent')</script>");
                    
                }

            }
        }
     
    }
    
    protected void LinkButton1_Click(object sender, EventArgs e)
    {
        Response.Redirect("draftview.aspx");
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        if (attachfile.HasFiles)
        {
            file = attachfile.FileName;
        }
        string[] parm2 = { "@action", "@Userid", "@Sub", "@Message", "@AttachFile", "@Date", "@DraftID" };
        object[] valu2 = { "updatedraft", Session["userid"], txtsub.Text, txtmsg.Text, attachfile.FileName, DateTime.Now.ToString(), Request.QueryString["id"] };
        if (SqlHelper.Insert_Stmt(parm2, valu2, "draftproc") > 0)
        {
            Response.Write("<script>alert('saved to draft')</script>");


        }
    }
    protected void Button3_Click(object sender, EventArgs e)
    {
        string[] parm1 = { "@action", "@DraftID" };
        object[] valu1 = { "Delete", Request.QueryString["id"] };
        if (SqlHelper.Insert_Stmt(parm1, valu1, "draftproc") > 0)
        {
            Response.Write("<script>alert('deleted ')</script>");
            Response.Redirect("draftview.aspx");

        }
    }
}