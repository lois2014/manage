import {Component, OnInit} from '@angular/core';
import {Router} from "@angular/router";
import {AuthService} from "./auth.service";
import {User} from "./user";
import {UserService} from "./user.service";

declare var __moduleName : string;

@Component({
  selector:'app-login',
  moduleId: __moduleName,
  templateUrl:'/public/angular/tpl/login.component.html',
})

export class LoginComponent implements OnInit{

  submitted = false;
  active = true;

  model = new User(1,'','');

  message: string;
  constructor(private authService: AuthService,
              private router: Router,
              private user:UserService
  ) {
    this.message = '';
  }

  ngOnInit():void{
    this.user.checkLogin().subscribe(d=>{
      if(d.state == 1) {
        this.router.navigate(['../app']);
      }
    });
  }

  setMessage() {
    this.message = 'Logged ' + (this.authService.isLoggedIn ? 'in' : 'out');
  }
  login(model) {
    this.message = 'Trying to log in ...';
    this.authService.login(model.name,model.password).subscribe(val => {
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

    onSubmit(){
    this.submitted = true;
      this.login(this.model);
  }

}