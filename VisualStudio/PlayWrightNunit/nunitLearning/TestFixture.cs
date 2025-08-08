using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace PlayWrightNunit.nunitLearning
{
    internal class TestFixture
    {
        [SetUp]
        public void Setup() { Console.WriteLine("This is Setup test case."); }

        [TearDown]
        public void TearDown() { Console.WriteLine("This is TearDown test case."); }

        [Test, Order(2), Category("Smoke"), Category("Regression")]
        public void DoLogin() { Console.WriteLine("This is login test case."); }

        [Test, Order(1), Category("Smoke"), Category("Regression")]
        public void DoUserReg() { Console.WriteLine("This is registration test case"); }

        [Test, Order(3), Category("Regression")]
        public void ProductDetails() { Console.WriteLine("This is Product details page test case"); }

        [Test, Order(4), Category("Regression")]
        public void AddToCart() { Console.WriteLine("This is addToCart test case"); }

        [Test, Category("Regression"), Ignore("This test is ignored due to known issues.")]
        public void TestToIgnore() { Console.WriteLine("This is addToCart test case"); }
    }
}
