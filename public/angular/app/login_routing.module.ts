import { NgModule } from '@angular/core';
import {AuthGuard} from "./auth_guide.service";
import {AuthService} from "./auth.service";
import {CanDeactivateGuard} from "./can_deactivate_guard.service";

@NgModule({
    providers:[
        AuthGuard,
        AuthService,
        CanDeactivateGuard,
    ]
})

export class LoginRoutingModule{}