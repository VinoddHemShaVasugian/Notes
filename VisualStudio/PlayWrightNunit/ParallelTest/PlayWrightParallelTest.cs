using Microsoft.Playwright;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace PlayWrightNunit.ParallelTest
    {
    [Parallelizable(ParallelScope.All)]
    [TestFixture]
    internal class PlayWrightParallelTest
        {
        private IPlaywright playwright;

        //[SetUp]
        //public async Task Setup()
        //    {
        //    playwright = await Playwright.CreateAsync();
        //    }

        //[TearDown]
        //public async Task TearDown()
        //    {
        //    if (playwright != null)
        //        {
        //        // Fix for CS4008: Cannot await 'void'
        //        //await Task.Run(() => playwright.Dispose());
        //        playwright.Dispose();
        //        }
        //    }

        [Parallelizable(ParallelScope.Children)]
        [Test, TestCaseSource(nameof(GetTestData))]
        public async Task LoginTest(String username, String password, String browserType)
            {
            DateTime currentTime = DateTime.Now;
            string time = currentTime.ToString("yyyy-MM-dd_HH-mm-ss");

            playwright = await Playwright.CreateAsync();
            IBrowser browser;
            IPage page;

            BrowserTypeLaunchOptions options = new BrowserTypeLaunchOptions
                {
                Headless = false // Set to false if you want to see the browser
                };

            if(browserType.Equals("chrome"))
                {
                browser = await playwright.Chromium.LaunchAsync(options);
                }
            else if (browserType == "firefox")
                {
                browser = await playwright.Firefox.LaunchAsync(options);
                }
            else
                {
                Assert.Fail("Unsupported browser type: " + browserType);
                return;
                }

            page = await browser.NewPageAsync();
            await page.GotoAsync("https://www.google.com/");


            Console.WriteLine("This is login test case.");
            Console.WriteLine("Username: " + username + " & Password: " + password + "---" + time);

            await Task.Delay(5000); // Simulate some work

            await page.CloseAsync();
            playwright.Dispose();
            }

        public static IEnumerable<TestCaseData> GetTestData()
            {
            yield return new TestCaseData("email1@gmail.com", "password1", "chrome");
            yield return new TestCaseData("email2@gmail.com", "password2", "chrome");
            yield return new TestCaseData("email3@gmail.com", "password3", "firefox");
            }
        }
    }
