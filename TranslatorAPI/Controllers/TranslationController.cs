using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Logging;
using TranslatorAPI.Services;
using TranslatorAPI.DataAccessLibrary.ModelDTO;

namespace TranslatorAPI.Controllers
{
    [ApiController]
    [Route("[controller]")]
    public class TranslationController : ControllerBase
    {

       private ITranslationServices _translationServices;


        public TranslationController(ITranslationServices _translationServices)
        {
            this._translationServices = _translationServices;
        }
       

        [Route("translate")]
        [HttpPost]
        public async Task<IActionResult> SaveTranslations(DTOTranslation dto)
        {
            try
            {
                if (!ModelState.IsValid)
                {
                    return BadRequest();
                }
              
                var exists = await _translationServices.getForInput(dto.inputText);
                if (exists == null)
                {
                    var translate = await _translationServices.Translate(dto.inputText);
                    var rez = await _translationServices.saveTranslation(dto.inputText, translate);
                    return Ok(rez);
                }

                return Ok(exists);


            }
            catch (Exception)
            {
                return StatusCode(500,"Server error!");
            }
        }

        }
}
