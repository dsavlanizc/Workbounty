//------------------------------------------------------------------------------
// <auto-generated>
//    This code was generated from a template.
//
//    Manual changes to this file may cause unexpected behavior in your application.
//    Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace Workbounty
{
    using System;
    using System.Collections.Generic;
    
    public partial class ExceptionLog
    {
        public int ExceptionID { get; set; }
        public int ClientID { get; set; }
        public string ErrorDetails { get; set; }
        public System.DateTime EventDateTime { get; set; }
        public string InnerException { get; set; }
    }
}
