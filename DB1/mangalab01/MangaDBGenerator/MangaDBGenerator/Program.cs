using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataGenerator
{
    class Program
    {
        static void Main(string[] args)
        {
            MangaBDDataGenerator generator = new MangaBDDataGenerator("inputNames.txt", "inputSurname.txt", "inputCountry.txt", "inputWords.txt", "inputDomainZones.txt");
            generator.GenerateData(1000);
            generator.WriteGeneratedData("../../../../autorData.txt", 
                                         "../../../../mangaData.txt",
                                         "../../../../resourceData.txt",
                                         "../../../../viewData.txt",
                                         "../../../../matchData.txt");
        }
    }
}
