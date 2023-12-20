import 'package:contact_app/database/local_database.dart';
import 'package:contact_app/database/remote_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../model/contact_model.dart';

final contactProvder = ChangeNotifierProvider<ContactProvider>(
  (ref) => ContactProvider(),
);

class ContactProvider extends ChangeNotifier {
  ContactProvider() {
    getDataFromDatabase();
  }

  List<Contact> contacts = [];

  List<Contact> favorites = [];
  // bool isFavorite = false;
  Future<void> getDataFromDatabase() async {
    await LocalDatabase.getContacts(contacts, favorites);
    // await RemoteDB.getContact(contacts, favorites);
    notifyListeners();
  }

  Future addNewContact(name, phone) async {
    contacts.add(Contact(
        id: ValueKey(phone).value,
        name: name,
        phone: phone,
        favoriteState: 'not-favorite'));
    notifyListeners();

    await LocalDatabase.setContact(name, phone);
    // await RemoteDB.setContact(name, phone);
  }

  Future editContacts(Contact contact) async {
    final int countantIndex =
        contacts.indexWhere((con) => con.id == contact.id);
    contacts[countantIndex] = contact;

    final int favoriteIndex =
        favorites.indexWhere((con) => con.id == contact.id);
    if (favoriteIndex != -1) {
      favorites[favoriteIndex] = contact;
    }
    print("edit");
    print(contact.id);

    notifyListeners();
    await LocalDatabase.editContact(contact);
    // await RemoteDB.editContact(contact);
  }

  void favoriteContact(Contact contact) async {
    contact.favoriteState =
        contact.favoriteState == "favorite" ? "non-favorite" : "favorite";
    contact.isFavorit = !contact.isFavorit;

    final int countantIndex =
        contacts.indexWhere((con) => con.id == contact.id);
    contacts[countantIndex] = contact;
    if (contact.isFavorit) {
      favorites.add(contact);
    } else {
      favorites.removeWhere((element) => element.id == contact.id);
    }
    notifyListeners();
    await LocalDatabase.toggleFavoriteState(contact);
    // await RemoteDB.toggleFavoriteState(contact);
  }

  Future deleteContact(String id) async {
    contacts.removeWhere((element) => element.id == id);
    favorites.removeWhere((element) => element.id == id);

    notifyListeners();

    await LocalDatabase.deleteContact(id);
    // await RemoteDB.deleteContact(id);
  }
}
