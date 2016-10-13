import{ NgModule } from '@angular/core';
import {RouterModule} from "@angular/router";
import { HeroesComponent } from './heroes.component';
import { HeroDetailComponent } from './hero-detail.component';
import {DashboardComponent} from "./dashboard.component";
import {AuthGuard} from "./auth_guide.service";
import {HomeComponent} from "./home.component";
import {DeviceComponent} from "./device.component";
import {DeviceDetailComponent} from "./device_detail.component";
import {LoginComponent} from "./login.component";

@NgModule({
    imports:[
        RouterModule.forRoot([
            { path: 'login', component: LoginComponent},
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
        ],{ useHash:true }),
    ],
    exports:[
        RouterModule,
    ]
})

export class AppRoutingModule {}