using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace PlayWrightNunit.ParallelTest
    {
    [Parallelizable]
    [TestFixture]
    internal class ParallelTest1
        {
        [Parallelizable(ParallelScope.Children)]
        [Test, TestCaseSource(nameof(GetTestData))]
        public void LoginTest(String username, String password)
            {
            DateTime currentTime = DateTime.Now;
            string time = currentTime.ToString("yyyy-MM-dd_HH-mm-ss");
            Console.WriteLine("This is login test case.");
            Console.WriteLine("Username: " + username + " & Password: " + password +"---"+ time);
            Thread.Sleep(1000); // Simulating some delay for demonstration purposes
            }

        [Parallelizable(ParallelScope.Children)]
        [Test, TestCaseSource(nameof(GetTestData))]
        public void RegTest(String email, String pwd)
            {
            DateTime currentTime = DateTime.Now;
            string time = currentTime.ToString("yyyy-MM-dd_HH-mm-ss");
            Console.WriteLine("This is Registration test case.");
            Console.WriteLine("Email: " + email + " & Pwd: " + pwd + "---" + time);
            Thread.Sleep(1000); // Simulating some delay for demonstration purposes
            }

        public static IEnumerable<TestCaseData> GetTestData()
            {
            yield return new TestCaseData("email1@gmail.com", "password1");
            yield return new TestCaseData("email2@gmail.com", "password2");
            yield return new TestCaseData("email3@gmail.com", "password3");
            }

        }
    }
