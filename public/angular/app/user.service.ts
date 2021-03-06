import { Injectable } from '@angular/core';
import {Http, Headers, Response, RequestOptions} from "@angular/http";

import {Observable} from "rxjs/Observable";
import 'rxjs/add/operator/map';
// Statics
import 'rxjs/add/observable/throw';
// Operators
import 'rxjs/add/operator/catch';
import {BaseService} from "./base.service";
@Injectable()
export class UserService{
    private isLoginUrl = 'user/isLogin';
    private loginUrl = 'user/login';
    private logoutUrl = 'user/logout';

    constructor(private base:BaseService){
    }

    checkLogin():Observable <any>{
        return this.base.getData(this.isLoginUrl);
    }

    login(name:string,pwd:string):Observable <any>
    {
        let username = name;
        let password = pwd;

       return this.base.postData({username,password},this.loginUrl);

    }

    logout():Observable <any>{
        return this.base.getData(this.logoutUrl);
    }
}