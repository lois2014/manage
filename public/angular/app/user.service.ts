import { Injectable } from '@angular/core';
import {Http, Headers, Response, RequestOptions} from "@angular/http";

import {Observable} from "rxjs/Observable";
import 'rxjs/add/operator/map';
// Statics
import 'rxjs/add/observable/throw';
// Operators
import 'rxjs/add/operator/catch';
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
        let username = name;
        let password = pwd;
        let body = JSON.stringify({ username, password });
        let headers = new Headers({ 'Content-Type': 'application/x-www-form-urlencoded' });
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