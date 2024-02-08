import { TestBed } from '@angular/core/testing';

import { RegisztracioService } from './regisztracio.service';

describe('RegisztracioService', () => {
  let service: RegisztracioService;

  beforeEach(() => {
    TestBed.configureTestingModule({});
    service = TestBed.inject(RegisztracioService);
  });

  it('should be created', () => {
    expect(service).toBeTruthy();
  });
});
