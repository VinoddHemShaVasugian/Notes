using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace PlayWrightNunit.nunitLearning
    {
    [TestFixture]
    internal class RetryAnalyzer
        {
        private int retryCount = 0;

        [Test, Retry(3)]
        public void RetryTestSample()
            {
            retryCount++;

            if (retryCount < 3)
                {
                TestContext.Progress.WriteLine($"Retrying test case, attempt {retryCount}");
                Assert.Fail("This test case is designed to fail for demonstration purposes.");
                }
            Assert.Pass("This test case is designed to Pass for demonstration purposes.");
            }
        }
    }
