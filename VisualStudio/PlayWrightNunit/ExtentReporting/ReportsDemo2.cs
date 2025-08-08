using AventStack.ExtentReports;
using AventStack.ExtentReports.Reporter;
using AventStack.ExtentReports.Reporter.Config;

namespace PlayWrightNunit.ExtentReporting
{
    internal class ReportsDemo2
        {

        private ExtentReports extent;
        private ExtentTest test;

        [OneTimeSetUp]
        public void BeforeAllTest() {

            DateTime currentDate = DateTime.Now;
            string fileName = "Report_"+currentDate.ToString("yyyy-MM-dd_HH-mm-ss") + ".html";

            var htmlReporter = new ExtentSparkReporter(Directory.GetParent(Environment.CurrentDirectory).Parent.Parent.FullName + "\\TestReports\\"+ fileName);
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
        public void BeforeEachTest() {
            test = extent.CreateTest(TestContext.CurrentContext.Test.Name);
            }

        [TearDown]
        public void AfterEachTest()
            {
            //Get the status of the test
            string testStatus = TestContext.CurrentContext.Result.Outcome.Status.ToString().ToLower();

            if (testStatus == "passed")
                {
                test.Pass("Test passed successfully.");
                }
            else if (testStatus == "failed")
                {
                test.Fail("Test failed with error: " + TestContext.CurrentContext.Result.Message);
                }
            else if (testStatus == "skipped")
                {
                test.Skip("Test was skipped.");
                }
            else
                {
                test.Info("Test status is unknown.");
                }
            }

        [Test]
        public void LoginTest() {
            //extent.CreateTest("DoLogin").Info("This is login test case").Pass("Login test pass");
            //test.Pass("Login test passed.");
            test.Info("Login test passed.");
            Assert.Pass("Login test passed.");
            }

        [Test]
        public void RegTest()
            {
            //extent.CreateTest("RegTest").Info("This is RegTest test case").Fail("RegTest test fail");
            //test.Fail("Registration test failed.");
            test.Info("Registration test failed.");
            Assert.Fail("Registration test failed.");
            }

        [Test]
        public void ProductPage()
            {
            //extent.CreateTest("ProductPage").Info("This is ProductPage test case").Skip("ProductPage test ignored");
            //test.Skip("Product page test is ignored.");
            test.Info("Product page test is ignored.");
            Assert.Ignore("Product page test is ignored.");
            }
        }
}
