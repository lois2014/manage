import { Injectable } from '@angular/core';

import{ UserService } from './user.service';

import { Observable } from 'rxjs/Observable';
import 'rxjs/add/observable/of';
import 'rxjs/add/operator/do';
import 'rxjs/add/operator/delay';

@Injectable()
export class AuthService {
    isLoggedIn: boolean = false;

    // store the URL so we can redirect after logging in
    redirectUrl: string;

    constructor( private user:UserService){}

    login(name:string,pwd:string): Observable <any> {
        return this.user.login(name,pwd);
    }
    checkLogin():boolean{
        this.user.checkLogin().subscribe(val=>{
            if(val.state == 1){
                this.isLoggedIn = true;
                return true;
            }
        });

        return this.isLoggedIn;
    }

    logout(): void {
        this.user.logout().subscribe(val=>{
            if(val.state == 1){
                this.isLoggedIn = false;
            }
        });
    }
}
