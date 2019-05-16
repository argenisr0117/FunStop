﻿using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;

namespace FunStop.Classes
{
    public class ClsTicket
    {
        ClsDBConn Conn = new ClsDBConn();

        #region Properties
        public int TicketID { get; set; }
        public string Customer { get; set; }
        public string Identification { get; set; }
        public string Phone { get; set; }
        public int CarTypeID { get; set; }
        public int TrackTime { get; set; }
        public decimal Fare { get; set; }
        public decimal Total { get; set; }
        public int UserID { get; set; }



        #endregion

        #region Methods
        public int TicketRegister()
        {
            int Msj = 0;
            List<ClsParams> lst = new List<ClsParams>();
            lst.Add(new ClsParams("@TicketID", "", SqlDbType.Int, ParameterDirection.Output, 8));
            lst.Add(new ClsParams("@Customer",Customer));
            lst.Add(new ClsParams("@Identification", Identification));
            lst.Add(new ClsParams("@Phone", Phone));
            lst.Add(new ClsParams("@Fare", Fare));
            lst.Add(new ClsParams("@CarTypeID", CarTypeID));
            lst.Add(new ClsParams("@TrackTime", TrackTime));
            lst.Add(new ClsParams("@Total", Total));
            lst.Add(new ClsParams("@UserID", UserID));
            Conn.EjecutarSP("Sp_TicketRegister", ref lst);
            Msj = Convert.ToInt32(lst[0].Valor);
            return Msj;
        }
        #endregion
    }
}