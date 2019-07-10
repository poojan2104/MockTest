using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using MockTest.Models;
using System.Web.Services;
using System.Data.SqlClient;
using System.Data;

namespace MockTest.Controllers
{
    public class TestingController : Controller
    {
        // GET: Testing
        public ActionResult Index()
        {
            return View();
        }

        [HttpPost]
        public JsonResult AjaxMethod()
        {

            SqlConnection con = null;
            con = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["MockTestContext"].ConnectionString);
            List<UserNames> userList = null;
            SqlCommand cmd1 = new SqlCommand("PR_User_Usernames", con);
            cmd1.CommandType = CommandType.StoredProcedure;
            con.Open();
            SqlDataAdapter da1 = new SqlDataAdapter();
            da1.SelectCommand = cmd1;
            DataSet ds1 = new DataSet();
            da1.Fill(ds1);
            userList = new List<UserNames>();
            for (int i = 0; i < ds1.Tables[0].Rows.Count; i++)
            {
                UserNames cobj = new UserNames();
                cobj.Id = Convert.ToInt32(ds1.Tables[0].Rows[i]["Id"].ToString());
                cobj.Username = ds1.Tables[0].Rows[i]["Username"].ToString();

                userList.Add(cobj);
            }

            //ViewBag.ddlUser = new SelectList(userList, "Id", "Username");

            return Json(userList);
        }


        public ActionResult ElectionResultHistoryInGujarat()
        {
            return View();
        }

        public ActionResult APITestLogin()
        {
            return View();
        }

       
    }
}