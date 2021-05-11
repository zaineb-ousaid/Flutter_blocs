import 'package:contacts_bloc/bloc/contacts/contacts.actions.dart';
import 'package:contacts_bloc/bloc/contacts/contacts.bloc.dart';
import 'package:contacts_bloc/bloc/messages/messages.bloc.dart';
import 'package:contacts_bloc/bloc/messages/messages.state.dart';
import 'package:contacts_bloc/ui/pages/contactsWithMessages/widgets/contacts.list.widget.dart';
import 'package:contacts_bloc/ui/pages/messages/widgets/messages.app.bar.widget.dart';
import 'package:contacts_bloc/ui/pages/messages/widgets/messages.form.widget.dart';
import 'package:contacts_bloc/ui/pages/messages/widgets/messages.widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ContactsWithMessages extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    context.read<ContactsBloc>().add(new LoadAllContactsEvent());
    return BlocBuilder<MessagesBloc, MessagesState>(
      builder: (context, state) => Scaffold(
        appBar: MyAppBarWidget(
          contact: state.currentContact,
        ),
        body: Column(
          children: [
            ContactsListHorizontalWidget(),
            MessagesWidget(),
            MessagesFormWidget(
              contact: state.currentContact,
            ),
          ],
        ),
      ),
    );
  }
}
