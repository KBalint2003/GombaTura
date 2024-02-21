import { ComponentFixture, TestBed } from '@angular/core/testing';

import { FelhasznaloComponent } from './felhasznalo.component';

describe('UserComponent', () => {
  let component: FelhasznaloComponent;
  let fixture: ComponentFixture<FelhasznaloComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      imports: [FelhasznaloComponent]
    })
    .compileComponents();

    fixture = TestBed.createComponent(FelhasznaloComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
