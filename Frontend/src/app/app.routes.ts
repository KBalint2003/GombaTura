import { Routes } from '@angular/router';
import {HomeComponent} from "./home/home.component";
import {EnciklopediaComponent} from "./enciklopedia/enciklopedia.component";
import {ForumComponent} from "./forum/forum.component";
import {TerkepComponent} from "./terkep/terkep.component";
import {TuraComponent} from "./tura/tura.component";
import {UserComponent} from "./user/user.component";
import {BejelentkezesComponent} from "./bejelentkezes/bejelentkezes.component";
import {RegisztracioComponent} from "./regisztracio/regisztracio.component";

// A navbar-ban használt routerLink ezekre az útvonalakra hivatkozik a Routing folyamat során.
export const routes: Routes = [
  {'path': '', component: HomeComponent},
  {'path': 'enciklopedia', component: EnciklopediaComponent},
  {'path': 'forum', component: ForumComponent},
  {'path': 'regisztracio', component: RegisztracioComponent},
  {'path': 'bejelentkezes', component: BejelentkezesComponent},
  {'path': 'terkep', component: TerkepComponent},
  {'path': 'tura', component: TuraComponent},
  {'path': 'felhasznalo', component: UserComponent}
];
