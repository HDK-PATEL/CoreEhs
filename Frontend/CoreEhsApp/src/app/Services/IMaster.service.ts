import { HttpClient } from '@angular/common/http';
import { inject, Injectable } from '@angular/core';
import { Observable } from 'rxjs';

@Injectable({
  providedIn: 'root'
})
export class IMasterService {

  ApiURL = "https://localhost:7188/api/v1/";
  http = inject(HttpClient);

  constructor() { }

  GetBrand(): Observable<any> {
    return this.http.get(this.ApiURL + 'master/brand');
  }

  GetClass(): Observable<any> {
    return this.http.get(this.ApiURL + 'master/class');
  }

}
