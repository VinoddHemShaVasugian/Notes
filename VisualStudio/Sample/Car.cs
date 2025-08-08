using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Sample
{
    internal class Car
    {
        public void display()
        {
            Console.WriteLine("This is a car.");
        }
        static void Main(string[] args)
        {
            Car myCar = new Car();
            myCar.display();
        }
    }
}
