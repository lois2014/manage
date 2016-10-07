import { Injectable } from '@angular/core';
import { Headers,Http,Response,RequestOptions} from '@angular/http'
import 'rxjs/add/operator/toPromise';
import {Data} from "./data";

@Injectable()
export class BaseService {

    constructor(private http:Http){}

    getData(url:string): Promise <Data> {
        return this.http.get(url)
            .toPromise()
            .then(this.extractData)
            .catch(this.handleError);
    }


    postData(data:any,url:string):Promise <Data> {
        let body = JSON.stringify(data);
        let headers = new Headers({ 'Content-Type': 'application/json' });
        let options = new RequestOptions({ headers: headers });
        return this.http.post(url,body,options)
            .toPromise()
            .then(this.extractData)
            .catch(this.handleError);

    }

    private extractData(res: Response) {
        let body = res.json();
        // alert(body.state);
        return body || {};
    }

    private handleError(error: any): Promise<any> {
        console.error('An error occurred', error); // for demo purposes only
        return Promise.reject(error.message || error);
    }
}
