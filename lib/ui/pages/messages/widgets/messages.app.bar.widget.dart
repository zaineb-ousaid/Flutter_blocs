import 'package:contacts_bloc/bloc/messages/messages.actions.dart';
import 'package:contacts_bloc/bloc/messages/messages.bloc.dart';
import 'package:contacts_bloc/bloc/messages/messages.state.dart';
import 'package:contacts_bloc/model/contact.model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyAppBarWidget extends AppBar{
Contact contact;
  MyAppBarWidget({Contact contact}):super(
    title: Text('Messages de ${contact.name}'),
    actions: [
      BlocBuilder<MessagesBloc, MessagesState>(
        builder: (context, state) {
          return CircleAvatar(
            child: Text('${state.messages.length}'),
          );
        },
      ),
      BlocBuilder<MessagesBloc, MessagesState>(
        builder: (context, state) {
          if (state.selectedMessages.length > 0) {
            return IconButton(
                icon: Icon(Icons.restore_from_trash),
                onPressed: () {
                  context
                      .read<MessagesBloc>()
                      .add(new DeleteMessagesEvent());
                });
          } else {
            return Container();
          }
        },
      ),
    ],
  );
}