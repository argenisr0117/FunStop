using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FunStop
{
    public partial class SiteMaster : MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (ClsGlobal.UserID == 0)
            {
                Response.Redirect("Login.aspx");

            }
        }

        protected void LogoutBtn_Click(object sender, EventArgs e)
        {
            ClsGlobal.UserID = 0;
            Response.Redirect("Login.aspx");

        }
    }
}