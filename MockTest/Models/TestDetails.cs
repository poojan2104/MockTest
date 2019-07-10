using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace MockTest.Models
{
    public class TestDetails
    {
        public int Id { get; set; }
        public int TestId { get; set; }
        public int UserId { get; set; }
        public string TestType { get; set; }
        public DateTime TestDate { get; set; }
        public string UserName { get; set; }
        public double Distance { get; set; }
        public int Participent { get; set; }
    }
}