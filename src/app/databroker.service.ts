import { Injectable } from '@angular/core';
import portfolio from '../assets/portfolio.json';
import { PersonalData } from './model/PersonalData';

@Injectable({
  providedIn: 'root'
})
export class DatabrokerService {
  pd:PersonalData;

  constructor() { 
    this.pd=portfolio.personalData;
  }
  
}
