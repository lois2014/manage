import {Component, OnInit} from '@angular/core';
import {UserService} from "./user.service";
import {Router} from "@angular/router";
import {AuthService} from "./auth.service";

declare var __moduleName : string;

@Component({
  selector:'app-login',
  moduleId: __moduleName,
  templateUrl:'/public/angular/tpl/login.component.html'
})

export class LoginComponent {

  isLog : boolean = true;
  submitted = false;
  active = true;
    // isLogin():void{
    //     this.user.checkLogin().then(val=>{
    //       if(val.state == 0){
    //         this.router.navigate(['/dashboard']);
    //       }
    //     });
    // }
    // ngOnInit(){
    //     this.isLogin();

  message: string;
  constructor(public authService: AuthService, public router: Router) {
    this.setMessage();
  }

  setMessage() {
    this.message = 'Logged ' + (this.authService.isLoggedIn ? 'in' : 'out');
  }
  login(name:string,pwd:string) {
    this.message = 'Trying to log in ...';
    this.authService.login(name,pwd).subscribe(val => {
      this.setMessage();
      if (val.state == 1) {
        // Get the redirect URL from our auth service
        // If no redirect has been set, use the default
        let redirect = this.authService.redirectUrl ? this.authService.redirectUrl : '/app/dashboard';
        // Redirect the user
        this.router.navigate([redirect]);
      }
    });
  }
  logout() {
    this.authService.logout();
    this.setMessage();
  }

    onSubmit(name:string,pwd:string){
    this.submitted = true;
        this.login(name,pwd);
  }

}