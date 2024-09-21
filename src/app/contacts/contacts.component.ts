import { Component, OnInit } from '@angular/core';
import { DatabrokerService } from '../databroker.service';
import { Contact } from '../model/Contact';
import { Location, LocationStrategy } from '@angular/common';

@Component({
  selector: 'app-contacts',
  templateUrl: './contacts.component.html',
  styleUrls: ['./contacts.component.scss']
})
export class ContactsComponent implements OnInit {
  contacts?:Contact[]
  href=''
  constructor(private db:DatabrokerService,private location: Location, private locationStrategy: LocationStrategy) { }

  ngOnInit(): void {
    this.contacts=this.db.contacts
    this.href= this.locationStrategy.getBaseHref();
  }

}
