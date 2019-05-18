using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace FunStop
{
    public static class ClsGlobal
    {
        static string _LoginName;
        static int _UserID;
        static int _TicketID;
        static int _CarID;

        public static string LoginName
        {
            get
            {
                return _LoginName;
            }
            set
            {
                _LoginName = value;
            }
        }
        public static int UserID
        {
            get
            {
                return _UserID;
            }
            set
            {
                _UserID = value;
            }
        }
        public static int TicketID
        {
            get
            {
                return _TicketID;
            }
            set
            {
                _TicketID = value;
            }
        }
        public static int CarID
        {
            get
            {
                return _CarID;
            }
            set
            {
                _CarID = value;
            }
        }
    }
}