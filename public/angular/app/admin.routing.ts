import {AuthGuard} from "./auth_guide.service";
import {AppComponent} from "./app.component";
import {Routes, RouterModule} from "@angular/router";
import {ModuleWithProviders} from "@angular/core";
import {HeroesComponent} from "./heroes.component";
import {HeroDetailComponent} from "./hero-detail.component";
import {DashboardComponent} from "./dashboard.component";
const adminRoutes: Routes = [
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
                        path:'heroes',
                        component: HeroesComponent
                    },
                    {
                        path:"detail/:id",
                        component: HeroDetailComponent
                    },
                    {
                        path:'',
                        component: DashboardComponent
                    },
                ]
            }
        ]
    }
];

export const adminRouting: ModuleWithProviders = RouterModule.forChild(adminRoutes);