using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(MockTest.Startup))]
namespace MockTest
{
    public partial class Startup
    {
        public void Configuration(IAppBuilder app)
        {
            ConfigureAuth(app);
        }
    }
}
