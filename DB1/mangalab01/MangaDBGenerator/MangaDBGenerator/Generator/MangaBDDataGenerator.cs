using DataGenerator.Generator;
using DataGenerator.Entity;
using DataGenerator.IOHandle;
using System.IO;
using System.Collections.Generic;

namespace DataGenerator
{
    public class MangaBDDataGenerator
    {
        private BlogDBEntityBuilder builder;


        public MangaBDDataGenerator(string namesFileName, string surnamesFileName, string countriesFileName, string wordsFileName, string domainsZonesFileName)
        {
            this.builder = new BlogDBEntityBuilder();
            var names = ReadDataFromFile(namesFileName);
            var surnames = ReadDataFromFile(surnamesFileName);
            var words = ReadDataFromFile(wordsFileName);
            var domains = ReadDataFromFile(domainsZonesFileName);
            var countries = ReadDataFromFile(countriesFileName);

            AutorEntity.NameDataSet = names;
            AutorEntity.SurnameDataSet = surnames;
            AutorEntity.CountryDataSet = countries;

            MangaEntity.WordsDataSet = words;

            ResourceEntity.WordsDataSet = words;
            ResourceEntity.DomainZonesDataSet = domains;
            ResourceEntity.CountryDataSet = countries;

            ViewEntity.WordsDataSet = words;
        }


        public void GenerateData(int dataCount)
        {
            this.builder.CreateAutors(dataCount);
            this.builder.CreatePlatform(dataCount);
            this.builder.CreateManga(dataCount);
            this.builder.CreateViews(dataCount);
            this.builder.CreateMatches(dataCount);
        }


        public void WriteGeneratedData(string autorsOutFileName, string mangaOutFileName, string resourcesOutFileName, string viewsOutFileName, string matchesOutFileName)
        {
            var usersData = new List<string>();
            foreach(var user in this.builder.Autors)
            {
                usersData.Add(user.GetDataLikeString());
            }
            WriteDataToFile(autorsOutFileName, usersData.ToArray());


            var contentData = new List<string>();
            foreach (var content in this.builder.Manga)
            {
                contentData.Add(content.GetDataLikeString());
            }
            WriteDataToFile(mangaOutFileName, contentData.ToArray());


            var platformsData = new List<string>();
            foreach (var platform in this.builder.Platforms)
            {
                platformsData.Add(platform.GetDataLikeString());
            }
            WriteDataToFile(resourcesOutFileName, platformsData.ToArray());


            var viewsData = new List<string>();
            foreach (var view in this.builder.Views)
            {
                viewsData.Add(view.GetDataLikeString());
            }
            WriteDataToFile(viewsOutFileName, viewsData.ToArray());


            var matchesData = new List<string>();
            foreach (var match in this.builder.Matches)
            {
                matchesData.Add(match.GetDataLikeString());
            }
            WriteDataToFile(matchesOutFileName, matchesData.ToArray());
        }


        private string[] ReadDataFromFile(string fileName)
        {
            FileStream stream = File.OpenRead(fileName);
            DataReader reader = new DataReader(stream);
            var data = reader.ReadLines("");

            return data;
        }


        private void WriteDataToFile(string fileName, string[] data)
        {
            FileStream stream = File.OpenWrite(fileName);
            DataWriter writer = new DataWriter(stream);

            foreach(var value in data)
            {
                writer.WriteLine(value);
            }

            writer.Flush();
        }

    }
}
