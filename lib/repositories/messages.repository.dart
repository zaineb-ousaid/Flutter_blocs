import 'dart:math';

import 'package:contacts_bloc/model/message.model.dart';

class MessagesRepository {
  int messageCount;
  Map<int, Message> messages = {
    1: Message(
        id: 1,
        contactID: 1,
        date: DateTime.now(),
        content:
            "Salut Zaineb cv?",
        type: 'sent',
        selected: false),
    2: Message(
        id: 2,
        contactID: 1,
        date: DateTime.now(),
        content: "oui je suis bien et toi?",
        type: 'received',
        selected: false),
    3: Message(
        id: 3,
        contactID: 1,
        date: DateTime.now(),
        content: "qsq tu fais?",
        type: 'sent',
        selected: false),
    4: Message(
        id: 4,
        contactID: 1,
        date: DateTime.now(),
        content:
            "rien rien...",
        type: 'received',
        selected: false),
    5: Message(
        id: 5,
        contactID: 2,
        date: DateTime.now(),
        content: "Hi Mohamed",
        type: 'sent',
        selected: false),
    6: Message(
        id: 6,
        contactID: 2,
        date: DateTime.now(),
        content: "Well received",
        type: 'received',
        selected: false),
  };

  MessagesRepository() {
    this.messageCount = messages.length;
  }

  Future<Message> addNewMessage(Message message) async {
    var future = await Future.delayed(Duration(seconds: 1));
    int rnd = new Random().nextInt(10);
    if (rnd > 1) {
      message.id = ++messageCount;
      messages[message.id] = message;
      return message;
    } else {
      throw new Exception("Internet Error");
    }
  }

  Future<List<Message>> allMessages() async {
    var future = await Future.delayed(Duration(seconds: 1));
    int rnd = new Random().nextInt(10);
    if (rnd > 1) {
      return messages.values.toList();
    } else {
      throw new Exception("Internet Error");
    }
  }

  Future<List<Message>> allMessagesByContact(int contactID) async {
    var future = await Future.delayed(Duration(seconds: 1));
    int rnd = new Random().nextInt(10);
    if (rnd > 1) {
      return messages.values
          .toList()
          .where((element) => element.contactID == contactID)
          .toList();
    } else {
      throw new Exception("Internet Error");
    }
  }

  Future<void> deleteMessage(Message message) async {
    var future = await Future.delayed(Duration(seconds: 1));
    int rnd = new Random().nextInt(10);
    if (rnd > 0) {
      messages.remove(message.id);
    } else {
      throw new Exception("Internet Error");
    }
  }
}
