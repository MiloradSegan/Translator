using Microsoft.EntityFrameworkCore;
using TranslatorAPI.DataAccessLibrary.Model;

namespace TranslatorAPI.DataAccessLibrary.DataAccess
{
    public class TranslationContext :DbContext
    {
        public TranslationContext(DbContextOptions options) :base(options){}
        
        public DbSet<Translation> Translations { get; set; }
    }
}