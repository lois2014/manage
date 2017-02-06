System.register(['@angular/core', '@angular/platform-browser', "@angular/forms", '@angular/http', './app.component', "./login.component", "./user.service", "./base.service", "./home.component", "./device.service", "./device.component", "./device_detail.component", "@angular/common", "./app_routing.module", "./login_routing.module", "./allot.component", "./allot.service", "./allot_detail.component", "./dev_order.component", "./order.service"], function(exports_1, context_1) {
    "use strict";
    var __moduleName = context_1 && context_1.id;
    var __decorate = (this && this.__decorate) || function (decorators, target, key, desc) {
        var c = arguments.length, r = c < 3 ? target : desc === null ? desc = Object.getOwnPropertyDescriptor(target, key) : desc, d;
        if (typeof Reflect === "object" && typeof Reflect.decorate === "function") r = Reflect.decorate(decorators, target, key, desc);
        else for (var i = decorators.length - 1; i >= 0; i--) if (d = decorators[i]) r = (c < 3 ? d(r) : c > 3 ? d(target, key, r) : d(target, key)) || r;
        return c > 3 && r && Object.defineProperty(target, key, r), r;
    };
    var __metadata = (this && this.__metadata) || function (k, v) {
        if (typeof Reflect === "object" && typeof Reflect.metadata === "function") return Reflect.metadata(k, v);
    };
    var core_1, platform_browser_1, forms_1, http_1, app_component_1, login_component_1, user_service_1, base_service_1, home_component_1, device_service_1, device_component_1, device_detail_component_1, common_1, app_routing_module_1, login_routing_module_1, allot_component_1, allot_service_1, allot_detail_component_1, dev_order_component_1, order_service_1;
    var AppModule;
    return {
        setters:[
            function (core_1_1) {
                core_1 = core_1_1;
            },
            function (platform_browser_1_1) {
                platform_browser_1 = platform_browser_1_1;
            },
            function (forms_1_1) {
                forms_1 = forms_1_1;
            },
            function (http_1_1) {
                http_1 = http_1_1;
            },
            function (app_component_1_1) {
                app_component_1 = app_component_1_1;
            },
            function (login_component_1_1) {
                login_component_1 = login_component_1_1;
            },
            function (user_service_1_1) {
                user_service_1 = user_service_1_1;
            },
            function (base_service_1_1) {
                base_service_1 = base_service_1_1;
            },
            function (home_component_1_1) {
                home_component_1 = home_component_1_1;
            },
            function (device_service_1_1) {
                device_service_1 = device_service_1_1;
            },
            function (device_component_1_1) {
                device_component_1 = device_component_1_1;
            },
            function (device_detail_component_1_1) {
                device_detail_component_1 = device_detail_component_1_1;
            },
            function (common_1_1) {
                common_1 = common_1_1;
            },
            function (app_routing_module_1_1) {
                app_routing_module_1 = app_routing_module_1_1;
            },
            function (login_routing_module_1_1) {
                login_routing_module_1 = login_routing_module_1_1;
            },
            function (allot_component_1_1) {
                allot_component_1 = allot_component_1_1;
            },
            function (allot_service_1_1) {
                allot_service_1 = allot_service_1_1;
            },
            function (allot_detail_component_1_1) {
                allot_detail_component_1 = allot_detail_component_1_1;
            },
            function (dev_order_component_1_1) {
                dev_order_component_1 = dev_order_component_1_1;
            },
            function (order_service_1_1) {
                order_service_1 = order_service_1_1;
            }],
        execute: function() {
            AppModule = class AppModule {
            };
            AppModule = __decorate([
                core_1.NgModule({
                    imports: [
                        platform_browser_1.BrowserModule,
                        forms_1.FormsModule,
                        http_1.HttpModule,
                        app_routing_module_1.AppRoutingModule,
                        login_routing_module_1.LoginRoutingModule,
                    ],
                    declarations: [
                        app_component_1.AppComponent,
                        login_component_1.LoginComponent,
                        home_component_1.HomeComponent,
                        device_component_1.DeviceComponent,
                        device_detail_component_1.DeviceDetailComponent,
                        allot_component_1.AllotComponent,
                        allot_detail_component_1.AllotDetailComponent,
                        dev_order_component_1.DevOrderComponent
                    ],
                    providers: [
                        user_service_1.UserService,
                        base_service_1.BaseService,
                        device_service_1.DeviceService,
                        allot_service_1.AllotService,
                        order_service_1.OrderService,
                        { provide: common_1.APP_BASE_HREF, useValue: '/my' },
                    ],
                    bootstrap: [app_component_1.AppComponent]
                }), 
                __metadata('design:paramtypes', [])
            ], AppModule);
            exports_1("AppModule", AppModule);
        }
    }
});
//# sourceMappingURL=app.module.js.map