import { CanActivate, CanActivateFn, Router } from '@angular/router';
import { IAuthServiceService } from './Services/IAuthService.service';
import { inject, Injectable } from '@angular/core';
@Injectable({
  providedIn: 'root'
})
export class AuthGuard implements CanActivate {

  constructor(private authService: IAuthServiceService, private router: Router) { }

  canActivate(): boolean {
    if (this.authService.isLoggedIn()) {
      return true;
    }
    this.router.navigate(['/login']);
    return false;
  }
}
