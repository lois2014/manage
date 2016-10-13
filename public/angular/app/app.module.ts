import { NgModule }      from '@angular/core';
import { BrowserModule } from '@angular/platform-browser';
import {FormsModule} from "@angular/forms";
import { HttpModule } from '@angular/http';

import { AppComponent }  from './app.component';
import {HeroDetailComponent} from './hero-detail.component';
import { HeroesComponent } from './heroes.component';
import { DashboardComponent } from './dashboard.component';
import {HeroService} from "./hero.service";
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

@NgModule({
  imports: [
      BrowserModule,
      FormsModule,
      HttpModule,
      AppRoutingModule,
      LoginRoutingModule
  ],
  declarations: [
      AppComponent,
      DashboardComponent,
      HeroDetailComponent,
      HeroesComponent,
      LoginComponent,
      HomeComponent,
      DeviceComponent,
      DeviceDetailComponent
  ],
  providers: [
        HeroService,
        UserService,
        BaseService,
        DeviceService,
        {provide: APP_BASE_HREF, useValue: '/my'},
  ],
  bootstrap: [ AppComponent ]
})
export class AppModule { }
