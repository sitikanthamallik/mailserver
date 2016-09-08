using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class user_trashdetails : System.Web.UI.Page
{
    SqlHelper ob = new SqlHelper();
    string file = "";
    public void disp()
    {
        string[] param9 = { "@action", "@trashid" };
        object[] value9 = { "viewtrash", Request.QueryString["id"] };
        ob.RetiveDS(param9, value9, "trashproc");
        if (ob.ds.Tables[0].Rows.Count > 0)
        {
            lbluserid.Text = ob.ds.Tables[0].Rows[0].ItemArray[1].ToString();
            lblusername.Text = ob.ds.Tables[0].Rows[0].ItemArray[2].ToString();
            if (ob.ds.Tables[0].Rows[0].ItemArray[7].ToString() == "")
            {
                Label12.Visible = true;
                lblsubject.Visible = false;
            }
            else
            {
                lblsubject.Text = ob.ds.Tables[0].Rows[0].ItemArray[7].ToString();
            }

            if (ob.ds.Tables[0].Rows[0].ItemArray[5].ToString() == "")
            {
                lblbody.Visible = false;
                Label11.Visible = true;
            }
            else
            {
                lblbody.Text = ob.ds.Tables[0].Rows[0].ItemArray[5].ToString();

            }
            if (ob.ds.Tables[0].Rows[0].ItemArray[6].ToString() == "")
            {
                HyperLink1.Visible = false;
                Label9.Visible = true;
            }
            else
            {
                HyperLink1.NavigateUrl = "~/user/attachfile/" + ob.ds.Tables[0].Rows[0].ItemArray[6].ToString();
                HyperLink1.Text = ob.ds.Tables[0].Rows[0].ItemArray[6].ToString();
            }
            profilepic.ImageUrl = "~/user/profileimage/" + ob.ds.Tables[0].Rows[0].ItemArray[9].ToString();
            lblsendto.Text = ob.ds.Tables[0].Rows[0].ItemArray[3].ToString();
            lbldate.Text = ob.ds.Tables[0].Rows[0].ItemArray[8].ToString();
        }
    }
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            disp();

        }
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        string[] parm1 = { "@action", "@trashid" };
        object[] valu1 = { "Delete", Request.QueryString["id"] };
        if (SqlHelper.Insert_Stmt(parm1, valu1, "trashproc") > 0)
        {
            Response.Write("<script>alert('deleted from trash')</script>");
            Response.Redirect("trashview.aspx");
            
        }
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        string[] parm = { "@action", "@SendTo", "@SendFrom", "@Subject", "@Message", "@AttachFile", "@Status", "@Date" };
        object[] valu = { "Insert", lblsendto.Text, Session["userid"], lblsubject.Text, lblbody.Text, HyperLink1.Text, "no", lbldate.Text };
        if (SqlHelper.Insert_Stmt(parm, valu, "inboxproc") > 0)
        {
            string[] parm1 = { "@action", "@Sendto", "@Sendfrom", "@Subject", "@Message", "@AttachFile", "@Status", "@Date" };
            object[] valu1 = { "Insert", lblsendto.Text, Session["userid"], lblsubject.Text, lblbody.Text, HyperLink1.Text, "no", lbldate.Text };
            if (SqlHelper.Insert_Stmt(parm1, valu1, "sentproc") > 0)
            {
                string[] parm4 = { "@action", "@trashid" };
                object[] valu4 = { "Delete", Request.QueryString["id"] };
                if (SqlHelper.Insert_Stmt(parm4, valu4, "trashproc") > 0)
                {
                    Response.Write("<script>alert('message restored')</script>");

                    Response.Redirect("trashview.aspx");
                }

            }
        }
    }
    protected void LinkButton1_Click(object sender, EventArgs e)
    {
        Response.Redirect("trashview.aspx");
    }
}