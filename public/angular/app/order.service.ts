import { Injectable } from '@angular/core';
import {Observable} from "rxjs";
import {BaseService} from "./base.service";

@Injectable()
export class OrderService{
    constructor(private base:BaseService){}
    private listUrl = 'order/list';
    private addUrl = 'workflow/run';
    private runUrl = 'workflow/run';

    getOrderList():Observable <any> {
        return this.base.getData(this.listUrl);
    }

    addOrder(data:any):Observable <any> {
        return this.base.postData(data,this.addUrl);
    }

    run(data:any):Observable <any> {
        return this.base.postData(data,this.runUrl);
    }


}