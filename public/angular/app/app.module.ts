import { NgModule }      from '@angular/core';
import { BrowserModule } from '@angular/platform-browser';
import {FormsModule} from "@angular/forms";
import { HttpModule } from '@angular/http';

import {routing, appRoutingProviders} from "./app.routing";

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

@NgModule({
  imports: [
      BrowserModule,
      FormsModule,
      HttpModule,
      routing
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
        appRoutingProviders,
        UserService,
        BaseService,
        DeviceService,
        {provide: APP_BASE_HREF, useValue: '/my'},
  ],
  bootstrap: [ AppComponent ]
})
export class AppModule { }
