System.register(['@angular/core', './user.service', 'rxjs/add/observable/of', 'rxjs/add/operator/do', 'rxjs/add/operator/delay'], function(exports_1, context_1) {
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
    var core_1, user_service_1;
    var AuthService;
    return {
        setters:[
            function (core_1_1) {
                core_1 = core_1_1;
            },
            function (user_service_1_1) {
                user_service_1 = user_service_1_1;
            },
            function (_1) {},
            function (_2) {},
            function (_3) {}],
        execute: function() {
            AuthService = class AuthService {
                constructor(user) {
                    this.user = user;
                    this.isLoggedIn = false;
                }
                login(name, pwd) {
                    return this.user.login(name, pwd);
                }
                checkLogin() {
                    this.user.checkLogin().subscribe(val => {
                        if (val.state == 1) {
                            this.isLoggedIn = true;
                            return true;
                        }
                    });
                    return this.isLoggedIn;
                }
                logout() {
                    this.user.logout().subscribe(val => {
                        if (val.state == 1) {
                            this.isLoggedIn = false;
                        }
                    });
                }
            };
            AuthService = __decorate([
                core_1.Injectable(), 
                __metadata('design:paramtypes', [user_service_1.UserService])
            ], AuthService);
            exports_1("AuthService", AuthService);
        }
    }
});
//# sourceMappingURL=auth.service.js.map