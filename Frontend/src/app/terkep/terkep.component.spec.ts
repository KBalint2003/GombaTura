import { ComponentFixture, TestBed } from '@angular/core/testing';

import { TerkepComponent } from './terkep.component';

describe('TerkepComponent', () => {
  let component: TerkepComponent;
  let fixture: ComponentFixture<TerkepComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      imports: [TerkepComponent]
    })
    .compileComponents();
    
    fixture = TestBed.createComponent(TerkepComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
