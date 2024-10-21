import { Routes } from '@angular/router';
import path from 'path';
import { HomeComponent } from './Component/Home/Home.component';
import { SidebarComponent } from './Component/Layout/Sidebar/Sidebar.component';
import { AddCarComponent } from './Component/Cars/add-car/add-car.component';
import { CarListComponent } from './Component/Cars/Car-List/Car-List.component';
import { ViewCarComponent } from './Component/Cars/View-Car/View-Car.component';
import { SalesmanCommissionReportComponent } from './Component/Reports/salesman-commission-report/salesman-commission-report.component';
import { LoginComponent } from './Component/Login/Login.component';
import { AuthGuard } from './auth.guard';

export const routes: Routes = [
    {
        path : "home",
        component : SidebarComponent,
        children:[
            {
                path : "home",
                component : HomeComponent
            },
            {
                path : "add-car",
                component : AddCarComponent,
                //canActivate: [AuthGuard]
            },
            {
                path : "car-list",
                component : CarListComponent,
                canActivate: [AuthGuard]
            },
            {
                path : "view-car",
                component : ViewCarComponent,
                canActivate: [AuthGuard]
            },
            {
                path : "report/salesman-wise-sales",
                component : SalesmanCommissionReportComponent,
                canActivate: [AuthGuard]
            }
        ]
    },
    {
        path : "",
        component : LoginComponent
    },
    {
        path : "login",
        component : LoginComponent
    }
];
