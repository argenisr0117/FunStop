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

        public void FillAvailableCarsGridView()
        {
            dt = C.GetAvailableCars();
            carrosGrid.DataSource = dt;
            carrosGrid.DataBind();
            carrosGrid.Columns[1].Visible = false;
        }

        public void RemoveSelectedRowClass(GridView grid)
        {
            foreach (GridViewRow row in grid.Rows)
            {
                row.CssClass = "";
            }
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
                FillAvailableCarsGridView();
            }
        }
        #region EventMethods

        protected void ticketspendGrid_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            ticketspendGrid.PageIndex = e.NewPageIndex;
            FillTicketsPendGridView();
        }

        protected void ticketchkb_CheckedChanged(object sender, EventArgs e)
        {
            RemoveSelectedRowClass(ticketspendGrid);

            foreach (GridViewRow row in ticketspendGrid.Rows)
            {
                if (row.RowType == DataControlRowType.DataRow)
                {
                    CheckBox chkRow = (row.Cells[0].FindControl("ticketChkb") as CheckBox);
                    if (chkRow.Checked)
                    {
                        row.CssClass = "bg-danger";
                        ClsGlobal.TicketID = Convert.ToInt32(row.Cells[1].Text.ToString());
                        ClsGlobal.TIme=Convert.ToInt32(row.Cells[1].Text.ToString());
                        //string Message = "alert('Ticket # " + ClsGlobal.TicketID + " seleccionado!')";
                        //ScriptManager.RegisterClientScriptBlock((sender as Control), this.GetType(), "alert", Message, true);
                        break;
                    }
                    else
                    {
                        ClsGlobal.TicketID = 0;
                        ClsGlobal.TIme = 0;
                    }
                }
            }
        }
        protected void carChkb_CheckedChanged(object sender, EventArgs e)
        {
            RemoveSelectedRowClass(carrosGrid);

            foreach (GridViewRow row in  carrosGrid.Rows)
            {
                if (row.RowType == DataControlRowType.DataRow)
                {
                    CheckBox chkRow = (row.Cells[0].FindControl("carChkb") as CheckBox);                    
                    if (chkRow.Checked)
                    {
                        row.CssClass = "bg-danger";
                        ClsGlobal.CarID = Convert.ToInt32(row.Cells[1].Text.ToString());
                        //string Message = "alert('Ticket # " + ClsGlobal.CarID + " seleccionado!')";
                        //ScriptManager.RegisterClientScriptBlock((sender as Control), this.GetType(), "alert", Message, true);
                        break;
                    }
                    else
                    {
                        ClsGlobal.CarID = 0;
                    }
                }
            }
        }
        #endregion


    }
}