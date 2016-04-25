using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Workbounty.Repository;


namespace Workbounty.Controllers
{
    public class TeamController : Controller
    {
        TeamRepository teamRepo = new TeamRepository();
        WorkitemRepository workbountyRepo = new WorkitemRepository();
        WorkbountyDBEntities entity = new WorkbountyDBEntities();

        public ActionResult AddTeam()
        {
            return View();
        }

        [HttpPost]
        public JsonResult AddTeam(Team teamData)
        {
            if(ModelState.IsValid)
            { 
            var getTeamList = teamRepo.AddTeamData(teamData);
            Session["TeamID"] = getTeamList;
            return Json(getTeamList);
            }
            else
            {
                return null;
            }
        }

        public ActionResult AddMember(string TeamName)
        {
            var getTeamData = teamRepo.GetTeamDetail(TeamName);
            return View(getTeamData);
        }

        
        [HttpPost]
        public JsonResult AddMember(Team memberData)
        {
            memberData.TeamUserInfoID =Convert.ToInt32(Session["TeamID"]);
            var getMemberData = teamRepo.AddMemberData(memberData);
            return Json(getMemberData);

        }

        [HttpPost]
        public ActionResult UpdateMember(Team memberData)
        {
            return View();
        }

      public JsonResult FindTeamMember(string id)
        {
            var getSearchMemberData = teamRepo.GetMemberResult(id);
            return Json(getSearchMemberData);
        }
    }
}
