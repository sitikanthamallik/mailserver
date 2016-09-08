using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_city : System.Web.UI.Page
{
    SqlHelper ob = new SqlHelper();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            country();
           
        }
    }
    public void country()
    {
        string[] param = { "action" };
        object[] val = { "Select" };
        ob.RetiveDS(param, val, "country_proc");
        if (ob.ds.Tables[0].Rows.Count > 0)
        {
            ddlcountry.DataSource = ob.ds.Tables[0];
            ddlcountry.DataTextField = "countryname";
            ddlcountry.DataValueField = "countryid";
            ddlcountry.DataBind();

        }
        ddlcountry.Items.Insert(0, "Select");

    }
    public void state()
    {
       
        string[] param7 = { "action" };
        object[] val7 = { "getstate" };
        ob.RetiveDS(param7, val7, "stateproc");
        if (ob.ds.Tables[0].Rows.Count > 0)
        {
            ddlstate.DataSource = ob.ds.Tables[0];
        ddlstate.DataTextField = "statename";
        ddlstate.DataValueField = "stateid";
        ddlstate.DataBind();
       }
        ddlstate.Items.Insert(0, "-Select-");
    }
    protected void ddlcountry_SelectedIndexChanged(object sender, EventArgs e)
    {
            state();
        
    }
    protected void btn1_Click(object sender, EventArgs e)
    {
        //matching
        string[] param1 = { "@action", "@countryid","@stateid", "@cityname" };
        object[] value1 = { "Match", ddlcountry.SelectedValue,ddlstate.SelectedValue, txtcity.Text };
        ob.RetiveDS(param1, value1, "cityproc");
        if (ob.ds.Tables[0].Rows.Count > 0)
        {
            Label1.Text = "city already exists for that state and also for that country";
            return;
        }
        //insertion
        string[] parm = { "@action", "@countryid", "@stateid", "@cityname" };
        object[] valu = { "selectcity", ddlcountry.SelectedValue, ddlstate.SelectedValue, txtcity.Text };
        if (SqlHelper.Insert_Stmt(parm, valu, "cityproc") > 0)
        {
            Label1.Text = "new city Inserted";
        }
    }
}