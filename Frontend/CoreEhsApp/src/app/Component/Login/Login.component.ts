import { Component, inject, OnInit } from '@angular/core';
import { IAuthServiceService } from '../../Services/IAuthService.service';
import { ILogin } from '../../Interfaces/ILogin';
import { Router } from '@angular/router';
import { FormsModule } from '@angular/forms';

@Component({
  selector: 'app-Login',
  templateUrl: './Login.component.html',
  styleUrls: ['./Login.component.css'],
  standalone: true,
  imports: [
    FormsModule
  ]
})
export class LoginComponent implements OnInit {

  authService = inject(IAuthServiceService);
  router = inject(Router);
  credentials: ILogin = {
    Username: '',
    Password: ''
  }
  constructor() { }

  ngOnInit() {
  }
  login(): void {
    if (this.credentials.Username && this.credentials.Password) {
      this.authService.Login(this.credentials).subscribe( data => {
        if (data.result) {
          localStorage.setItem("authToken", data.result);
          this.router.navigate(['/home']);
        }
      })
      
    } else {
      this.errorMessage = 'Please fill out both fields';
    }
  }
  errorMessage: string = '';

}
