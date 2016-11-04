import{ NgModule } from '@angular/core';
import {RouterModule} from "@angular/router";
import {AuthGuard} from "./auth_guide.service";
import {HomeComponent} from "./home.component";
import {DeviceComponent} from "./device.component";
import {DeviceDetailComponent} from "./device_detail.component";
import {LoginComponent} from "./login.component";
import {AllotComponent} from "./allot.component";
import {AllotDetailComponent} from "./allot_detail.component";
import {DevOrderComponent} from "./dev_order.component";
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
                        path:'devices',
                        component: DeviceComponent
                    },
                    {
                        path:'device/:id',
                        component: DeviceDetailComponent
                    },
                    {
                        path: '',
                        component: DeviceComponent
                    },
                    {
                        path: 'allot',
                        component: AllotComponent
                    },
                    {
                        path: 'allot/:id',
                        component: AllotDetailComponent
                    },
                    {
                        path: 'order',
                        component: DevOrderComponent
                    }
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
        RouterModule
    ]
})

export class AppRoutingModule {}