import { Routes } from '@angular/router';
import {HomeComponent} from "./home/home.component";
import {EnciklopediaComponent} from "./enciklopedia/enciklopedia.component";
import {ForumComponent} from "./forum/forum.component";
import {LoginComponent} from "./login/login.component";
import {TerkepComponent} from "./terkep/terkep.component";
import {TuraComponent} from "./tura/tura.component";
import {UserComponent} from "./user/user.component";

export const routes: Routes = [
  {'path': '', component: HomeComponent},
  {'path': 'enciklopedia', component: EnciklopediaComponent},
  {'path': 'forum', component: ForumComponent},
  {'path': 'login', component: LoginComponent},
  {'path': 'terkep', component: TerkepComponent},
  {'path': 'tura', component: TuraComponent},
  {'path': 'felhasznalo', component: UserComponent}
];
