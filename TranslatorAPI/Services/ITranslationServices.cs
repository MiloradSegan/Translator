using System.Threading.Tasks;
using TranslatorAPI.DataAccessLibrary.Model;

namespace TranslatorAPI.Services
{
    public interface ITranslationServices
    {
       Task<Translation> saveTranslation(string input, string output);

       Task<Translation> getForInput(string input);

       Task<string> Translate(string text);
    }
}