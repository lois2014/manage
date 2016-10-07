import { ModuleWithProviders } from '@angular/core';
import { Routes,RouterModule,Router  } from '@angular/router';

import { HeroesComponent } from './heroes.component';
import { HeroDetailComponent } from './hero-detail.component';
import {DashboardComponent} from "./dashboard.component";
import {LoginComponent} from "./login.component";
import {AppComponent} from "./app.component";
import {loginRoutes, authProviders} from "./login.routing";
import {CanDeactivateGuard} from "./can_deactivate_guard.service";
import {AuthGuard} from "./auth_guide.service";
const appRoutes : Routes = [
    ...loginRoutes,
    {
        path: 'app',
        component: AppComponent,
        canActivate: [AuthGuard],
        children: [
            {
                path: '',
                canActivateChild: [AuthGuard],
                children: [
                    {
                        path: 'heroes',
                        component: HeroesComponent
                    },
                    {
                        path: "detail/:id",
                        component: HeroDetailComponent
                    },
                    {
                        path: '',
                        component: DashboardComponent
                    },
                ]
            }
        ]
    },
    {
        path: '',
        redirectTo: '/app',
        pathMatch: 'full'
    },
];

export const appRoutingProviders: any[] = [
    authProviders,
    CanDeactivateGuard,


];

export const routing : ModuleWithProviders = RouterModule.forRoot(appRoutes,{ useHash:true });