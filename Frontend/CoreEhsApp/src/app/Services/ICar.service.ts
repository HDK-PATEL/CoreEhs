import { HttpClient } from '@angular/common/http';
import { inject, Injectable } from '@angular/core';
import { Observable } from 'rxjs';

@Injectable({
  providedIn: 'root'
})
export class ICarService {

ApiURL = "https://localhost:7188/api/v1/";
http=inject(HttpClient);

constructor() { }

postCardetail (data:any): Observable<any>{
  return this.http.post(this.ApiURL ,data)
 }

}
