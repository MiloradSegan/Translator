using System;
using System.ComponentModel.DataAnnotations;

namespace TranslatorAPI.DataAccessLibrary.Model
{
    public class Translation
    {
        [Key]
        public int Id { get; set; }
        [Required]
        public DateTime TranslationDate { get; set; }
        [Required]
        [MaxLength(300)]
        public string InputText { get; set; }
        [Required]
        [MaxLength(300)]
        public string OutputText { get; set; }
    }
}