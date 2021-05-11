import 'package:contacts_bloc/bloc/messages/messages.actions.dart';
import 'package:contacts_bloc/bloc/messages/messages.bloc.dart';
import 'package:contacts_bloc/model/contact.model.dart';
import 'package:contacts_bloc/model/message.model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MessagesFormWidget extends StatelessWidget {
  final Contact contact;

  TextEditingController textEditingController = new TextEditingController();

  MessagesFormWidget({this.contact});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      alignment: Alignment.bottomLeft,
      child: Row(
        children: [
          Expanded(
            child: TextFormField(
              controller: textEditingController,
              keyboardType: TextInputType.multiline,
              maxLines: null,
              decoration: InputDecoration(
                hintText: "Your message",
                border: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Color(0xFF8BC34A),
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
              ),
            ),
          ),
          IconButton(
            icon: Icon(Icons.send),
            onPressed: () {
              Message message = Message(
                type: 'sent',
                contactID: this.contact.id,
                content: textEditingController.text,
                selected: false,
              );
              context.read<MessagesBloc>().add(new AddNewMessageEvent(message));
              Message replay = Message(
                type: 'received',
                contactID: this.contact.id,
                content: "Answer to " + textEditingController.text,
                selected: false,
              );
              context.read<MessagesBloc>().add(new AddNewMessageEvent(replay));
              textEditingController.text = "";
            },
          ),
        ],
      ),
    );
  }
}
