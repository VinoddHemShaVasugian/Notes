using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace PlayWrightNunit.Parameterization
    {
    [TestFixture]
    internal class ParallelTest1
        {
        //[Test]
        //[TestCase("Email1@gmail.com", "password1")]
        //[TestCase("Email2@gmail.com", "password2")]
        //[TestCase("Email3@gmail.com", "password3")]
        //public void LoginTest(String username, String password)
        //    {
        //    Console.WriteLine("This is login test case.");
        //    Console.WriteLine("Username: " + username + " & Password: " + password);
        //    }

        [Test, TestCaseSource(nameof(GetTestData))]
        public void LoginTest(String username, String password)
            {
            Console.WriteLine("This is login test case.");
            Console.WriteLine("Username: " + username + " & Password: " + password);
            }

        public static IEnumerable<TestCaseData> GetTestData()
            {

            // Yield return is used to return multiple test cases
            // Yield will wait until all returns are successfully completed
            // The purpose of yield return is to return multiple test cases
            // and temporarily suspends its execution until the next iteration is requested.
            // This allows the method to resume execution from the point it was suspended.

            yield return new TestCaseData("email1@gmail.com", "password1");
            yield return new TestCaseData("email2@gmail.com", "password2");
            yield return new TestCaseData("email3@gmail.com", "password3");
            }

        }
    }
