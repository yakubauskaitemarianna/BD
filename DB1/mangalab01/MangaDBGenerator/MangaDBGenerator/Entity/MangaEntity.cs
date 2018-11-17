using System;
using DataGenerator.Generator;

namespace DataGenerator.Entity
{
    public class MangaEntity
    {
        public static string[] WordsDataSet { private get; set; }
        public int MangaId { get; set; }
        public string Name { get; set; }
        public DateTime PublishDate { get; set; }
        public int PageNumbers { get; set; }
        public int Colorization { get; set; }


        public static MangaEntity CreateRandomManga(Randomizer randomizer, int mangaId)
        {
            if (WordsDataSet.Length == 0)
            {
                throw new Exception("no");
            }

            MangaEntity newManga = new MangaEntity
            {
                MangaId = mangaId,
                Name = randomizer.GetRandomString(WordsDataSet),
                PageNumbers = randomizer.GetRandomNumber(1, 10000),
                Colorization = randomizer.GetRandomNumber(0, 2),
                PublishDate = randomizer.GetRandomDateTime(new DateTime(1900, 1, 1), DateTime.Now)
            };

            return newManga;
        }


        public string GetDataLikeString()
        {
            string result = MangaId.ToString() + "|" + Name + "|" + PublishDate.GetDateTime() + "|" + PageNumbers.ToString() + "|" + Colorization.ToString();

            return result;
        }
    }
}
