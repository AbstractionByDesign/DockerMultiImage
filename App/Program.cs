using System;
using System.Threading;
using System.Threading.Tasks;
using Flurl.Http;

namespace App
{
    class Program
    {
        public static async Task Main(string[] args)
        {
            while(true)
            {
            var resp = await "http://dockerimagetest-api/WeatherForecast".GetStringAsync();
            Console.WriteLine(resp);
            Console.WriteLine("-------");
            Thread.Sleep(3000);
            }
        }
    }
}
