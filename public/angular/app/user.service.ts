import { Injectable } from '@angular/core';
import {User} from "./user";
import {Http, Headers, Response, RequestOptions} from "@angular/http";
import { BaseService } from "./base.service";

import {Observable} from "rxjs/Rx";
@Injectable()
export class UserService{
    private isLoginUrl = 'http://local.tp5.com/public/index.php/user/isLogin';
    private loginUrl = 'http://local.tp5.com/public/index.php/user/login';
    private logoutUrl = 'http://local.tp5.com/public/index.php/user/logout';
    constructor(private http:Http){}

    checkLogin():Observable <any>{
        return this.http.get(this.isLoginUrl)
            .map(this.extractData)
            .catch(this.handleError);
    }

    login(name:string,pwd:string):Observable <any>
    {
        let user = new Array(2);
        user['username'] = name;
        user['password'] = pwd;
        let body = JSON.stringify({ user });
        let headers = new Headers({ 'Content-Type': 'application/json' });
        let options = new RequestOptions({ headers: headers });

        return this.http.post(this.loginUrl, body, options)
            .map(this.extractData)
            .catch(this.handleError);

    }

    logout():Observable <any>{
        let body = '';
        let headers = new Headers({ 'Content-Type': 'application/json' });
        let options = new RequestOptions({ headers: headers });

        return this.http.post(this.logoutUrl, body, options)
            .map(this.extractData)
            .catch(this.handleError);
    }
    private extractData(res: Response) {
        let body = res.json();
        return body || {};
    }

    private handleError(error: any): Observable<any> {
        console.error('An error occurred', error); // for demo purposes only
        return Observable.throw(error.message || error);
    }

}