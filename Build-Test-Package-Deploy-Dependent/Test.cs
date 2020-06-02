using System;

namespace Build_Test_Package_Deploy_Dependent
{
    public class Test
    {
        public static void Run()
        {
            Build_Test_Package_Deploy.Test.Run();

            Console.WriteLine("Running...");
            Console.ReadKey();
        }
    }
}
