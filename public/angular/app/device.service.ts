import { Injectable } from '@angular/core';
import {BaseService} from "./base.service";
import {Observable} from "rxjs";

@Injectable()
export class DeviceService{
     private listUrl = 'http://local.tp5.com/public/index.php/device/list';
     private addUrl = 'http://local.tp5.com/public/index.php/device/add';
     private detailUrl = 'http://local.tp5.com/public/index.php/device/detail';
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
}