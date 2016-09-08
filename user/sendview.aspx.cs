using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class user_sendview : System.Web.UI.Page
{
    SqlHelper ob = new SqlHelper();
    public int x = 0;
    int fst; int lst; int tot;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            bindgrid();
        }
    }
    public void bindgrid()
    {
        string[] parm = { "@action", "@SendFrom" };
        object[] valu = { "viewsentmsg", Session["userid"] };
        ob.RetiveDS(parm, valu, "sentproc");

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
                if (ob.ds.Tables[0].Rows[x].ItemArray[5].ToString() == "")
                {
                    LinkButton sd = (LinkButton)r.FindControl("Subject");
                    sd.Text = "(No Subject)";
                }
                else
                {
                    LinkButton sd = (LinkButton)r.FindControl("Subject");
                    sd.Text = ob.ds.Tables[0].Rows[x].ItemArray[5].ToString();
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
            CheckBox2.Text = "check All";

        }
    }
    protected void LinkTo_Click(object sender, EventArgs e)
    {
        LinkButton btn = sender as LinkButton;
        GridViewRow gr = (GridViewRow)btn.NamingContainer;
        HiddenField hid = (HiddenField)gr.Cells[0].Controls[3];
        Response.Redirect("sentmsgdetails.aspx?idd=" + hid.Value);

    }
    protected void Subject_Click(object sender, EventArgs e)
    {
        LinkButton btn = sender as LinkButton;
        GridViewRow gr = (GridViewRow)btn.NamingContainer;
        HiddenField hid = (HiddenField)gr.Cells[0].Controls[3];
        Response.Redirect("sentmsgdetails.aspx?idd=" + hid.Value);
    }
    protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        GridView1.PageIndex = e.NewPageIndex;
        x = GridView1.PageIndex * GridView1.PageSize;
        bindgrid();
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
         foreach (GridViewRow r in GridView1.Rows)
        {
            CheckBox chk = (CheckBox)r.FindControl("CheckBox1");
            if (chk.Checked == true)
            {

                HiddenField hid1 = (HiddenField)r.FindControl("HiddenField1");
               
                string[] parm10 = { "@action", "@SendID " };
                    object[] valu10 = { "Delete", hid1.Value };
                    if (SqlHelper.Insert_Stmt(parm10, valu10, "sentproc") > 0)
                    {
                        Response.Write("<script>alert('deleted forever')</script>");
                      bindgrid();

                    }
                }
            }
    }
}