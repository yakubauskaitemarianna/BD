using System;
using DataGenerator.Generator;

namespace DataGenerator.Entity
{
    public class AutorsMangaMatch
    {
        public int MangaId { get; set; }
        public int AutorId { get; set; }


        public static AutorsMangaMatch CreateRandomAutorsMangaMatch(Randomizer randomizer, int mangaId, int autorId)
        {
            AutorsMangaMatch autorsMangaMatch = new AutorsMangaMatch
            {
                MangaId = mangaId,
                AutorId = autorId
            };

            return autorsMangaMatch;
        }


        public string GetDataLikeString()
        {
            string result = AutorId.ToString() + "|" + MangaId.ToString();

            return result;
        }
    }
}
