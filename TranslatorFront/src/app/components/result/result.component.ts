import { Component, OnInit } from '@angular/core';
import { TranslatorServiceService } from 'src/app/services/TranslatorService.service';

@Component({
  selector: 'app-result',
  templateUrl: './result.component.html',
  styleUrls: ['./result.component.scss']
})
export class ResultComponent implements OnInit {

  tekst: string;
  constructor(private TranslatorServices: TranslatorServiceService ) { }

  ngOnInit() {
    this.log();
  }

  log(): void{
    this.tekst = 'Your final translation is: "' + this.TranslatorServices.getText() + '"';
  }

}
