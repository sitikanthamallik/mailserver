using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class user_Editprofile : System.Web.UI.Page
{
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
        string[] param1 = { "@action", "@userid" };
        object[] value1 = { "Getall", Session["userid"] };
        ob.RetiveDS(param1, value1, "proc_regd");
        if (ob.ds.Tables[0].Rows.Count > 0)
        {
            txtusr.Text = ob.ds.Tables[0].Rows[0].ItemArray[0].ToString();
            txtemail.Text = ob.ds.Tables[0].Rows[0].ItemArray[1].ToString();
            if (ob.ds.Tables[0].Rows[0].ItemArray[2].ToString() == "male")
            {
                rblgen.Items[0].Selected = true;

            }
            else
            {
                rblgen.Items[1].Selected = true;

            }
            txtdob.Text = ob.ds.Tables[0].Rows[0].ItemArray[3].ToString();
            txtmob.Text = ob.ds.Tables[0].Rows[0].ItemArray[4].ToString();
            ddlsq.Items.Insert(0, ob.ds.Tables[0].Rows[0].ItemArray[5].ToString());
            txtans.Text = ob.ds.Tables[0].Rows[0].ItemArray[6].ToString();
        }
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        string[] parm = { "@action", "@username", "@emailid", "@mobileno", "@dateofbirth", "@gender", "@secretquestion", "@answer" ,"@userid"};
        object[] valu = { "updateall", txtusr.Text, txtemail.Text, txtmob.Text, txtdob.Text, rblgen.Text, ddlsq.SelectedItem.Text, txtans.Text,Session["userid"] };
        if (SqlHelper.Insert_Stmt(parm, valu, "proc_regd") > 0)
        {
            Response.Write("<script>alert('updated')</script>");
        }
    }
}