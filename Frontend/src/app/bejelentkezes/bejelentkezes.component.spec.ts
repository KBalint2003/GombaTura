import { ComponentFixture, TestBed } from '@angular/core/testing';

import { BejelentkezesComponent } from './bejelentkezes.component';

describe('BejelentkezesComponent', () => {
  let component: BejelentkezesComponent;
  let fixture: ComponentFixture<BejelentkezesComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      imports: [BejelentkezesComponent]
    })
    .compileComponents();
    
    fixture = TestBed.createComponent(BejelentkezesComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
