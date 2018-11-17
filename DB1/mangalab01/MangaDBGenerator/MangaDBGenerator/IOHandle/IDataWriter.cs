using DataGenerator.Entity;


namespace DataGenerator.IOHandle
{
    public interface IDataWriter
    {
        /// <summary>
        /// Write line with preceding whitespaces
        /// </summary>
        void WriteLine(string data);

        /// <summary>
        /// Clear all buffers for the Stream and causes any buffered data to be written to the underlying device
        /// </summary>
        void Flush();
    }
}
