import 'package:contacts_bloc/enums/enums.dart';
import 'package:contacts_bloc/model/contact.model.dart';

import 'contacts.actions.dart';

class ContactsState {
  List<Contact> contacts;
  RequestState requestState;
  String errorMessage;
  ContactsEvent currentEvent;
  Contact currentContact;

  ContactsState(
      {this.contacts,
      this.requestState,
      this.errorMessage,
      this.currentEvent,
      this.currentContact});
}
