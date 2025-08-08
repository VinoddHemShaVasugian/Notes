using AventStack.ExtentReports;
using AventStack.ExtentReports.MarkupUtils;
using AventStack.ExtentReports.Reporter;
using AventStack.ExtentReports.Reporter.Config;

namespace PlayWrightNunit.ExtentReporting
{
    internal class ReportsFinal
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
                MarkupHelper.CreateLabel("PASS", ExtentColor.Green);
                }
            else if (testStatus == "failed")
                {
                test.Fail("Test failed with error: " + TestContext.CurrentContext.Result.Message);
                MarkupHelper.CreateLabel("FAIL", ExtentColor.Red);
                }
            else if (testStatus == "skipped")
                {
                test.Skip("Test was skipped: "+TestContext.CurrentContext.Result.Message);
                MarkupHelper.CreateLabel("SKIP", ExtentColor.Yellow);
                }
            else
                {
                test.Info("Test status is unknown.");
                MarkupHelper.CreateLabel("UNKNOWN", ExtentColor.Grey);
                }
            }

        [Test]
        public void LoginTest() {
            Assert.Pass("Assertion Result: Login test passed.");
            }

        [Test]
        public void RegTest()
            {
            Assert.Fail("Assertion Result: Registration test failed.");
            }

        [Test]
        public void ProductPage()
            {
            Assert.Ignore("Assertion Result: Product page test is ignored.");
            }
        }
}
