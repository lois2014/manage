import { Injectable } from '@angular/core';
import {BaseService} from "./base.service";
import {Observable} from "rxjs";

@Injectable()
export class DeviceService{
     private listUrl = 'device/list';
     private addUrl = 'device/add';
     private detailUrl = 'device/detail';
     private updateUrl = 'device/update';
     constructor(private base:BaseService){}
     getDevices(): Observable <any>{
         return this.base.getData(this.listUrl);
     }

     addDevice(data:any): Observable <any> {
         return this.base.postData(data,this.addUrl);
     }

     getDetail(id:number): Observable <any> {
         return this.base.postData({'id':id},this.detailUrl);
     }

     updateDevice(data:any): Observable <any> {
         return this.base.postData(data,this.updateUrl);
     }
}