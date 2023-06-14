import { Component, OnInit } from '@angular/core';
import { DatabrokerService } from '../databroker.service';
import { Formation } from '../model/Formation';

@Component({
  selector: 'app-formations',
  templateUrl: './formations.component.html',
  styleUrls: ['./formations.component.scss']
})
export class FormationsComponent implements OnInit {
  formations?:Formation[];
  constructor(private db:DatabrokerService) { }

  ngOnInit(): void {
  this.formations=this.db.formations;
  }

}
