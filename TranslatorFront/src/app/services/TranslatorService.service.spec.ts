/* tslint:disable:no-unused-variable */

import { TestBed, async, inject } from '@angular/core/testing';
import { TranslatorServiceService } from './TranslatorService.service';

describe('Service: TranslatorService', () => {
  beforeEach(() => {
    TestBed.configureTestingModule({
      providers: [TranslatorServiceService]
    });
  });

  it('should ...', inject([TranslatorServiceService], (service: TranslatorServiceService) => {
    expect(service).toBeTruthy();
  }));
});
