import { Routes }         from '@angular/router';
import { AuthGuard }      from './auth_guide.service';
import { AuthService }    from './auth.service';
import { LoginComponent } from './login.component';
export const loginRoutes: Routes = [
    { path: 'login', component: LoginComponent }
];
export const authProviders = [
    AuthGuard,
    AuthService
];
