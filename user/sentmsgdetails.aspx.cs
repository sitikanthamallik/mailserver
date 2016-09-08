using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class user_sentmsgdetails : System.Web.UI.Page
{
    string file = "";
    SqlHelper ob = new SqlHelper();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            disp();

        }
    }
    public void disp()
    {
        string[] param1 = { "@action", "@SendID" };
        object[] value1 = { "getsentdata", Request.QueryString["idd"] };
        ob.RetiveDS(param1, value1, "sentproc");
        if (ob.ds.Tables[0].Rows.Count > 0)
        {
            lbluserid.Text = ob.ds.Tables[0].Rows[0].ItemArray[0].ToString();
            lblusername.Text = ob.ds.Tables[0].Rows[0].ItemArray[1].ToString();
            if (ob.ds.Tables[0].Rows[0].ItemArray[4].ToString() == "")
            {
                Label12.Visible = true;
                lblsubject.Visible = false;
            }
            else
            {
                lblsubject.Text = ob.ds.Tables[0].Rows[0].ItemArray[4].ToString();
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
            if (ob.ds.Tables[0].Rows[0].ItemArray[7].ToString() == "")
            {
                HyperLink1.Visible = false;
                Label9.Visible = true;
            }
            else
            {
                HyperLink1.NavigateUrl = "~/user/attachfile/" + ob.ds.Tables[0].Rows[0].ItemArray[7].ToString();
                HyperLink1.Text= ob.ds.Tables[0].Rows[0].ItemArray[7].ToString();
            }
            profilepic.ImageUrl = "~/user/profileimage/" + ob.ds.Tables[0].Rows[0].ItemArray[2].ToString();
            lblsendto.Text = ob.ds.Tables[0].Rows[0].ItemArray[6].ToString();

        }
    }
    protected void LinkButton1_Click(object sender, EventArgs e)
    {
        Response.Redirect("sendview.aspx");

    }
    protected void LinkButton2_Click(object sender, EventArgs e)
    {
        Response.Redirect("sendview.aspx");
    }
    protected void btnsend_Click(object sender, EventArgs e)
    {    //reply
        if (lblsendto.Visible == true)
        {
            if (attachfile.HasFiles)
            {
                attachfile.PostedFile.SaveAs(Server.MapPath("~/user/attachfile/" + attachfile.FileName));
                file = attachfile.FileName;

            }
            string[] parm = { "@action", "@SendTo", "@SendFrom", "@Subject", "@Message", "@AttachFile", "@Status", "@Date" };
            object[] valu = { "Insert", lblsendto.Text, Session["userid"], txtsub.Text, txtbody.Text, attachfile.FileName, "no", DateTime.Now.ToString() };
            if (SqlHelper.Insert_Stmt(parm, valu, "inboxproc") > 0)
            {
                string[] parm1 = { "@action", "@Sendto", "@Sendfrom", "@Subject", "@Message", "@AttachFile", "@Status", "@Date" };
                object[] valu1 = { "Insert", lblsendto.Text, Session["userid"], txtsub.Text, txtbody.Text, attachfile.FileName, "no", DateTime.Now.ToString() };
                if (SqlHelper.Insert_Stmt(parm1, valu1, "sentproc") > 0)
                {
                    Response.Write("<script>alert('Message sent')</script>");

                }
            }
        }
            //forward
        else
        {

            string[] parm = { "@action", "@SendTo", "@SendFrom", "@Subject", "@Message", "@AttachFile", "@Status", "@Date" };
            object[] valu = { "Insert", txtsendto.Text, Session["userid"], txtsub.Text, lblforwardbody.Text, HyperLink1.Text, "no", DateTime.Now.ToString() };
            if (SqlHelper.Insert_Stmt(parm, valu, "inboxproc") > 0)
            {
                string[] parm1 = { "@action", "@Sendto", "@Sendfrom", "@Subject", "@Message", "@AttachFile", "@Status", "@Date" };
                object[] valu1 = { "Insert", txtsendto.Text, Session["userid"], txtsub.Text, lblforwardbody.Text, HyperLink1.Text, "no", DateTime.Now.ToString() };
                if (SqlHelper.Insert_Stmt(parm1, valu1, "sentproc") > 0)
                {
                    Response.Write("<script>alert('inserted')</script>");

                }
            }

        }
    }
    protected void btnreply_Click(object sender, EventArgs e)
    {
        lblsend.Visible = true;
        lblsub.Visible = true;
        lblattachfile.Visible = true;
        Label13.Visible = true;
        btnsend.Visible = true;
        LinkButton2.Visible = true;
        txtbody.Visible = true;
        attachfile.Visible = true;
        txtsub.Visible = true;
        lblsendto.Visible = true;
        txtsendto.Visible = false;
        HyperLink2.Visible = false;
        

    }
    protected void btnforward_Click(object sender, EventArgs e)
    {
        lblsend.Visible = true;
        lblsub.Visible = true;
        lblattachfile.Visible = true;
        Label13.Visible = true;
        btnsend.Visible = true;
        LinkButton2.Visible = true;
        txtbody.Visible = false;
        attachfile.Visible = false;
        txtsub.Visible = false;
        lblsendto.Visible = false;
        txtsendto.Visible = true;
        HyperLink2.Visible = true;
        
        if (Label12.Visible == true)
        {
            txtsub.Visible = false;
            Label15.Visible = true;
            txtsub.Text = Label15.Text;
        }
        else
        {
            txtsub.Visible = true;
            txtsub.Text = lblsubject.Text;
        }
        if (Label9.Visible == false)
        {
            Label14.Visible = false;
        }
        else
        {
            Label14.Visible = true;

        }

        if (Label11.Visible == false)
        {
            Label10.Visible = false;
            lblforwardbody.Visible = true;
            lblforwardbody.Text = lblbody.Text;
        }
        else
        {
            Label10.Visible = true;
            lblforwardbody.Visible = false;
            lblforwardbody.Text = Label12.Text;
        }
        if (HyperLink1.Visible == true)
        {
            HyperLink2.Visible = true;
            HyperLink2.Text = HyperLink1.Text;
        }
        else
        {
            HyperLink2.Visible = false;
        }

    
    }
}