System.register(['@angular/core', "@angular/router", "./auth.service", "./user", "./user.service"], function(exports_1, context_1) {
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
    var core_1, router_1, auth_service_1, user_1, user_service_1;
    var LoginComponent;
    return {
        setters:[
            function (core_1_1) {
                core_1 = core_1_1;
            },
            function (router_1_1) {
                router_1 = router_1_1;
            },
            function (auth_service_1_1) {
                auth_service_1 = auth_service_1_1;
            },
            function (user_1_1) {
                user_1 = user_1_1;
            },
            function (user_service_1_1) {
                user_service_1 = user_service_1_1;
            }],
        execute: function() {
            LoginComponent = class LoginComponent {
                constructor(authService, router, user) {
                    this.authService = authService;
                    this.router = router;
                    this.user = user;
                    this.submitted = false;
                    this.active = true;
                    this.model = new user_1.User(1, '', '');
                    this.message = '';
                }
                ngOnInit() {
                    this.user.checkLogin().subscribe(d => {
                        if (d.state == 1) {
                            this.router.navigate(['../app']);
                        }
                    });
                }
                setMessage() {
                    this.message = 'Logged ' + (this.authService.isLoggedIn ? 'in' : 'out');
                }
                login(model) {
                    this.message = 'Trying to log in ...';
                    this.authService.login(model.name, model.password).subscribe(val => {
                        if (val.state == 1) {
                            this.setMessage();
                            // Get the redirect URL from our auth service
                            // If no redirect has been set, use the default
                            let redirect = this.authService.redirectUrl ? this.authService.redirectUrl : '../app';
                            // Redirect the user
                            // alert(redirect);
                            this.router.navigate([redirect]);
                        }
                        else {
                            alert(val.msg);
                        }
                        location.reload();
                    });
                }
                logout() {
                    this.authService.logout();
                    this.setMessage();
                }
                onSubmit() {
                    this.submitted = true;
                    this.login(this.model);
                }
            };
            LoginComponent = __decorate([
                core_1.Component({
                    selector: 'app-login',
                    moduleId: __moduleName,
                    templateUrl: '/public/angular/tpl/login.component.html',
                }), 
                __metadata('design:paramtypes', [auth_service_1.AuthService, router_1.Router, user_service_1.UserService])
            ], LoginComponent);
            exports_1("LoginComponent", LoginComponent);
        }
    }
});
//# sourceMappingURL=login.component.js.map