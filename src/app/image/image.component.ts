import { Component, OnInit } from '@angular/core';
import { Location, LocationStrategy } from '@angular/common';


@Component({
  selector: 'app-image',
  templateUrl: './image.component.html',
  styleUrls: ['./image.component.scss']
})
export class ImageComponent implements OnInit {

  href='';
  constructor(private location: Location, private locationStrategy: LocationStrategy) { }


  ngOnInit(): void {
  this.href= this.locationStrategy.getBaseHref();
  }

}
