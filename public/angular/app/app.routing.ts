import { ModuleWithProviders } from '@angular/core';
import { Routes,RouterModule,Router  } from '@angular/router';

import { HeroesComponent } from './heroes.component';
import { HeroDetailComponent } from './hero-detail.component';
import {DashboardComponent} from "./dashboard.component";
import {loginRoutes, authProviders} from "./login.routing";
import {CanDeactivateGuard} from "./can_deactivate_guard.service";
import {AuthGuard} from "./auth_guide.service";
import {HomeComponent} from "./home.component";
import {DeviceComponent} from "./device.component";
import {DeviceDetailComponent} from "./device_detail.component";
const appRoutes : Routes = [
    ...loginRoutes,
    {
        path: 'app',
        component: HomeComponent,
        canActivate: [AuthGuard],
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
                path: 'dashboard',
                component: DashboardComponent
            },
            {
                path:'devices',
                component: DeviceComponent
            },
            {
                path:'device/:id',
                component: DeviceDetailComponent
            },
            {
                path: '',
                component: DashboardComponent
            },
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