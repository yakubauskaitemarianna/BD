using System;
using DataGenerator.Generator;

namespace DataGenerator.Entity
{
    public class ResourceEntity
    {
        public static string[] WordsDataSet { private get; set; }
        public static string[] DomainZonesDataSet { private get; set; }
        public static string[] CountryDataSet { private get; set; }
        public int ResourceId { get; private set; }
        public string Name { get; private set; }
        public string URL { get; private set; }
        public string Country { get; private set; }


        public static ResourceEntity CreateRandomResource(Randomizer randomizer, int resourceId)
        {
            if (DomainZonesDataSet.Length == 0 || WordsDataSet.Length == 0)
            {
                throw new Exception("no");
            }

            ResourceEntity newPlatform = new ResourceEntity();
            newPlatform.ResourceId = resourceId;
            newPlatform.Name = randomizer.GetRandomString(WordsDataSet) + resourceId.ToString();
            newPlatform.URL = "http://" + newPlatform.Name + randomizer.GetRandomString(DomainZonesDataSet);
            newPlatform.Country = randomizer.GetRandomString(CountryDataSet);

            return newPlatform;
        }


        public string GetDataLikeString()
        {
            string result =  ResourceId.ToString() + "|" + URL + "|" + Name + "|" + Country;

            return result;
        }
    }
}
