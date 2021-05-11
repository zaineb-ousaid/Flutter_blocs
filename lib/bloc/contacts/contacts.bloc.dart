import 'package:bloc/bloc.dart';
import 'package:contacts_bloc/bloc/messages/messages.actions.dart';
import 'package:contacts_bloc/bloc/messages/messages.bloc.dart';
import 'package:contacts_bloc/enums/enums.dart';
import 'package:contacts_bloc/model/contact.model.dart';
import 'package:contacts_bloc/repositories/contacts.repository.dart';

import 'contacts.actions.dart';
import 'contacts.state.dart';

class ContactsBloc extends Bloc<ContactsEvent, ContactsState> {
  ContactsRepository contactsRepository;
  MessagesBloc messagesBloc;

  ContactsBloc(
      {ContactsState initialState, this.contactsRepository, this.messagesBloc})
      : super(initialState);

  @override
  Stream<ContactsState> mapEventToState(ContactsEvent event) async* {
    if (event is LoadAllContactsEvent) {
      yield ContactsState(
          contacts: state.contacts,
          requestState: RequestState.LOADING,
          currentEvent: event);
      try {
        List<Contact> data = await contactsRepository.allContacts();
        messagesBloc.add(new MessagesByContactsEvent(data[0]));
        yield ContactsState(
            contacts: data,
            requestState: RequestState.LOADED,
            currentEvent: event,
            currentContact: data[0]);
      } catch (e) {
        yield ContactsState(
            contacts: state.contacts,
            requestState: RequestState.ERROR,
            errorMessage: e.message,
            currentEvent: event);
      }
    } else if (event is LoadAllStudentsEvent) {
      yield ContactsState(
          contacts: state.contacts,
          requestState: RequestState.LOADING,
          currentEvent: event);
      try {
        List<Contact> data = await contactsRepository.contactsByType("Student");
        yield ContactsState(
            contacts: data,
            requestState: RequestState.LOADED,
            currentEvent: event);
      } catch (e) {
        yield ContactsState(
            contacts: state.contacts,
            requestState: RequestState.ERROR,
            errorMessage: e.message,
            currentEvent: event);
      }
    } else if (event is LoadAllDevelopersEvent) {
      yield ContactsState(
          contacts: state.contacts,
          requestState: RequestState.LOADING,
          currentEvent: event);
      try {
        List<Contact> data =
            await contactsRepository.contactsByType("Developer");
        yield ContactsState(
            contacts: data,
            requestState: RequestState.LOADED,
            currentEvent: event);
      } catch (e) {
        yield ContactsState(
            contacts: state.contacts,
            requestState: RequestState.ERROR,
            errorMessage: e.message,
            currentEvent: event);
      }
    }
  }
}
