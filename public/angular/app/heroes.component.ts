import { Component , OnInit } from '@angular/core';
import { Router } from '@angular/router';

import { Hero } from './hero';
import { HeroService } from './hero.service';
declare var __moduleName: string;
@Component({
    selector: 'my-heroes',
    moduleId: __moduleName,
    templateUrl : '/public/angular/tpl/heroes.component.html',
    styleUrls: ['http://local.tp5.com/public/angular/css/app.component.css',],
    providers: [HeroService]
})

export class HeroesComponent implements OnInit {
    selectedHero: Hero;
    heroes : Hero[];
    title = 'My Heroes';
    constructor(private router: Router,
                private heroService: HeroService) { }
    getHeroes(): void {
        this.heroService.getHeroes().then(heroes=>this.heroes = heroes).catch(this.handleError);
        // this.heroes = this.heroService.getMyHeroes();
    }
    ngOnInit(): void {
        this.getHeroes();
    }
    onSelect(hero: Hero):void{
        this.selectedHero = hero;
    }

    gotoDetail():void{
        this.router.navigate(['/app/detail',this.selectedHero.id]);
    }

    private handleError(error: any): Promise<any> {
        console.error('An error occurred', error); // for demo purposes only
        return Promise.reject(error.message || error);
    }
}


