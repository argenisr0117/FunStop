using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FunStop
{
    public partial class Pista : Page
    {
        #region Instances
        DataTable dt = new DataTable();
        Classes.ClsCar C = new Classes.ClsCar();
        Classes.ClsTicket T = new Classes.ClsTicket();
        #endregion

        #region Methods    
        public void FillTicketsPendGridView()
        {
            dt = T.GetPendingTickets();
            ticketspendGrid.DataSource = dt;
            ticketspendGrid.DataBind();
        }
        #endregion
        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack)
            {

            }
            else
            {
                FillTicketsPendGridView();
            }
        }
        #region EventMethods

        protected void ticketspendGrid_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            ticketspendGrid.PageIndex = e.NewPageIndex;
            FillTicketsPendGridView();
        }

        #endregion

    }
}