import 'package:contacts_bloc/bloc/messages/messages.actions.dart';
import 'package:contacts_bloc/bloc/messages/messages.bloc.dart';
import 'package:contacts_bloc/bloc/messages/messages.state.dart';
import 'package:contacts_bloc/enums/enums.dart';
import 'package:contacts_bloc/model/contact.model.dart';
import 'package:contacts_bloc/ui/pages/messages/widgets/contact.info.widget.dart';
import 'package:contacts_bloc/ui/pages/messages/widgets/messages.app.bar.widget.dart';
import 'package:contacts_bloc/ui/pages/messages/widgets/messages.form.widget.dart';
import 'package:contacts_bloc/ui/pages/messages/widgets/messages.list.widget.dart';
import 'package:contacts_bloc/ui/pages/messages/widgets/messages.widget.dart';
import 'package:contacts_bloc/ui/shared/circular.progress.indicator.widget.dart';
import 'package:contacts_bloc/ui/shared/error.retry.action.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MessagesPage extends StatelessWidget {
  Contact contact;

  @override
  Widget build(BuildContext context) {
    this.contact = ModalRoute.of(context).settings.arguments;
    context.read<MessagesBloc>().add(MessagesByContactsEvent(this.contact));
    return Scaffold(
      appBar: MyAppBarWidget(
        contact: this.contact,
      ),
      body: Column(
        children: [
          ContactInfoWidget(
            contact: this.contact,
          ),
          MessagesWidget(),
          MessagesFormWidget(
            contact: this.contact,
          ),
        ],
      ),
    );
  }
}
