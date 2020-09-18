using System;
using System.Linq;
using System.Threading.Tasks;
using System.Xml.Linq;
using Microsoft.EntityFrameworkCore;
using TranslatorAPI.DataAccessLibrary.DataAccess;
using TranslatorAPI.DataAccessLibrary.Model;

namespace TranslatorAPI.Repository
{
    public class TranslationRepository : ITranslationRepository
    {

         private readonly TranslationContext translationContext;
        
        public TranslationRepository(TranslationContext translationContext)
        {
            this.translationContext = translationContext;
        }

        public async Task<Translation> getForInput(string input)
        {
            return await 
            translationContext.Translations.FirstOrDefaultAsync(t=> t.InputText.Equals( input));
        }

        public async Task<Translation> insertTranslation(Translation t)
        {
           var result = await translationContext.Translations.AddAsync(t);
            saveToXmlFile(result.Entity);
           await translationContext.SaveChangesAsync();
           return result.Entity;
        }

        public void saveToXmlFile(Translation t)
        {
            string fileName = @"C:\New Folder\Translations.xml";

            XDocument doc = XDocument.Load(fileName);

            XElement root = new XElement("translation");
            root.Add(new XAttribute("timestamp", DateTime.Now.ToString()));
            root.Add(new XAttribute("id", t.Id.ToString()));
            root.Add(new XElement("from", t.InputText.ToString()));
            root.Add(new XElement("to", t.OutputText.ToString()));
            doc.Element("translations").Add(root);
            doc.Save(fileName);
        }
    }
}