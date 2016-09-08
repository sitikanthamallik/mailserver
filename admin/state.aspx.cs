using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class state : System.Web.UI.Page
{
    SqlHelper ob = new SqlHelper();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            BindCountry();

        }

    }
    public void BindCountry()
    {
        string[] param = { "action" };
        object[] val = { "Select" };
        ob.RetiveDS(param,val,"country_proc");
        if(ob.ds.Tables[0].Rows.Count>0)
        {
            ddlcountry.DataSource = ob.ds.Tables[0];
            ddlcountry.DataTextField = "countryname";
            ddlcountry.DataValueField = "countryid";
            ddlcountry.DataBind();

        }
        ddlcountry.Items.Insert(0, "Select");

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        //matching
        string[] param1 = { "@action", "@countryid", "@statename" };
        object[] value1 = { "Match", ddlcountry.SelectedValue, txtstate.Text };
        ob.RetiveDS(param1, value1, "stateproc");
        if (ob.ds.Tables[0].Rows.Count > 0)
        {
            Label1.Text = "state already exists for that country";
            return;
        }

        string[] parm = { "@action", "@countryid","@statename"};
        object[] valu = { "selectstate", ddlcountry.SelectedValue,txtstate.Text  };
        if (SqlHelper.Insert_Stmt(parm, valu, "stateproc") > 0)
        {
            Label1.Text = "State Inserted";
        }
    }
    protected void ddlcountry_SelectedIndexChanged(object sender, EventArgs e)
    {
        
    }
}