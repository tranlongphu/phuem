using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Configuration;

namespace phuemtest.Controllers
{
    public class HomeController : Controller
    {
        IConfiguration config;
        public HomeController1(IConfiguration config)
        {
            this.config = config;
        }

        public IActionResult Index()
        {
            ViewData["Version"] = config.GetValue<string>("Logging:Version2");
            return View();
        }

        public IActionResult About()
        {
            ViewData["Message"] = "Your application description page.";

            return View();
        }

        public IActionResult Contact()
        {
            ViewData["Message"] = "Your contact page.";

            return View();
        }

        public IActionResult Error()
        {
            return View();
        }
    }
}
