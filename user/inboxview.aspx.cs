using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class user_inboxview : System.Web.UI.Page
{int st;
    SqlHelper ob = new SqlHelper();
    public int x = 0;
    int fst; int lst; int tot;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            disp();
        }
    }
    public void disp()
    { 
        string[] parm = { "@action", "@SendTo" };
        object[] valu = { "viewinbox", Session["userid"] };
        ob.RetiveDS(parm, valu, "inboxproc");

        if (ob.ds.Tables[0].Rows.Count > 0)
        {
            tot = ob.ds.Tables[0].Rows.Count;
            if (GridView1.PageIndex == (tot / GridView1.PageSize))
            {
                fst = (GridView1.PageIndex * GridView1.PageSize) + 1;
                lst = (GridView1.PageIndex * GridView1.PageSize) + (tot % GridView1.PageSize);
                Label2.Text = fst + "-" + lst;
            }
            else
            {
                fst = (GridView1.PageIndex * GridView1.PageSize) + 1;
                lst = (GridView1.PageIndex * GridView1.PageSize) + GridView1.PageSize;
                Label2.Text = fst + "-" + lst;
            }
                Label4.Text = " " + tot;
            
            GridView1.DataSource = ob.ds.Tables[0];
            GridView1.DataBind();
            foreach (GridViewRow r in GridView1.Rows)
            {
                if (ob.ds.Tables[0].Rows[x].ItemArray[7].ToString() == "")
                {
                    LinkButton sd = (LinkButton)r.FindControl("Subject");
                    sd.Text = "(No Subject)";
                }
                else
                {
                    LinkButton sd = (LinkButton)r.FindControl("Subject");
                    sd.Text = ob.ds.Tables[0].Rows[x].ItemArray[7].ToString();
                }
                if (ob.ds.Tables[0].Rows[x].ItemArray[9].ToString() == "no")
                {
                    Image img = (Image)r.FindControl("Image2");
                    img.ImageUrl = "~/icon/gnome_mail_unread.ico";
                    Image1.AlternateText = "no";
                }
                else
                {
                    Image img = (Image)r.FindControl("Image2");
                    img.ImageUrl = "~/icon/email_open.ico";
                    Image1.AlternateText = "yes";
                }
                x++;
            }
        }
        else
        {
            GridView1.DataSource = null;
            GridView1.DataBind();
            Label1.Visible = true;
            Image1.Visible = true;
        }
    }


    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
    protected void CheckBox2_CheckedChanged(object sender, EventArgs e)
    {
        if (CheckBox2.Checked == true)
        {
            foreach (GridViewRow r in GridView1.Rows)
            {
                CheckBox chk = (CheckBox)r.FindControl("CheckBox1");
                chk.Checked = true;
            }
            CheckBox2.Text = "Uncheck All";

        }
        else
        {
            foreach (GridViewRow r in GridView1.Rows)
            {
                CheckBox chk = (CheckBox)r.FindControl("CheckBox1");
                chk.Checked = false;

            }
            CheckBox2.Text = "Check All";

        }

    }
    protected void sendername_Click(object sender, EventArgs e)
    {
        LinkButton btn = sender as LinkButton;
        GridViewRow gr = (GridViewRow)btn.NamingContainer;
        HiddenField hid = (HiddenField)gr.Cells[0].Controls[5];
        if (Image1.AlternateText == "no")
        {
            string[] parm = { "@action", "@Status", "@InboxId" };
            object[] valu = { "changestatus", "yes", hid.Value };
            if (SqlHelper.Insert_Stmt(parm, valu, "inboxproc") > 0)
            {
                Response.Redirect("inboxdetails.aspx?id=" + hid.Value);
            }
        }
    }
    
    protected void Button1_Click(object sender, EventArgs e)
    {
        foreach (GridViewRow r in GridView1.Rows)
        {
            CheckBox chk = (CheckBox)r.FindControl("CheckBox1");
            if (chk.Checked == true)
            {

                HiddenField hid1 = (HiddenField)r.FindControl("HiddenField1");
                HiddenField hid2 = (HiddenField)r.FindControl("HiddenField2");
                HiddenField hid3 = (HiddenField)r.FindControl("HiddenField3");
                HiddenField hid4 = (HiddenField)r.FindControl("HiddenField4");
                Label lb = (Label)r.FindControl("lbltime");
                LinkButton sub = (LinkButton)r.FindControl("Subject");

                string[] parm = { "@action", "@SendTo", "@SendFrom", "@Subject", "@Message", "@AttachFile", "@Date" };
                object[] valu = { "Insert", Session["userid"], hid2.Value, sub.Text, hid3.Value, hid4.Value, lb.Text };
                if (SqlHelper.Insert_Stmt(parm, valu, "trashproc") > 0)
                {
                    string[] parm1 = { "@action", "@InboxId" };
                    object[] valu1 = { "Delete", hid1.Value };
                    if (SqlHelper.Insert_Stmt(parm1, valu1, "inboxproc") > 0)
                    {
                        Response.Write("<script>alert('deleted to trash')</script>");
                        disp();

                    }
                }
            }

        }


    }
    protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        GridView1.PageIndex = e.NewPageIndex;
        x = GridView1.PageIndex * GridView1.PageSize;
        disp();
    }
    protected void Subject_Click1(object sender, EventArgs e)
    {
        LinkButton btn = sender as LinkButton;
        GridViewRow gr = (GridViewRow)btn.NamingContainer;
        HiddenField hid = (HiddenField)gr.Cells[0].Controls[5];

        if (Image1.AlternateText=="no")
        {
            string[] parm = { "@action", "@Status", "@InboxId" };
            object[] valu = { "changestatus", "yes", hid.Value };
            if (SqlHelper.Insert_Stmt(parm, valu, "inboxproc") > 0)
            {
                Response.Redirect("inboxdetails.aspx?id=" + hid.Value);
            }
        }
       
    }
}