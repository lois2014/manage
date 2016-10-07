import { Hero } from './hero';
import { HEROES } from './mock-heroes';
import { Injectable } from '@angular/core';
import { Headers,Http,Response } from '@angular/http'
import 'rxjs/add/operator/toPromise';

@Injectable()
export class HeroService {
    heroes : Hero[];
    private heroesUrl = 'http://local.tp5.com/public/index.php/heroes';
    private headers = new Headers({'Content-Type': 'application/json'});

    constructor(private http:Http){}

     getMyHeroes(): Hero[] {
        return HEROES;
    }

    getHeroes(): Promise <any[]> {
        return this.http.get(this.heroesUrl)
            .toPromise()
            .then(this.extractData)
            .catch(this.handleError);
    }

    private extractData(res: Response) {
        let body = res.json();
        return body.data || '';
    }

     getHeroes2(): Promise <Hero[]> {
        return Promise.resolve(HEROES);
    }

    getHero2(id:number):Promise <Hero> {
        return this.getHeroes2().then(heroes=>heroes.find(hero=>hero.id === id));
    }

    getHero(id:number): Hero {
       this.heroes = this.getMyHeroes().filter(hero=>hero.id === id);
        return this.heroes[0];
    }

    private handleError(error: any): Promise<any> {
        console.error('An error occurred', error); // for demo purposes only
        return Promise.reject(error.message || error);
    }
}
