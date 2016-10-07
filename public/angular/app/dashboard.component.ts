import { Component ,OnInit } from '@angular/core';
import { Router } from '@angular/router';

import { Hero } from './hero';
import { HeroService } from './hero.service';
declare var __moduleName : string;

@Component({
    selector: 'my-dashboard',
    moduleId: __moduleName,
    templateUrl:'/public/angular/tpl/dashboard.component.html',
    styleUrls:['http://local.tp5.com/public/angular/css/app.component.css',]
})

export class DashboardComponent implements OnInit{
    heroes : Hero[] = [];
    constructor(private heroService:HeroService,
                private router : Router
    ){ }
    getHeroes():void {
        this.heroService.getHeroes2().then(heroes=>this.heroes = heroes.slice(1,5));
        // this.heroes = this.heroService.getMyHeroes().slice(1,5);
    }
    ngOnInit():void{
        this.getHeroes();
    }

    gotoDetail(hero:Hero){
        let link=['/detail',hero.id];
        this.router.navigate(link);
    }
}