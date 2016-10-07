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
        this.user.login(name,pwd).subscribe(val=>{
            if(val.state == 1){
                this.isLoggedIn = true;
            }
        });
        return Observable.of(true).delay(1000).do(this.isLoggedIn = true);
    }
    checkLogin():void{
        this.user.checkLogin().subscribe(val=>{
            if(val.state == 1){
                this.isLoggedIn = true;
            }
        });
    }

    logout(): void {
        this.user.logout().subscribe(val=>{
            if(val.state == 1){
                this.isLoggedIn = false;
            }
        });
        this.isLoggedIn = false;
    }
}
