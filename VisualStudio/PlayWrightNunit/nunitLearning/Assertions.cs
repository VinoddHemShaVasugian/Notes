using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace PlayWrightNunit.nunitLearning
{
    internal class Assertions
    {
        [Test, Category("Assertions")]
        public void AssertionTC() { 
            String expectedTitle = "Playwright NUnit Learning";
            String actualTitle = "Playwright MSTest Learning";
            Console.WriteLine("Start - This is a assertion test case.");

            //Assert.That(actualTitle, Is.EqualTo(expectedTitle), "The actual title does not match the expected title.");
            //Assert.That(false, "This assertion checks if the value is true.");
            //Assert.Fail("This assertion fails intentionally to demonstrate failure handling.");

            Assert.Multiple(() =>
            {
                Assert.That(actualTitle, Is.EqualTo(expectedTitle), "The actual title does not match the expected title.");
                Assert.That(false, "This assertion checks if the value is true.");
                Assert.Fail("This assertion fails intentionally to demonstrate failure handling.");
            }
                            );

            Console.WriteLine("End - This is a assertion test case.");
        }
    }
}
