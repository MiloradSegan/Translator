import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Translation } from '../Models/Translation';
import { Observable } from 'rxjs';

@Injectable({
  providedIn: 'root'
})
export class TranslatorServiceService {
  text: string;
  private url = "https://localhost:44353/Translation/translate"

  constructor(private http: HttpClient) { }

  addTranslation(translation: Translation): Observable<Translation> {
    return this.http.post<Translation>(this.url, translation);
  }

  setText(text: string): void {
    this.text = text;
  }
  getText(): string {
    return this.text;
  }

}
