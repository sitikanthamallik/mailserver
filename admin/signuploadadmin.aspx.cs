using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_signuploadadmin : System.Web.UI.Page
{
    SqlHelper ob = new SqlHelper();
    protected void Page_Load(object sender, EventArgs e)
    {
        btn1.Attributes.Add("onclick", "return validation()");

    }
    protected void btn1_Click(object sender, EventArgs e)
    {
        if (filesignimage.HasFile)
        {
            //matching
            string[] param = { "@action", "@signname" };
            object[] value = { "Match", txtsign.Text };
            ob.RetiveDS(param, value, "signproc");
            if (ob.ds.Tables[0].Rows.Count > 0)
            {
                Response.Write("<script>alert('sign name already exists')</script>");
                return;
            }
            filesignimage.PostedFile.SaveAs(Server.MapPath("~/admin/sign/" + filesignimage.FileName));


            //insertion
            string[] parm = { "@action", "@signname","@imagesign" };
            object[] valu = { "Insert", txtsign.Text ,filesignimage.FileName};
            if (SqlHelper.Insert_Stmt(parm, valu, "signproc") > 0)
            {
                Response.Write("<script>alert('Inserted')</script>");
            }
        }
    }
}