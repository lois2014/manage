import { Injectable } from '@angular/core';
import {BaseService} from "./app/base.service";
import {Observable} from "rxjs";

@Injectable()
export class OrderService{
    constructor(private base:BaseService){}
    private listUrl = 'order/list';

    getOrderList():Observable <any> {
        return this.base.getData(this.listUrl);
    }
}