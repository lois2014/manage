import { Injectable } from '@angular/core';
import { Headers,Http,Response,RequestOptions} from '@angular/http'
import {Observable} from "rxjs/Observable";
import 'rxjs/add/operator/map';
// Statics
import 'rxjs/add/observable/throw';
// Operators
import 'rxjs/add/operator/catch';

@Injectable()
export class BaseService {

    constructor(private http:Http){}

    getData(url:string): Observable <any> {
        return this.http.get(url)
            .map(this.extractData)
            .catch(this.handleError);
    }


    postData(data:any,url:string):Observable <any> {
        let body = JSON.stringify(data);
        let headers = new Headers({ 'Content-Type': 'application/x-www-form-urlencoded' });
        let options = new RequestOptions({ headers: headers });
        return this.http.post(url,body,options)
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
