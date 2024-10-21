
import {MediaMatcher} from '@angular/cdk/layout';
import {ChangeDetectorRef, Component, OnDestroy, OnInit, inject} from '@angular/core';
import {MatListModule} from '@angular/material/list';
import {MatSidenavModule} from '@angular/material/sidenav';
import {MatIconModule} from '@angular/material/icon';
import {MatButtonModule} from '@angular/material/button';
import {MatToolbarModule} from '@angular/material/toolbar';0
import { RouterOutlet } from '@angular/router';
import { IMenuService } from '../../../Services/IMenu.service';
import { CommonModule } from '@angular/common';
import { RouterModule } from '@angular/router';
import { IAuthServiceService } from '../../../Services/IAuthService.service';


@Component({
  selector: 'app-Sidebar',
  templateUrl: './Sidebar.component.html',
  styleUrls: ['./Sidebar.component.css'],
  standalone: true,
  preserveWhitespaces: true,
  imports:[
    MatListModule,
    MatSidenavModule,
    MatIconModule,
    MatButtonModule,
    MatToolbarModule,
    RouterOutlet,CommonModule,
    RouterModule
  ],
})
export class SidebarComponent implements OnDestroy {
  menuList: any =  [];
  Authservice = inject(IAuthServiceService);

  ngOnInit() {
    this.getMenu();
  }
  mobileQuery: MediaQueryList;

  fillerNav = Array.from({length: 50}, (_, i) => `Nav Item ${i + 1}`);


  private _mobileQueryListener: () => void;

  constructor( private _menu : IMenuService) {
    const changeDetectorRef = inject(ChangeDetectorRef);
    const media = inject(MediaMatcher);

    this.mobileQuery = media.matchMedia('(max-width: 600px)');
    this._mobileQueryListener = () => changeDetectorRef.detectChanges();
    this.mobileQuery.addListener(this._mobileQueryListener);
  }

  ngOnDestroy(): void {
    this.mobileQuery.removeListener(this._mobileQueryListener);
  }

  getMenu(){
    this._menu.getmenulist().subscribe(data => {
      if(data){
        this.menuList = data.result
      }
    })
  }

  Logout(){
    this.Authservice.logout();
  }
  // shouldRun = /(^|.)(stackblitz|webcontainer).(io|com)$/.test(window.location.host);

}
