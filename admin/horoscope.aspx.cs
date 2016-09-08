using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_horoscope : System.Web.UI.Page
{
    SqlHelper ob = new SqlHelper();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            DataBinder();
            txtdate.Text = DateTime.Now.ToShortDateString();
            txtdate.ReadOnly = true;
        }

    }
    public void DataBinder()
    {
        string[] param = { "@action" };
        object[] value = { "Getsign" };
        ob.RetiveDS(param, value, "signproc");
        if (ob.ds.Tables[0].Rows.Count > 0)
        {
            ddlsign.DataSource = ob.ds.Tables[0];
            ddlsign.DataValueField = "signid";
            ddlsign.DataTextField = "signname";
            ddlsign.DataBind();
        }
        ddlsign.Items.Insert(0, "-Select-");
    }
    protected void btn_Click(object sender, EventArgs e)
    {
        //matching
        string[] param1 = { "@action", "@signid","@date" };
        object[] value1 = { "Match", ddlsign.SelectedValue, txtdate.Text };
        ob.RetiveDS(param1, value1, "horoproc");
        if (ob.ds.Tables[0].Rows.Count > 0)
        {
            Response.Write("<script>alert('date already exists for that sign')</script>");
            return;
        }

        string[] parm = { "@action", "@signid","@description","@date" };
        object[] valu = { "Insert",ddlsign.SelectedValue,txtdesc.Text,txtdate.Text };
        if (SqlHelper.Insert_Stmt(parm, valu, "horoproc") > 0)
        {
            Response.Write("<script>alert(' horoscope Inserted')</script>");
        }
    }
    protected void ddlsign_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (ddlsign.SelectedIndex != 0)
        {



            string[] param2 = { "@action", "@signid" };
            object[] value2 = { "Getimagesign", ddlsign.SelectedValue };
            ob.RetiveDS(param2, value2, "signproc");
            if (ob.ds.Tables[0].Rows.Count > 0)
            {
                signimage.ImageUrl = "~/admin/sign/" + ob.ds.Tables[0].Rows[0].ItemArray[2].ToString();
                signimage.Visible = true;
            }
        }
        else
        {
            signimage.Visible = false;
        }
    }
}