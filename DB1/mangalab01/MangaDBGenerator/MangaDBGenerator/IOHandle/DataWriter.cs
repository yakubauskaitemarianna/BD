using System;
using System.IO;


namespace DataGenerator.IOHandle
{
    class DataWriter : IDataWriter
    {
        private StreamWriter writer;


        public DataWriter(Stream outStream)
        {
            this.writer = new StreamWriter(outStream);
        }


        public void Flush()
        {
            this.writer.Flush();
        }


        public void WriteLine(string data)
        {
            this.writer.Write(data);
            this.writer.Write(Environment.NewLine);
        }
    }
}
