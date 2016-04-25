﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using Workbounty.Models;

namespace Workbounty.Repository
{
    public class TeamRepository : ApiController
    {
        WorkbountyDBEntities entity = new WorkbountyDBEntities();
        public List<TeamInformation> GetTeamList(int id)
        {
            List<TeamInformation> team = new List<TeamInformation>();
            try
            {
                int currentUserid = id;
                var selectTeam = entity.Teams.Where(s => s.UserID == currentUserid).Select(s => s.TeamUserInfoID);
                foreach (var item in selectTeam)
                {
                    var data = entity.Teams.Where(s => s.TeamUserInfoID == item).ToList();
                    TeamInformation teamInfo = new TeamInformation();
                    teamInfo.TeamUserInfoID = item;
                    foreach (var _user in data)
                    {
                        TeamUserInfo _team = new TeamUserInfo { FirstName = _user.UserInfo.FirstName, Email = _user.UserInfo.Email, PhoneNumber = _user.UserInfo.PhoneNumber, TeamName = _user.TeamName };
                        teamInfo.TeamUserList.Add(_team);
                    }
                    team.Add(teamInfo);
                }
            }
            catch (Exception)
            {
                return null; 
            }
            return team;
        }
        public List<UserInfo> GetMemberResult(string memberName)
        {
            try
            {
                var getMemberData = entity.UserInfoes.Where(s => s.LastName.ToLower().StartsWith(memberName)
                              || s.FirstName.ToLower().StartsWith(memberName)).ToList();

                if (getMemberData == null)
                {

                    return null;
                }

                return getMemberData;
            }
            catch (Exception)
            {
                return null;

            }
        }

        public int AddTeamData(Team teamData)
        {                      
            try
            {
                int i = 0;
                do
                {
                    var qwe = entity.Teams.Where(s => s.TeamUserInfoID == teamData.TeamUserInfoID).FirstOrDefault();
                    if (qwe == null)
                    {
                        var getID = Convert.ToInt32(teamData.TeamUserInfoID);
                        entity.Teams.Add(teamData);
                        entity.SaveChanges();
                        i++;
                        return getID;
                    }
                    else
                    {
                        teamData.TeamUserInfoID = teamData.TeamUserInfoID + 1;
                    }
                }
                while (i == 0);
                return 0;

            }
            catch (Exception)
            {
                return 0;
            }
        }


        public string AddMemberData(Team memberData)
        {
            try
            {
                entity.Teams.Add(memberData);
                entity.SaveChanges();
                return "Success";
            }
            catch (Exception)
            {
                return "Error";

            }
        }

        public List<TeamInformation> GetTeamDetail(string TeamName)
        {
            List<TeamInformation> team = new List<TeamInformation>();
            var GetDetails = entity.Teams.Where(s => s.TeamName == TeamName).ToList();
            TeamInformation teamInfo = new TeamInformation();
            foreach(var data in GetDetails)
            {
                TeamUserInfo _team = new TeamUserInfo { FirstName = data.UserInfo.FirstName, Email = data.UserInfo.Email, PhoneNumber = data.UserInfo.PhoneNumber };
                teamInfo.TeamUserList.Add(_team);
            }
            team.Add(teamInfo);
            return team;
        }





    }
}