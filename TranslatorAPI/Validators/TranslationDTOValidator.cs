using FluentValidation;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using TranslatorAPI.DataAccessLibrary.ModelDTO;

namespace TranslatorAPI.Validators
{
    public class TranslationDTOValidator : AbstractValidator<DTOTranslation>
    {
        public TranslationDTOValidator()
        {
            RuleFor(x => x.inputText)
            .NotEmpty().WithMessage("Input cant be empty. You need to enter text for translate")
            .MinimumLength(2).WithMessage("Minimum length of input is two")
            .MaximumLength(100).WithMessage("Maximum length of input is one hundred")
            .Matches("^[a-zA-Z\\s]+$").WithMessage("Only letters are allowed, input cant contain numbers or special symbols");
        }
    }
}
