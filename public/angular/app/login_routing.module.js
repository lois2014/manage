System.register(['@angular/core', "./auth_guide.service", "./auth.service", "./can_deactivate_guard.service"], function(exports_1, context_1) {
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
    var core_1, auth_guide_service_1, auth_service_1, can_deactivate_guard_service_1;
    var LoginRoutingModule;
    return {
        setters:[
            function (core_1_1) {
                core_1 = core_1_1;
            },
            function (auth_guide_service_1_1) {
                auth_guide_service_1 = auth_guide_service_1_1;
            },
            function (auth_service_1_1) {
                auth_service_1 = auth_service_1_1;
            },
            function (can_deactivate_guard_service_1_1) {
                can_deactivate_guard_service_1 = can_deactivate_guard_service_1_1;
            }],
        execute: function() {
            LoginRoutingModule = class LoginRoutingModule {
            };
            LoginRoutingModule = __decorate([
                core_1.NgModule({
                    providers: [
                        auth_guide_service_1.AuthGuard,
                        auth_service_1.AuthService,
                        can_deactivate_guard_service_1.CanDeactivateGuard,
                    ]
                }), 
                __metadata('design:paramtypes', [])
            ], LoginRoutingModule);
            exports_1("LoginRoutingModule", LoginRoutingModule);
        }
    }
});
//# sourceMappingURL=login_routing.module.js.map