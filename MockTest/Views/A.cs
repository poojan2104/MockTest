using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace MockTest.Views
{
    public class A
    {
        public string Display()
        {
            return "From Class A";
        }
    }

    public class B:A
    {
        public string Display()
        {
            return "From Class B";
        }
    }

    public class Test
    {
        A a = new A();
        A aa = new B();
        B b = new B();
        //B bb = new A();
    }

}