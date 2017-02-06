System.register(['@angular/core', "@angular/router", "./auth_guide.service", "./home.component", "./device.component", "./device_detail.component", "./login.component", "./allot.component", "./allot_detail.component", "./dev_order.component"], function(exports_1, context_1) {
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
    var core_1, router_1, auth_guide_service_1, home_component_1, device_component_1, device_detail_component_1, login_component_1, allot_component_1, allot_detail_component_1, dev_order_component_1;
    var AppRoutingModule;
    return {
        setters:[
            function (core_1_1) {
                core_1 = core_1_1;
            },
            function (router_1_1) {
                router_1 = router_1_1;
            },
            function (auth_guide_service_1_1) {
                auth_guide_service_1 = auth_guide_service_1_1;
            },
            function (home_component_1_1) {
                home_component_1 = home_component_1_1;
            },
            function (device_component_1_1) {
                device_component_1 = device_component_1_1;
            },
            function (device_detail_component_1_1) {
                device_detail_component_1 = device_detail_component_1_1;
            },
            function (login_component_1_1) {
                login_component_1 = login_component_1_1;
            },
            function (allot_component_1_1) {
                allot_component_1 = allot_component_1_1;
            },
            function (allot_detail_component_1_1) {
                allot_detail_component_1 = allot_detail_component_1_1;
            },
            function (dev_order_component_1_1) {
                dev_order_component_1 = dev_order_component_1_1;
            }],
        execute: function() {
            AppRoutingModule = class AppRoutingModule {
            };
            AppRoutingModule = __decorate([
                core_1.NgModule({
                    imports: [
                        router_1.RouterModule.forRoot([
                            { path: 'login', component: login_component_1.LoginComponent },
                            {
                                path: 'app',
                                component: home_component_1.HomeComponent,
                                canActivate: [auth_guide_service_1.AuthGuard],
                                children: [
                                    {
                                        path: 'devices',
                                        component: device_component_1.DeviceComponent
                                    },
                                    {
                                        path: 'device/:id',
                                        component: device_detail_component_1.DeviceDetailComponent
                                    },
                                    {
                                        path: '',
                                        component: device_component_1.DeviceComponent
                                    },
                                    {
                                        path: 'allot',
                                        component: allot_component_1.AllotComponent
                                    },
                                    {
                                        path: 'allot/:id',
                                        component: allot_detail_component_1.AllotDetailComponent
                                    },
                                    {
                                        path: 'order',
                                        component: dev_order_component_1.DevOrderComponent
                                    }
                                ]
                            },
                            {
                                path: '',
                                redirectTo: '/app',
                                pathMatch: 'full'
                            },
                        ], { useHash: true }),
                    ],
                    exports: [
                        router_1.RouterModule
                    ]
                }), 
                __metadata('design:paramtypes', [])
            ], AppRoutingModule);
            exports_1("AppRoutingModule", AppRoutingModule);
        }
    }
});
//# sourceMappingURL=app_routing.module.js.map