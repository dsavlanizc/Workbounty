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
    using System.ComponentModel.DataAnnotations;
    
    public partial class Workitem
    {
        public Workitem()
        {
            this.WorkItemAssignments = new HashSet<WorkItemAssignment>();
            this.WorkitemDistributions = new HashSet<WorkitemDistribution>();
            this.WorkitemHistories = new HashSet<WorkitemHistory>();
            this.WorkitemRegistrations = new HashSet<WorkitemRegistration>();
        }
    
        public int WorkitemID { get; set; }
       
        [Required]
        public string Title { get; set; }

        [Required]
        public string Summary { get; set; }

        [Required]
        public System.DateTime StartDate { get; set; }

        [Required]
        public System.DateTime DueDate { get; set; }

        public int PublishedTo { get; set; }

        public string DocumentFilePath { get; set; }

         [Required]
        public string ProposedReward { get; set; }

         [Required]
         [RegularExpression("([1-9][0-9]*)", ErrorMessage = "Count must be a natural number")]
         public int Count { get; set; }
        [Required]
        public string Amount { get; set; }
        public int CreatedBy { get; set; }
        public System.DateTime CreatedDateTime { get; set; }
        public int ModifyBy { get; set; }
        public System.DateTime ModifyDateTime { get; set; }
        public bool Status { get; set; }
        public string Remarks { get; set; }
        public bool IsOpenForGroup { get; set; }
    
        public virtual UserInfo UserInfo { get; set; }
        public virtual UserInfo UserInfo1 { get; set; }
        public virtual Workitem Workitem1 { get; set; }
        public virtual Workitem Workitem2 { get; set; }
        public virtual ICollection<WorkItemAssignment> WorkItemAssignments { get; set; }
        public virtual ICollection<WorkitemDistribution> WorkitemDistributions { get; set; }
        public virtual ICollection<WorkitemHistory> WorkitemHistories { get; set; }
        public virtual ICollection<WorkitemRegistration> WorkitemRegistrations { get; set; }
    }
}
