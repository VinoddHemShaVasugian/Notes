using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using NUnit.Framework;

namespace PlayWrightNunit.TestFixtures
    {
    [SetUpFixture]
    public class BaseTest
        {
        [OneTimeSetUp]
        public void OneTimeSetUpTest()
            {
            TestContext.Progress.WriteLine("This is OneTimeSetUp test case.");
            }

        [OneTimeTearDown]
        public void OneTimeTearDownTest()
            {
            TestContext.Progress.WriteLine("This is OneTimeTearDown test case.");
            }
        }
    }
