System.register(["./auth_guide.service", "./app.component", "@angular/router", "./heroes.component", "./hero-detail.component", "./dashboard.component"], function(exports_1, context_1) {
    "use strict";
    var __moduleName = context_1 && context_1.id;
    var auth_guide_service_1, app_component_1, router_1, heroes_component_1, hero_detail_component_1, dashboard_component_1;
    var adminRoutes, adminRouting;
    return {
        setters:[
            function (auth_guide_service_1_1) {
                auth_guide_service_1 = auth_guide_service_1_1;
            },
            function (app_component_1_1) {
                app_component_1 = app_component_1_1;
            },
            function (router_1_1) {
                router_1 = router_1_1;
            },
            function (heroes_component_1_1) {
                heroes_component_1 = heroes_component_1_1;
            },
            function (hero_detail_component_1_1) {
                hero_detail_component_1 = hero_detail_component_1_1;
            },
            function (dashboard_component_1_1) {
                dashboard_component_1 = dashboard_component_1_1;
            }],
        execute: function() {
            adminRoutes = [
                {
                    path: 'app',
                    component: app_component_1.AppComponent,
                    canActivate: [auth_guide_service_1.AuthGuard],
                    children: [
                        {
                            path: '',
                            canActivateChild: [auth_guide_service_1.AuthGuard],
                            children: [
                                {
                                    path: 'heroes',
                                    component: heroes_component_1.HeroesComponent
                                },
                                {
                                    path: "detail/:id",
                                    component: hero_detail_component_1.HeroDetailComponent
                                },
                                {
                                    path: '',
                                    component: dashboard_component_1.DashboardComponent
                                },
                            ]
                        }
                    ]
                }
            ];
            exports_1("adminRouting", adminRouting = router_1.RouterModule.forChild(adminRoutes));
        }
    }
});
//# sourceMappingURL=admin.routing.js.map