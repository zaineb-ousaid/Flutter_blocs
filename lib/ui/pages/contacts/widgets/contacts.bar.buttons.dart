import 'package:contacts_bloc/bloc/contacts/contacts.actions.dart';
import 'package:flutter/material.dart';

import 'contacts.button.item.dart';

class ContactsBarButtons extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ContactsButtonItem(
            buttonLabel: 'All Contacts',
            contactsEvent: new LoadAllContactsEvent(),
          ),
          ContactsButtonItem(
            buttonLabel: 'Students',
            contactsEvent: new LoadAllStudentsEvent(),
          ),
          ContactsButtonItem(
            buttonLabel: 'Developers',
            contactsEvent: new LoadAllDevelopersEvent(),
          ),
        ],
      ),
    );
  }
}
