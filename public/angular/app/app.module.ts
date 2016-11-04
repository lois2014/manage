import { NgModule }      from '@angular/core';
import { BrowserModule } from '@angular/platform-browser';
import {FormsModule} from "@angular/forms";
import { HttpModule } from '@angular/http';

import { AppComponent }  from './app.component';
import {LoginComponent} from "./login.component";
import {UserService} from "./user.service";
import {BaseService} from "./base.service";
import {HomeComponent} from "./home.component";
import {DeviceService} from "./device.service";
import {DeviceComponent} from "./device.component";
import {DeviceDetailComponent} from "./device_detail.component";
import {APP_BASE_HREF} from "@angular/common";
import {AppRoutingModule} from "./app_routing.module";
import {LoginRoutingModule} from "./login_routing.module";
import {AllotComponent} from "./allot.component";
import {AllotService} from "./allot.service";
import {AllotDetailComponent} from "./allot_detail.component";
import {DevOrderComponent} from "./dev_order.component";
import {OrderService} from "./order.service";

@NgModule({
  imports: [
      BrowserModule,
      FormsModule,
      HttpModule,
      AppRoutingModule,
      LoginRoutingModule,
  ],
  declarations: [
      AppComponent,
      LoginComponent,
      HomeComponent,
      DeviceComponent,
      DeviceDetailComponent,
      AllotComponent,
      AllotDetailComponent,
      DevOrderComponent
  ],
  providers: [
        UserService,
        BaseService,
        DeviceService,
        AllotService,
        OrderService,
        {provide: APP_BASE_HREF, useValue: '/my'},
  ],
  bootstrap: [ AppComponent ]
})
export class AppModule { }
