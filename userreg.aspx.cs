using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class userreg : System.Web.UI.Page
{
    SqlHelper ob = new SqlHelper();
    protected void Page_Load(object sender, EventArgs e)
    {
        btn1.Attributes.Add("onclick", "return validation()");
       
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        if (FileUploadpic.HasFile)
        {
            //matching
            string[] param = { "@action", "@userid" };
            object[] value = { "Match", txtid.Text };
            ob.RetiveDS(param, value, "proc_regd");
            if (ob.ds.Tables[0].Rows.Count > 0)
            {
                Response.Write("<script>alert('user id already exists')</script>");
                return;
            }

            FileUploadpic.PostedFile.SaveAs(Server.MapPath("~/user/profileimage/"+FileUploadpic.FileName));

            //insertion
            string[] parm = { "@action", "@username", "@userid", "@password", "@emailid", "@mobileno", "@dateofbirth", "@gender", "@secretquestion", "@answer", "@profilepic" };
            object[] valu = { "Insert", txtusr.Text, txtid.Text, txtpass.Text, txtemail.Text, txtmob.Text, txtdob.Text, rblgen.Text, ddlsq.SelectedItem.Text, txtans.Text, FileUploadpic.FileName };
            if (SqlHelper.Insert_Stmt(parm, valu, "proc_regd") > 0)
            {
                Response.Write("<script>alert('Inserted')</script>");
            }

        }
    }
    protected void btn2_Click(object sender, EventArgs e)
    {
       txtusr.Text="";
       txtans.Text = "";
       txtconfirmpass.Text = "";
       txtdob.Text = "";
        txtmob.Text = "";
        txtpass.Text = "";
        txtid.Text = "";
        txtemail.Text = "";
        rblgen.Text = "";
       
        
    }
}