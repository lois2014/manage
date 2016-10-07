import { Component,Input,OnInit } from '@angular/core';
import { ActivatedRoute,Params } from '@angular/router';
import { Location } from '@angular/common';

import{ Hero } from './hero';
import { HeroService } from './hero.service';
declare var __moduleName: string;
@Component({
    selector: 'my-hero-detail',
    moduleId: __moduleName,
    templateUrl: '/public/angular/tpl/hero-detail.component.html',
    styleUrls: [
        'http://local.tp5.com/public/angular/css/app.component.css',
    ]
})

export class HeroDetailComponent implements OnInit{
    @Input()
    hero:Hero;

    constructor(private heroService:HeroService,
                private route:ActivatedRoute,
                private location:Location
    ){}


    ngOnInit():void{
        this.route.params.forEach((params:Params)=>{
            let id = +params['id'];
            this.heroService.getHero2(id).then(hero=>this.hero=hero);
            // this.hero = this.heroService.getHero(id);
        });
    }

    goBack():void{
        this.location.back();
    }
}