using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace PlayWrightNunit.TestFixtures
    {
    [TestFixture]
    internal class TestCase1
        {
        [SetUp]
        public void Setup() { Console.WriteLine("This is Setup test case 1."); }

        [TearDown]
        public void TearDown() { Console.WriteLine("This is TearDown test case 1."); }

        [Test, Order(2), Category("Smoke"), Category("Regression")]
        public void DoLogin() { Console.WriteLine("This is login test case."); }

        [Test, Order(1), Category("Smoke"), Category("Regression")]
        public void DoUserReg() { Console.WriteLine("This is registration test case"); }
        }
    }
