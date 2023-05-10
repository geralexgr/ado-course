using Azure.Storage.Blobs;

namespace AspNetWebApi.Helpers
{
    public class BlobStorageHelper
    {
        public static readonly string BlobConnectionString = "testkeyrt123423r";
        public static readonly string containerName = "globalazure";
        public static readonly string fileName = "locations.json";

        private static async Task RetrieveBlobContents()
        {
            BlobServiceClient blobServiceClient = new BlobServiceClient(BlobConnectionString);
            BlobContainerClient containerClient = blobServiceClient.GetBlobContainerClient(containerName);

            BlobClient blobClient = containerClient.GetBlobClient(fileName);

            var response = await blobClient.DownloadAsync();
            using (var streamReader = new StreamReader(response.Value.Content))
            {
                while (!streamReader.EndOfStream)
                {
                    var line = await streamReader.ReadLineAsync();
                    Console.WriteLine(line);
                }
            }

        }
    }
}