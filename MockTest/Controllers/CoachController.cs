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
    public class CoachController : Controller
    {
        [HttpGet]
        public ActionResult Index()
        {
            SqlConnection con = null;
            DataSet ds = null;
            List<TestDetails> testList = null;
            try
            {
                con = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["MockTestContext"].ConnectionString);
                SqlCommand cmd = new SqlCommand("PR_Test_SelectByParticipent", con);
                cmd.CommandType = CommandType.StoredProcedure;
                con.Open();
                SqlDataAdapter da = new SqlDataAdapter();
                da.SelectCommand = cmd;
                ds = new DataSet();
                da.Fill(ds);
                testList = new List<TestDetails>();
                for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
                {
                    TestDetails cobj = new TestDetails();
                    cobj.Id = Convert.ToInt32(ds.Tables[0].Rows[i]["Id"].ToString());
                    cobj.TestType = ds.Tables[0].Rows[i]["TestType"].ToString();
                    cobj.TestDate = Convert.ToDateTime(ds.Tables[0].Rows[i]["TestDate"].ToString());
                    if (ds.Tables[0].Rows[i]["Participent"].Equals(DBNull.Value))
                    {              
                        cobj.Participent = 0;
                    }
                    else
                    {
                        cobj.Participent = Convert.ToInt32(ds.Tables[0].Rows[i]["Participent"].ToString());
                    }
                       
                    testList.Add(cobj);
                }
            }
            catch
            {
                return null;
            }
            finally
            {
                con.Close();
            }

            return View(testList);
        }

        [HttpPost]
        public ActionResult CreateNewTest(string testType, string date)
        {
            SqlConnection con = null;
            con = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["MockTestContext"].ConnectionString);
            try
            {

                SqlCommand cmd = new SqlCommand("PR_Test_Insert", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@TestType", testType);
                cmd.Parameters.AddWithValue("@TestDate", DateTime.ParseExact(date, "dd/MM/yyyy", null));
                con.Open();
                cmd.ExecuteScalar();
            }
            catch(Exception e)
            {
                return Json("Error "+e.ToString());
            }
            finally
            {
                con.Close();
            }

            return Json(Url.Action("Index","Coach"));
        }

        [HttpGet]
        public ActionResult TestDetails(int Id)
        {
            ViewBag.Id = Id;
            SqlConnection con = null;
            DataSet ds = null;
            List<TestDetails> testDetailList = null;
            try
            {
                con = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["MockTestContext"].ConnectionString);
                SqlCommand cmd = new SqlCommand("PR_Test_SelectById", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@Id", Id);
                SqlDataAdapter da = new SqlDataAdapter();
                da.SelectCommand = cmd;
                ds = new DataSet();
                da.Fill(ds);
                testDetailList = new List<TestDetails>();
                for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
                {
                    TestDetails cobj = new TestDetails();
                    TempData["TestType"] = ds.Tables[0].Rows[i]["TestType"].ToString();
                    TempData["TestDate"] = Convert.ToDateTime(ds.Tables[0].Rows[i]["TestDate"].ToString());

                    cobj.TestType = ds.Tables[0].Rows[i]["TestType"].ToString();
                    cobj.TestDate = Convert.ToDateTime(ds.Tables[0].Rows[i]["TestDate"].ToString());
                    cobj.UserName = ds.Tables[0].Rows[i]["Username"].ToString();
                    cobj.UserId = Convert.ToInt32(ds.Tables[0].Rows[i]["UserId"].ToString());
                    cobj.Distance = Convert.ToDouble(ds.Tables[0].Rows[i]["Distance"].ToString());
                    cobj.Id = Convert.ToInt32(ds.Tables[0].Rows[i]["Id"].ToString());
                    
                    testDetailList.Add(cobj);

                }

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

                ViewBag.ddlUser = new SelectList(userList, "Id", "Username");
            }
            catch
            {
                return null;
            }
            finally
            {
                con.Close();
            }

            return View(testDetailList);
        }

        [HttpPost]
        public JsonResult AddOrEdit(int TestId, int UserId, double Distance,int TestDetailId)
        {
            SqlConnection con = null;
            con = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["MockTestContext"].ConnectionString);
            if (TestDetailId == 0)
            {
                //insert Record
                try
                {
                        SqlCommand cmd = new SqlCommand("PR_TestDetails_Insert", con);
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@TestId", TestId);
                        cmd.Parameters.AddWithValue("@UserId", UserId);
                        cmd.Parameters.AddWithValue("@Distance", Convert.ToDecimal(Distance));
                        con.Open();
                        cmd.ExecuteNonQuery();        
                }
                catch
                {
                    return Json("Error");
                }
                finally
                {
                    con.Close();
                }
            }
            else
            {
                //update Record
                try
                {
                    SqlCommand cmd = new SqlCommand("PR_TestDetails_Update", con);
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@Id", TestDetailId);
                    cmd.Parameters.AddWithValue("@Distance", Distance);
                    con.Open();
                    cmd.ExecuteNonQuery();
                }
                catch
                {
                    return Json("Error");
                }
                finally
                {
                    con.Close();
                }
            }
            return Json("Ok");
        }

        [HttpPost]
        public JsonResult DeleteAthleteFromTest(int id)
        {
            SqlConnection con = null;
            con = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["MockTestContext"].ConnectionString);
            try
            {
                SqlCommand cmd = new SqlCommand("PR_TestDetails_Delete", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@Id", id);
                con.Open();
                cmd.ExecuteNonQuery();
            }
            catch
            {
                return Json("Error");
            }
            finally
            {
                con.Close();
            }

            return Json(Url.Action("Index", "Coach"));
        }

        [HttpPost]
        public JsonResult DeleteTest(int Id)
        {
            //exec PR_Test_Delete @Id = '4';
            SqlConnection con = null;
            con = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["MockTestContext"].ConnectionString);
            try
            {
                SqlCommand cmd = new SqlCommand("PR_Test_Delete", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@Id", Id);
                con.Open();
                cmd.ExecuteNonQuery();
            }
            catch
            {
                return Json("Error");
            }
            finally
            {
                con.Close();
            }

            return Json(Url.Action("Index", "Coach"));
        }

        [HttpPost]
        public JsonResult FindUserDistance(int testId, int userId)
        {
            SqlConnection con = null;
            double Distance = 0;
            int testDetailId = 0;
            con = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["MockTestContext"].ConnectionString);
            try
            {
                SqlCommand cmd = new SqlCommand("PR_TestDetails_FindDistanceByTestIdAndUserId", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@TestId", testId);
                cmd.Parameters.AddWithValue("@UserId", userId);
                con.Open();
                SqlDataReader reader = cmd.ExecuteReader();

                if (reader.HasRows)
                {
                    while (reader.Read())
                    {
                        Distance = Convert.ToDouble(reader["Distance"]);
                        testDetailId = Convert.ToInt32(reader["Id"]);
                    }
                }
                else
                {
                    Distance = 0;
                }
                reader.Close();
            }
            catch
            {
                return Json("Error");
            }
            finally
            {
                con.Close();
            }
            var data = new { distance = Distance, testDetailId = testDetailId };
            return Json(data);
        }

        //exec PR_TestDetails_FindDistanceByTestIdAndUserId @TestId = 9 , @UserId = 7;
        // exec PR_TestDetails_SelectById @id = '1';

        // exec PR_TestDetails_Delete @Id = '13';

        // exec PR_TestDetails_Update @id = '1', @Distance = '3568';

        public ActionResult NestedGrid()
        {
            List<TestVM> allRecord = new List<TestVM>();
            using (MockTestEntities db = new MockTestEntities())
            {
                var test = db.PR_Test_SelectAll().ToList();
                foreach (var item in test)
                {
                    var testDetail = db.PR_TestDetails_SelectAll_ById(item.Id).ToList();
                    allRecord.Add(new TestVM { test = item, testDetails = testDetail });
                }
            }
            return View(allRecord);
        }
    }
}