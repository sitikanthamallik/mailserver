using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_country : System.Web.UI.Page
{
    SqlHelper ob = new SqlHelper();
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        //matching
        string[] param = { "@action", "@countryname" };
        object[] value = { "Match",txtcountry.Text };
        ob.RetiveDS(param, value, "country_proc");
        if (ob.ds.Tables[0].Rows.Count > 0)
        { Label1.Text="country name already exists";
            return;
        }

        //insertion
        string[] parm = { "@action", "@countryname"};
        object[] valu = { "Insert",txtcountry.Text };
        if (SqlHelper.Insert_Stmt(parm, valu, "country_proc") > 0)
        {
            Label1.Text = "country inserted";
        }

    }
}