import { Injectable } from '@angular/core';
import {BaseService} from "./base.service";
import {Observable} from "rxjs";

@Injectable()
export class AllotService {

    constructor(private base:BaseService){}

    private listUrl = 'allot/list';
    private addUrl = 'allot/add';
    private updateUrl = 'allot/update';
    private detailUrl = 'allot/detail';

    getAllot() : Observable <any>{
        return this.base.getData(this.listUrl);
    }

    addAllot(data:any) : Observable <any> {
        return this.base.postData(data,this.addUrl);
    }

    updateAllot(data:any):Observable <any> {
        return this.base.postData(data,this.updateUrl);
    }

    getDetail(id:number){
        return this.base.postData({'id':id},this.detailUrl)
    }
}