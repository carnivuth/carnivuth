import { NgModule } from '@angular/core';
import { BrowserModule } from '@angular/platform-browser';

import { AppComponent } from './app.component';
import { BrowserAnimationsModule } from '@angular/platform-browser/animations';
import { NbThemeModule, NbLayoutModule, NbCardModule, NbListModule } from '@nebular/theme';
import { NbEvaIconsModule } from '@nebular/eva-icons';
import { AppRoutingModule } from './app-routing.module';
import { PersonalDataComponent } from './personal-data/personal-data.component';

import { WorkExperiencesComponent } from './work-experiences/work-experiences.component';
import { SkillsComponent } from './skills/skills.component';
import { FormationsComponent } from './formations/formations.component';
import { ImageComponent } from './image/image.component';
import { ContactsComponent } from './contacts/contacts.component';

@NgModule({
  declarations: [
    AppComponent,
    PersonalDataComponent,
    WorkExperiencesComponent,
    SkillsComponent,
    FormationsComponent,
    ImageComponent,
    ContactsComponent
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
