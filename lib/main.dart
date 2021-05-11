import 'package:contacts_bloc/bloc/messages/messages.bloc.dart';
import 'package:contacts_bloc/repositories/contacts.repository.dart';
import 'package:contacts_bloc/repositories/messages.repository.dart';
import 'package:contacts_bloc/ui/pages/contacts/contacts.page.dart';
import 'package:contacts_bloc/ui/pages/contactsWithMessages/contacts.messages.page.dart';
import 'package:contacts_bloc/ui/pages/messages/messages.page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'bloc/contacts/contacts.bloc.dart';
import 'bloc/contacts/contacts.state.dart';
import 'bloc/messages/messages.state.dart';
import 'enums/enums.dart';

void main() {
  GetIt.instance.registerLazySingleton(() => new ContactsRepository());
  GetIt.instance.registerLazySingleton(() => new MessagesRepository());
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (context) => MessagesBloc(
              initialState: MessagesState.initialState(),
              messagesRepository: GetIt.instance<MessagesRepository>(),
            )),
        BlocProvider(
            create: (context) => ContactsBloc(
              initialState: ContactsState(
                  contacts: [],
                  errorMessage: '',
                  requestState: RequestState.NONE),
              contactsRepository: GetIt.instance<ContactsRepository>(),
              messagesBloc: context.read<MessagesBloc>(),
            )),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            primarySwatch: MaterialColor(0xFF8BC34A, {
              50: Color(0xFF8BC34A),
              100: Color(0xFF8BC34A),
              200: Color(0xFF8BC34A),
              300: Color(0xFF8BC34A),
              400: Color(0xFF8BC34A),
              500: Color(0xFF8BC34A),
              600: Color(0xFF8BC34A),
              700: Color(0xFF8BC34A),
              800: Color(0xFF8BC34A),
              900: Color(0xFF8BC34A),
            })),
        routes: {
          '/contacts': (context) => ContactsPage(),
          '/messages': (context) => MessagesPage(),
          '/contactsWithMessages': (context) => ContactsWithMessages(),
        },
        initialRoute: '/contactsWithMessages',
      ),
    );
  }
}