using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class viewnews : System.Web.UI.Page
{
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
        string[] parm = { "@action" };
        object[] valu = { "viewnews" };
        ob.RetiveDS(parm, valu, "newsproc");

        if (ob.ds.Tables[0].Rows.Count > 0)
        {   GridView1.DataSource = ob.ds.Tables[0];
            GridView1.DataBind();
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
            

           
        }

    }
    protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        GridView1.PageIndex = e.NewPageIndex;
        x = GridView1.PageIndex * GridView1.PageSize;
        disp();
    }
}