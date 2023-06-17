import { Component, OnInit } from '@angular/core';
import { DatabrokerService } from '../databroker.service';
import { Contact } from '../model/Contact';

@Component({
  selector: 'app-contacts',
  templateUrl: './contacts.component.html',
  styleUrls: ['./contacts.component.scss']
})
export class ContactsComponent implements OnInit {
  contacts?:Contact[]
  constructor(private db:DatabrokerService) { }

  ngOnInit(): void {
    this.contacts=this.db.contacts
  }

}
