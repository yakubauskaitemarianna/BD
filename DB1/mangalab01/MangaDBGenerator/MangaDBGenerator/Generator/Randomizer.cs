using System;

namespace DataGenerator.Generator
{
    public class Randomizer
    {
        private Random random;


        public Randomizer()
        {
            this.random = new Random();
        }


        public virtual string GetRandomString(string[] dataSet)
        {
            int randomValue = this.random.Next(0, dataSet.Length);
            string randomData = dataSet[randomValue];

            return randomData;
        }


        public virtual DateTime GetRandomDateTime(DateTime startDate, DateTime endDate)
        {
            TimeSpan timeSpan = endDate - startDate;
            TimeSpan newSpan = new TimeSpan(0, this.random.Next(0, (int)timeSpan.TotalMinutes), 0);
            DateTime randomDate = startDate + newSpan;

            return randomDate;
        }


        public virtual int GetRandomNumber(int startNumber, int endNumber)
        {
            int randomNumber = this.random.Next(startNumber, endNumber);

            return randomNumber;
        }
    }
}
