using System;
using System.Net;
using System.Net.Http;
using System.Threading.Tasks;
using System.Xml.Linq;
using TranslatorAPI.DataAccessLibrary.Model;
using TranslatorAPI.Repository;

namespace TranslatorAPI.Services
{
    public class TranslationServices : ITranslationServices
    {
        private ITranslationRepository _translationRepository;

        //api key
        public const string Key = "92b08e56de3c4b95be9fe63e5002b901";

        private static readonly HttpClient client = new HttpClient
        {
            DefaultRequestHeaders = { { "Ocp-Apim-Subscription-Key", Key } }
        };

        public TranslationServices(ITranslationRepository _translationRepository)
        {
            this._translationRepository = _translationRepository;
        }

        public async Task<Translation> getForInput(string input)
        {
            var rez = await _translationRepository.getForInput(input);
            if (rez == null)
            {
                return null;
            }
            return  rez;
        }

        public async Task<Translation> saveTranslation(string input, string output)
        {
            Translation t = new Translation
            {
                TranslationDate = DateTime.Now,
                InputText = input,
                OutputText = output
            };
           return await _translationRepository.insertTranslation(t);
        }

        public async Task<string> Translate(string text)
        {
            var encText = WebUtility.UrlEncode(text);
            var uri = "https://api.microsofttranslator.com/V2/Http.svc/Translate?" + $"to=en&text={encText}";
            var result = await client.GetStringAsync(uri);
            return XElement.Parse(result).Value;
        }
    }
}