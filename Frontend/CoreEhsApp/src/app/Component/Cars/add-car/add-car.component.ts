import { Component, inject, OnInit } from '@angular/core';
import { FormBuilder, FormGroup, Validators } from '@angular/forms';
import { CommonModule } from '@angular/common';
import { MatFormFieldModule } from '@angular/material/form-field';
import { MatInputModule } from '@angular/material/input';
import { MatDatepickerModule } from '@angular/material/datepicker';
import { MatNativeDateModule } from '@angular/material/core';
import { MatCheckboxModule } from '@angular/material/checkbox';
import { MatSelectModule } from '@angular/material/select';
import { MatButtonModule } from '@angular/material/button';
import { MatIconModule } from '@angular/material/icon';
import { ReactiveFormsModule, FormsModule } from '@angular/forms';
import { MatToolbarModule } from '@angular/material/toolbar';
import { MatSnackBar, MatSnackBarModule } from '@angular/material/snack-bar';
import { ICarService } from '../../../Services/ICar.service';
import { IMasterService } from '../../../Services/IMaster.service';

@Component({
  selector: 'app-add-car',
  templateUrl: './add-car.component.html',
  styleUrls: ['./add-car.component.css'],
  standalone: true,
  imports: [
    CommonModule,
    MatFormFieldModule,
    MatInputModule,
    MatDatepickerModule,
    MatNativeDateModule,
    MatCheckboxModule,
    MatSelectModule,
    MatButtonModule,
    MatIconModule,
    FormsModule,
    ReactiveFormsModule,
    MatToolbarModule,
    MatSnackBarModule // Keep this for importing the module
  ],
})
export class AddCarComponent implements OnInit {

  _MasterService = inject(IMasterService)

  carModelForm: FormGroup;
  brands : MasterList[] = [];
  classes : MasterList[] = [];
  

  constructor(
    private fb: FormBuilder,
    private _car: ICarService,
    private snackbar: MatSnackBar // Keep this for injecting the service
  ) {
    this.carModelForm = this.fb.group({
      id : [0],
      brandId : [null, Validators.required],
      classId : [null, Validators.required],
      modelName: [''],
      modelCode: ['', [Validators.required, Validators.pattern('^[a-zA-Z0-9]{10}$')]],
      description: ['', Validators.required],
      features: ['', Validators.required],
      price: ['', [Validators.required, Validators.pattern('^[0-9]+(\\.[0-9]{1,2})?$')]],
      dateOfManufacturing: ['', Validators.required],
      sortOrder: ['', [Validators.required, Validators.pattern('^[0-9]+$')]],
    });
  }

  ngOnInit(): void {
    this.getBrand();
    this.getClass();
  }

  onSubmit() {
    if (this.carModelForm.valid) {
      console.log(this.carModelForm.value);
      this._car.postCardetail(this.carModelForm.value).subscribe(data => {
        this.snackbar.open('Car details submitted successfully!', 'Close', {
          duration: 3000, // Duration in milliseconds
        });
      });
    } else {
      console.log('Form is invalid');
    }
  }

  getBrand() {
    this._MasterService.GetBrand().subscribe(data => {
      if (data) {
        this.brands = data.result;
      }
    })
  }

  getClass() {
    this._MasterService.GetClass().subscribe(data => {
      if (data) {
        this.classes = data.result;
      }
    })
  }
}

export interface MasterList{
  Id : number;
  Name : string
}

