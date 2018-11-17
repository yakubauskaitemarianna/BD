namespace DataGenerator.IOHandle
{
    public interface IDataReader
    {
        /// <summary>
        /// Return all lines to the delimiter
        /// </summary>
        string[] ReadLines(string endString);
    }
}
