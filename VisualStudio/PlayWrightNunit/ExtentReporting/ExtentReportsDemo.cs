using AventStack.ExtentReports;
using AventStack.ExtentReports.Reporter;
using AventStack.ExtentReports.Reporter.Config;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace PlayWrightNunit.ExtentReporting
{
    internal class ExtentReportsDemo
        {

        private ExtentReports extent;
        private ExtentTest test;

        [OneTimeSetUp]
        public void BeforeAllTest() {
            var htmlReporter = new ExtentSparkReporter(Directory.GetParent(Environment.CurrentDirectory).Parent.Parent.FullName + "\\TestReports\\extent.html");
            htmlReporter.Config.Theme = Theme.Dark;
            htmlReporter.Config.DocumentTitle = "Extent Report - Demo Test Suite";
            htmlReporter.Config.ReportName = "Extent Report - Demo Test Suite";
            htmlReporter.Config.Encoding = "uft-8";

            extent = new ExtentReports();
            extent.AttachReporter(htmlReporter);

            extent.AddSystemInfo("Project Name", "PSEA");
            extent.AddSystemInfo("Framework", "PlaywrightNunit");
            }

        [OneTimeTearDown]
        public void AfterAllTest() {
            extent.Flush();
            }


        [SetUp]
        public void Setup() { Console.WriteLine("This is Setup test case."); }

        [TearDown]
        public void TearDown() { Console.WriteLine("This is TearDown test case."); }

        [Test]
        public void DoLogin() {
            extent.CreateTest("DoLogin")
                .Info("This is login test case")
                .Pass("Login successful");
            }
    }
}
