using System.Threading.Tasks;
using TranslatorAPI.DataAccessLibrary.Model;

namespace TranslatorAPI.Repository
{
    public interface ITranslationRepository
    {
        Task<Translation> insertTranslation(Translation t);

        Task<Translation> getForInput(string input);

        void saveToXmlFile(Translation t);
    }
}