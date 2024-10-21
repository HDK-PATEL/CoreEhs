import { HttpClient } from '@angular/common/http';
import { inject, Injectable } from '@angular/core';
import { Observable } from 'rxjs';

@Injectable({
  providedIn: 'root'
})
export class IMenuService {

  ApiURL = "https://localhost:7188/api/v1/";
  http = inject(HttpClient);

  constructor() { }

  getmenulist(): Observable<any> {
    return this.http.get(this.ApiURL + 'menu'); // Return the Observable
  }

}
