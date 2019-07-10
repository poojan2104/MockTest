using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace MockTest.Models
{
    public class TestVM
    {
        public PR_Test_SelectAll_Result test { get; set; }
        public List<PR_TestDetails_SelectAll_ById_Result> testDetails { get; set; }
    }
}