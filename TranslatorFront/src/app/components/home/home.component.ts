import { Component, OnInit } from '@angular/core';
import { FormControl, FormGroup, Validators } from '@angular/forms';
import { Router } from '@angular/router';
import { Translation } from 'src/app/Models/Translation';
import { TranslatorServiceService } from 'src/app/services/TranslatorService.service';

@Component({
  selector: 'app-home',
  templateUrl: './home.component.html',
  styleUrls: ['./home.component.scss']
})
export class HomeComponent implements OnInit {

  translation: Translation = new Translation();
  timeOut: any;
  registerForm: FormGroup;
  error: null;

  constructor(
    private route: Router,
    private translatorServices: TranslatorServiceService
  ) { }

  ngOnInit() {
    this.registerForm = new FormGroup({
      inputText: new FormControl('',
        [Validators.required, Validators.minLength(2), Validators.maxLength(50), Validators.pattern('^[a-zA-Z\s]*$')])
    });
  }

  addTranslation(): void {
    this.translation.inputText = this.registerForm.get('inputText').value;
    this.translatorServices.addTranslation(this.translation).subscribe(r => {
     this.translatorServices.setText(r.outputText);
     this.route.navigate(['/translatedText']);
    });
    clearTimeout(this.timeOut);
  }


  reset(): void {
    this.translation.inputText = this.registerForm.get('inputText').value;
    clearTimeout(this.timeOut);
    this.timeOut = setTimeout(() => {
      this.translatorServices.addTranslation(this.translation).subscribe(r => {
        this.translation.outputText = r.outputText;
      }, error => {
        this.error = error.message;
      });
    }, 3000);
  }

}
