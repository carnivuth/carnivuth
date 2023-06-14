import { Component, OnInit } from '@angular/core';
import { DatabrokerService } from '../databroker.service';
import { Skill } from '../model/Skill';

@Component({
  selector: 'app-skills',
  templateUrl: './skills.component.html',
  styleUrls: ['./skills.component.scss'],
})
export class SkillsComponent  implements OnInit  {
  skills?: Skill[];
  constructor(private db: DatabrokerService) {}
  ngOnInit() {
    this.skills = this.db.skills;
  }
}
