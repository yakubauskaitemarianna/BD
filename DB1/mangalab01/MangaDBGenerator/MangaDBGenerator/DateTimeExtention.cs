using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataGenerator
{
    public static class DateTimeExtention
    {
        public static string GetDateTime(this DateTime date)
        {
            var result = date.Month + "/" + date.Day + "/" + date.Year + " " + date.ToLongTimeString();
            return result;
        }
    }
}
