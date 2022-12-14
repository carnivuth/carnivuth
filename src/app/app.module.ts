import { NgModule } from '@angular/core';
import { BrowserModule } from '@angular/platform-browser';

import { AppComponent } from './app.component';
import { BrowserAnimationsModule } from '@angular/platform-browser/animations';
import { NbThemeModule, NbLayoutModule, NbCardModule, NbListModule } from '@nebular/theme';
import { NbEvaIconsModule } from '@nebular/eva-icons';
import { AppRoutingModule } from './app-routing.module';
import { PersonalDataComponent } from './personal-data/personal-data.component';
import { SkillItemComponent } from './skill-item/skill-item.component';
import { SkillListComponent } from './skill-list/skill-list.component';
import { HobbiesListComponent } from './hobbies-list/hobbies-list.component';
import { HobbiesItemComponent } from './hobbies-item/hobbies-item.component';

@NgModule({
  declarations: [
    AppComponent,
    PersonalDataComponent,
    SkillItemComponent,
    SkillListComponent,
    HobbiesListComponent,
    HobbiesItemComponent
  ],
  imports: [
    BrowserModule,
    BrowserAnimationsModule,
    NbThemeModule.forRoot({ name: 'default' }),
    NbLayoutModule,
    NbCardModule,
    NbListModule,
    NbEvaIconsModule,
    AppRoutingModule
  ],
  providers: [],
  bootstrap: [AppComponent]
})
export class AppModule { }
