using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace PlayWrightNunit.TestFixtures
    {
[TestFixture]
internal class TestCase2
    {
    [SetUp]
    public void Setup() { Console.WriteLine("This is Setup test case 2."); }

    [TearDown]
    public void TearDown() { Console.WriteLine("This is TearDown test case 2."); }

    [Test, Order(3), Category("Regression")]
    public void ProductDetails() { Console.WriteLine("This is Product details page test case"); }

    [Test, Order(4), Category("Regression")]
    public void AddToCart() { Console.WriteLine("This is addToCart test case"); }
}
}
