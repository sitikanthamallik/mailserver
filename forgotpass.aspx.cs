using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net;
using System.Net.Mail;
public partial class forgotpass : System.Web.UI.Page
{
    SqlHelper ob = new SqlHelper();

    protected void Page_Load(object sender, EventArgs e)
    {
        btn1.Attributes.Add("onclick", "return validation()");

    }
    protected void txt1_TextChanged(object sender, EventArgs e)
    {
        string[] param1 = { "@action", "@userid" };
        object[] value1 = { "Getsecretquestion", txtusr.Text };
        ob.RetiveDS(param1, value1, "proc_regd");
        if (ob.ds.Tables[0].Rows.Count > 0)
        {
            Label1.Text = ob.ds.Tables[0].Rows[0].ItemArray[0].ToString();
        }
    }
    protected void btn1_Click(object sender, EventArgs e)
    {
         string[] param = { "@action", "@userid"};
        object[] value = { "Getemailid", txtusr.Text };
        ob.RetiveDS(param, value, "proc_regd");
        if (ob.ds.Tables[0].Rows.Count > 0)
        {
            if (ob.ds.Tables[0].Rows[0].ItemArray[2].ToString() == txtans.Text)
            {
                try
                {
                    SmtpClient serverobj = new SmtpClient();
                    serverobj.Credentials = new NetworkCredential("sitikanthamallik@gmail.com", "barca12345");
                    serverobj.Port = 587;
                    serverobj.Host = "smtp.gmail.com";
                    serverobj.EnableSsl = true;
                    MailMessage msgob = new MailMessage();
                    msgob.From = new MailAddress("sitikanthamallik@gmail.com", "Password Info", System.Text.Encoding.UTF8);
                    msgob.To.Add(ob.ds.Tables[0].Rows[0].ItemArray[0].ToString());
                    msgob.Subject = "Password Verification";
                    msgob.Body = "Your Password Is : " + ob.ds.Tables[0].Rows[0].ItemArray[1].ToString();
                    msgob.DeliveryNotificationOptions = DeliveryNotificationOptions.OnFailure;
                    serverobj.Send(msgob);
                }
                catch
                {
                    Response.Write("<script>alert('Please Check Your Internet Connection')</script>");
                }
            }
            else
            { 
            
            }
        }
        else
        { 
        
        }
    }
}