import { ComponentFixture, TestBed } from '@angular/core/testing';

import { EnciklopediaComponent } from './enciklopedia.component';

describe('EnciklopediaComponent', () => {
  let component: EnciklopediaComponent;
  let fixture: ComponentFixture<EnciklopediaComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      imports: [EnciklopediaComponent]
    })
    .compileComponents();
    
    fixture = TestBed.createComponent(EnciklopediaComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
