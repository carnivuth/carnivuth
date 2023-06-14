import { Injectable } from '@angular/core';
import portfolio from '../assets/portfolio.json';
import { PersonalData } from './model/PersonalData';
import { Skill } from './model/Skill';
import { ValueFromNotification } from 'rxjs';
import { Formation } from './model/Formation';
import { WorkExperience } from './model/WorkExperience';

@Injectable({
  providedIn: 'root'
})
export class DatabrokerService {
  pd:PersonalData;
  skills:Skill[];
  formations:Formation[];
  workExperiences:WorkExperience[];

  constructor() { 
    this.pd=portfolio.personalData;
    this.skills=portfolio.skills;
    this.workExperiences=portfolio.workexperiences;
    this.formations=portfolio.formation;
  }
  
}
