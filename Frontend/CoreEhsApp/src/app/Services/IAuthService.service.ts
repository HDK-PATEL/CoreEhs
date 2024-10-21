import { HttpClient } from '@angular/common/http';
import { inject, Injectable } from '@angular/core';
import { Observable } from 'rxjs';
import { tap } from 'rxjs/operators';
import { ILogin } from '../Interfaces/ILogin';
import { response } from 'express';
import { Router } from '@angular/router';

@Injectable({
  providedIn: 'root'
})
export class IAuthServiceService {

  private tokenKey: string = 'authToken';
  ApiURL = "https://localhost:7188/api/v1/";

  http = inject(HttpClient);
  router = inject(Router);

  constructor() { }

  Login(data: ILogin): Observable<any> {
    return this.http.post<any>(this.ApiURL + 'login', data);
  }

  // Logout method
  logout(): void {
    localStorage.removeItem(this.tokenKey);
    this.router.navigate(['/login']);
  }

  // Check if the user is logged in
  isLoggedIn(): boolean {
    return !!localStorage.getItem(this.tokenKey);  // Check if token exists
  }

  // Get the token
  getToken(): string | null {
    return localStorage.getItem(this.tokenKey);
  }

}
