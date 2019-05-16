using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FunStop
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        Classes.ClsUser U = new Classes.ClsUser();

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            //string Message = "alert('Ticket #" + 1 + "Registrado!')";
            //ScriptManager.RegisterClientScriptBlock((sender as Control), this.GetType(), "alert", Message, true);
            ScriptManager.RegisterStartupScript(Page, GetType(), "OpenWindow", 
                "window.open('Login2.aspx','mywindow','menubar=1,resizable=1,width=900,height=600');", true);
            Response.Write("<script>javascript:window.close();</script>");
            //try
            //{
            //    if (IsPostBack)
            //    {
            //        //LoginError.Text = string.Empty;
            //        int Answer = 0;
            //        U.UserLogin = "";
            //        U.Password = "";
            //        Answer = U.VerifyUserLogin();
            //        if (Answer == 1)
            //        {
            //            Response.Redirect("~/Default.aspx");
            //        }
            //        else
            //        {
            //            //LoginError.Text = "Usuario o contraseña incorrecto";
            //            //LoginError.CssClass = "text-danger";
            //            //passwordTxt.Focus();

            //        }
            //    }
            //}
            //catch (Exception ex)
            //{
            //    Type cstype = this.GetType();
            //    string script = "<script>alert('" + ex.Message + "');</script>";
            //    if (!ClientScript.IsStartupScriptRegistered("myErrorScript"))
            //    {
            //        Page.ClientScript.RegisterStartupScript(cstype, "myErrorScript", script);
            //    }
            //    //Response.Write("<script language='javascript'>alert('" +
            //    //Server.HtmlEncode(ex.Message) + "')</script>");

            //}
        }
    }
}