using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class viewhoroscope : System.Web.UI.Page
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
        string[] parm = { "@action"};
        object[] valu = { "viewhoroscope" };
        ob.RetiveDS(parm, valu, "horoproc");

        if (ob.ds.Tables[0].Rows.Count > 0)
        {
            GridView1.DataSource = ob.ds.Tables[0];
            GridView1.DataBind();
           
        }
    }
}