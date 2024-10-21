import { Component, inject, OnInit } from '@angular/core';
import { MatTableModule } from '@angular/material/table';
import { IReportService } from '../../../Services/IReport.service';

@Component({
  selector: 'app-salesman-commission-report',
  templateUrl: './salesman-commission-report.component.html',
  styleUrls: ['./salesman-commission-report.component.css'],
  standalone: true,
  imports: [MatTableModule]
})
export class SalesmanCommissionReportComponent implements OnInit {

  _report = inject(IReportService);
  ReportData: SalesmanCommissionFigure[] = [];
  constructor() { }

  ngOnInit() {
    this.getReport();
  }


  displayedColumns: string[] = ['Salesman', 'Audi', 'Jaguar', 'LandRover', 'Renault'];

  getReport() {
    this._report.GetSalesmanCommissionFigure().subscribe(data => {
      if (data) {
        this.ReportData = data.result;
      }
    })
  }
}

export interface SalesmanCommissionFigure {
  Salesman: string;
  Audi: string;
  Jaguar: string;
  LandRover: string;
  Renault: string;
}
