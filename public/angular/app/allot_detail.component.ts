import {Component, OnInit} from '@angular/core';
import {AllotService} from "./allot.service";
import {ActivatedRoute, Params, Router} from "@angular/router";

@Component({
    selector: 'my-allot',
    templateUrl: '/public/angular/tpl/allot_detail.component.html'
})

export class AllotDetailComponent implements OnInit{
    private allot:any;
    private dev:any;
    private dep:any;

    submitted = false;

    constructor(private allotService:AllotService,
                private route:ActivatedRoute,
                private router:Router
    ){}

    ngOnInit(){
        this.route.params.forEach((params:Params)=>{
            let id = params['id'];
            this.getDetail(id);
        })
    }

    getDetail(id:number)
    {
        this.allotService.getDetail(id).subscribe(val=>{
            if(val.state == 1) {
                this.allot = val.data.detail;
                this.dev = val.data.dev;
                this.dep = val.data.dep;
            }
        });
    }

    updateDetail(data:any){
        this.allotService.updateAllot(data).subscribe(val=>{
            if(val.state == 1){
                this.allot = val.data;
                alert("更新成功");
                this.router.navigate(['../app/allot']);
            }else{
                alert("更新失败");
                window.history.back();
            }
        })
    }

    onSubmit()
    {
        this.submitted = true;
        this.updateDetail(this.allot);
    }

    cancel()
    {
        this.router.navigate(['../app/allot']);
    }
}