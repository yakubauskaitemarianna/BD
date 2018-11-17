using System.IO;
using System.Collections.Generic;


namespace DataGenerator.IOHandle
{
    public class DataReader : IDataReader
    {
        private StreamReader reader;


        public DataReader(Stream inStream)
        {
            this.reader = new StreamReader(inStream);
        }

        
        public string[] ReadLines(string delimiter)
        {
            List<string> lines = new List<string>();
            var line = "";

            while (line != null)
            {
                line = reader.ReadLine();
                if (line == delimiter)
                {
                    break;
                }

                lines.Add(line);
            }

            return lines.ToArray();
        } 
    }
}
