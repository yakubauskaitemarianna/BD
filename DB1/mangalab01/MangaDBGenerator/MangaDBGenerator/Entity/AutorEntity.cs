using System;
using DataGenerator.Generator;

namespace DataGenerator.Entity
{
    public class AutorEntity
    {
        public static string[] NameDataSet { private get; set; }
        public static string[] SurnameDataSet { private get; set; }
        public static string[] CountryDataSet { private get; set; }
        public int AutorId { get; set; }
        public string Name { get; set; }
        public string Surname { get; set; }
        public string Country { get; set; }
        public DateTime BirthDay { get; set; }

        
        public static AutorEntity CreateRandomAutor(Randomizer randomizer, int autorId)
        {
            if (NameDataSet.Length == 0 || SurnameDataSet.Length == 0 || CountryDataSet.Length == 0)
            {
                throw new Exception("no");
            }

            AutorEntity newUser = new AutorEntity
            {
                AutorId = autorId,
                Name = randomizer.GetRandomString(NameDataSet),
                Surname = randomizer.GetRandomString(SurnameDataSet),
                Country = randomizer.GetRandomString(CountryDataSet),
                BirthDay = randomizer.GetRandomDateTime(new DateTime(1876, 1, 1), DateTime.Now)
            };

            return newUser;
        }


        public string GetDataLikeString()
        {
            string result = AutorId.ToString() + "|" + Name + "|" + Surname + "|" + Country + "|" + BirthDay.GetDateTime();

            return result;
        }
    }
}
