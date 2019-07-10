using MockTest.Models;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace MockTest.Controllers
{
    public class LoginController : Controller
    {
        // GET: Login
        public ActionResult Index()
        {
            return View();
        }

        [HttpPost]
        public JsonResult Index(string userName, string password)
        {
            SqlConnection con = null;
            DataSet ds = null;
            UserMaster user = null;
            try
            {
                con = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["MockTestContext"].ConnectionString);
                SqlCommand cmd = new SqlCommand("PR_User_Login", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@UsersName", userName);
                SqlDataAdapter da = new SqlDataAdapter();
                da.SelectCommand = cmd;
                ds = new DataSet();
                da.Fill(ds);
                for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
                {
                    user = new UserMaster();
                    user.Id = ds.Tables[0].Rows[i]["Id"].ToString();
                    user.Password = ds.Tables[0].Rows[i]["Password"].ToString();
                    user.UserType = ds.Tables[0].Rows[i]["UserType"].ToString();
                }

                if (password == user.Password)
                {
                    if(user.UserType == "Coach")
                    {
                        Session["UserId"] = user.Id;
                        Session["UserType"] = user.UserType;
                        return Json(Url.Action("Index", "Coach"));
                    }
                    else
                    {
                        Session["UserId"] = user.Id;
                        Session["UserType"] = user.UserType;
                        return Json(Url.Action("Index", "Athlete"));
                    }
                }
                else
                {
                    return Json("Invalid Login");
                }
            }
            catch
            {
                return Json("Invalid Login");
            }
            finally
            {
                con.Close();
            }
        }
    }
}