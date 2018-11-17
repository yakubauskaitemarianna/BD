using System;
using System.Collections.Generic;
using DataGenerator.Entity;

namespace DataGenerator.Generator
{
    public class BlogDBEntityBuilder
    {
        public List<AutorEntity> Autors { get; private set; }
        public List<MangaEntity> Manga { get; private set; }
        public List<ViewEntity> Views { get; private set; }
        public List<ResourceEntity> Platforms { get; private set; }
        public List<AutorsMangaMatch> Matches { get; private set; }
        private Randomizer randomizer;


        public BlogDBEntityBuilder()
        {
            this.Autors = new List<AutorEntity>();
            this.Manga = new List<MangaEntity>();
            this.Views = new List<ViewEntity>();
            this.Platforms = new List<ResourceEntity>();
            this.randomizer = new Randomizer();
            this.Matches = new List<AutorsMangaMatch>();
        }


        public void CreateAutors(int count)
        {
            for (int i = 0; i != count; i++)
            {
                var user = AutorEntity.CreateRandomAutor(this.randomizer, i);
                this.Autors.Add(user);
            }
        }


        public void CreateManga(int count)
        {
            for (int i = 0; i != count; i++)
            {
                var content = MangaEntity.CreateRandomManga(this.randomizer, i);
                this.Manga.Add(content);
            }
        }


        public void CreateViews(int count)
        {
            for (int i = 0; i != count; i++)
            {
                var user = this.Autors[randomizer.GetRandomNumber(0, this.Autors.Count - 1)];
                var content = this.Manga[randomizer.GetRandomNumber(0, this.Manga.Count - 1)];
                var platform = this.Platforms[randomizer.GetRandomNumber(0, this.Autors.Count - 1)];
                var view = ViewEntity.CreateRandomView(this.randomizer, user, content, platform);
                this.Views.Add(view);
            }
        }


        public void CreatePlatform(int count)
        {
            for (int i = 0; i != count; i++)
            {
                var platform = ResourceEntity.CreateRandomResource(this.randomizer, i);
                this.Platforms.Add(platform);
            }
        }


        public void CreateMatches(int count)
        {
            for (int i = 0; i != count; i++)
            {
                var autor = randomizer.GetRandomNumber(0, this.Autors.Count - 1);
                var manga = randomizer.GetRandomNumber(0, this.Manga.Count - 1);
                var match = AutorsMangaMatch.CreateRandomAutorsMangaMatch(this.randomizer, manga, autor);
                this.Matches.Add(match);
            }
        }
    }
}
