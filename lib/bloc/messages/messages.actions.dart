import 'dart:ffi';

import 'package:contacts_bloc/model/contact.model.dart';
import 'package:contacts_bloc/model/message.model.dart';

abstract class MessagesEvent<T> {
  T payload;

  MessagesEvent(this.payload);
}

class MessagesByContactsEvent extends MessagesEvent<Contact> {
  MessagesByContactsEvent(Contact payload) : super(payload);
}

class AddNewMessageEvent extends MessagesEvent<Message> {
  AddNewMessageEvent(Message payload) : super(payload);
}

class SelectMessageEvent extends MessagesEvent<Message> {
  SelectMessageEvent(Message payload) : super(payload);
}

class DeleteMessagesEvent extends MessagesEvent {
  DeleteMessagesEvent() : super(null);
}
