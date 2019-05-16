using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FunStop
{
    public partial class Login2 : System.Web.UI.Page
    {
        Classes.ClsUser U = new Classes.ClsUser();

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void LoginBtn_Click(object sender, EventArgs e)
        {
            try
            {
                if (IsPostBack)
                {
                    LoginError.Text = string.Empty;
                    int Answer = 0;
                    U.UserLogin = userTxt.Text;
                    U.Password = passwordTxt.Text;
                    Answer = U.VerifyUserLogin();
                    if (Answer == 1)
                    {
                        Response.Redirect("~/Default.aspx");
                    }
                    else
                    {
                        LoginError.Text = "Usuario o contraseña incorrecto";
                        LoginError.CssClass = "text-danger";
                        passwordTxt.Focus();

                    }
                }
            }
            catch (Exception ex)
            {
                Type cstype = this.GetType();
                string script = "<script>alert('" + ex.Message + "');</script>";
                if (!ClientScript.IsStartupScriptRegistered("myErrorScript"))
                {
                    Page.ClientScript.RegisterStartupScript(cstype, "myErrorScript", script);
                }
                //Response.Write("<script language='javascript'>alert('" +
                //Server.HtmlEncode(ex.Message) + "')</script>");

            }
        }

        //protected void Button1_Click(object sender, EventArgs e)
        //{
        //    //if (IsPostBack)
        //    //{
        //    //    int Answer = 0;
        //    //    U.UserLogin = TextBox1.Text;
        //    //    U.Password = TextBox2.Text;
        //    //    Answer = U.VerifyUserLogin();
        //    //    if (Answer == 1)
        //    //    {
        //    //        Response.Redirect("~/Default.aspx");
        //    //    }
        //    //    else
        //    //    {
        //    //       // Label1.Text = "Usuario o contraseña incorrecto";
        //    //        Label1.CssClass = "text-danger";
        //    //        Label2.CssClass = "text-danger";
        //    //        //UpdatePanel1.Update();

        //    //    }
        //    //}
        //}
    }
}