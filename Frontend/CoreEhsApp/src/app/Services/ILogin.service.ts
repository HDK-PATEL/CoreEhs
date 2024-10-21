import { HttpClient } from '@angular/common/http';
import { inject, Injectable } from '@angular/core';

@Injectable({
  providedIn: 'root'
})
export class ILoginService {
  ApiURL = "https://localhost:7188";
  http=inject(HttpClient);
constructor() { }

}
