import { ComponentFixture, TestBed } from '@angular/core/testing';

import { TuraComponent } from './tura.component';

describe('TuraComponent', () => {
  let component: TuraComponent;
  let fixture: ComponentFixture<TuraComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      imports: [TuraComponent]
    })
    .compileComponents();
    
    fixture = TestBed.createComponent(TuraComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
