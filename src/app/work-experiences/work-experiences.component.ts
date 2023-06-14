import { Component, OnInit } from '@angular/core';
import { DatabrokerService } from '../databroker.service';
import { WorkExperience } from '../model/WorkExperience';

@Component({
  selector: 'app-work-experiences',
  templateUrl: './work-experiences.component.html',
  styleUrls: ['./work-experiences.component.scss']
})
export class WorkExperiencesComponent implements OnInit
{
  experiences?:WorkExperience[];
  constructor(private db: DatabrokerService) {}
  
  ngOnInit(): void {
    this.experiences=this.db.workExperiences;
  }
}
