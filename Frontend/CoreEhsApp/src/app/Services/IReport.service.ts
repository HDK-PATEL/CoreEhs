import { HttpClient } from '@angular/common/http';
import { inject, Injectable } from '@angular/core';
import { Observable } from 'rxjs';

@Injectable({
  providedIn: 'root'
})
export class IReportService {

  ApiURL = "https://localhost:7188/api/v1/";
  http = inject(HttpClient);

  constructor() { }

  GetSalesmanCommissionFigure(): Observable<any> {
    return this.http.get(this.ApiURL + 'report/salesman-commission-figure'); // Return the Observable
  }


}
