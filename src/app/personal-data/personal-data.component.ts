import { Component, OnInit } from '@angular/core';
import { DatabrokerService } from '../databroker.service';
import { PersonalData } from '../model/PersonalData';

@Component({
  selector: 'app-personal-data',
  templateUrl: './personal-data.component.html',
  styleUrls: ['./personal-data.component.scss']
})
export class PersonalDataComponent implements OnInit {
  pd?:PersonalData;
  constructor(private db:DatabrokerService) { }

  ngOnInit(): void {
    this.pd=this.db.pd;
  }

}
