using System;
using DataGenerator.Generator;

namespace DataGenerator.Entity
{
    public class ViewEntity
    {
        public static string[] WordsDataSet { private get; set; }
        public int MangaId { get; private set; }
        public int ResourceId { get; private set; }
        public DateTime Date { get; private set; }
        public int Mark { get; private set; }
        public string Comment { get; private set; }


        public static ViewEntity CreateRandomView(Randomizer randomizer, AutorEntity user, MangaEntity manga, ResourceEntity platform)
        {
            ViewEntity newView = new ViewEntity();
            newView.MangaId = manga.MangaId;
            newView.ResourceId = platform.ResourceId;
            newView.Date = randomizer.GetRandomDateTime(user.BirthDay, DateTime.Now);
            newView.Mark = randomizer.GetRandomNumber(0, 100);
            string randomText = "";
            int randomValue = randomizer.GetRandomNumber(1, 5);
            for (int i = 0; i != randomValue; i++)
            {
                randomText += randomizer.GetRandomString(WordsDataSet) + " ";
            }
            newView.Comment = randomText;

            return newView;
        }


        public string GetDataLikeString()
        {
            string result = ResourceId.ToString() + "|" + MangaId.ToString() + "|" + Mark.ToString() + "|" +  Comment + "|" + Date.GetDateTime();

            return result;
        }
    }
}
