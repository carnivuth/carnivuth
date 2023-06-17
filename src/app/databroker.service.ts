import { Injectable } from '@angular/core';
import portfolio from '../assets/portfolio.json';
import { PersonalData } from './model/PersonalData';
import { Skill } from './model/Skill';
import { Formation } from './model/Formation';
import { WorkExperience } from './model/WorkExperience';
import { Text } from './model/Text';
import { Contact } from './model/Contact';

@Injectable({
  providedIn: 'root'
})
export class DatabrokerService {
  pd:PersonalData;
  skills:Skill[];
  formations:Formation[];
  workExperiences:WorkExperience[];
  texts:Text[];
  contacts:Contact[];

  constructor() { 
    this.pd=portfolio.personalData;
    this.skills=portfolio.skills;
    this.workExperiences=portfolio.workexperiences;
    this.formations=portfolio.formation;
    this.texts=portfolio.texts;
    this.contacts=portfolio.contacts;
  }
  
}
