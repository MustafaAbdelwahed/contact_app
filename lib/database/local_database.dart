import 'package:contact_app/model/contact_model.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalDatabase {
  static Future<void> getContacts(
    List<Contact> contacts,
    List<Contact> favorites,
  ) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await Future.delayed(const Duration(seconds: 1));
    var keys = prefs.getKeys();
    keys.removeWhere((element) => element == "");

    for (var element in keys) {
      var value = prefs.getStringList(element)!;
      contacts.add(
        Contact(
          id: element,
          name: value[0],
          phone: value[1],
          favoriteState: value[2],
        ),
      );
      if (value[2] == "favorite") {
        favorites.add(Contact(
          id: element,
          name: value[0],
          phone: value[1],
          favoriteState: value[2],
        ));
      }
    }
  }

  static Future<void> setContact(String name, String phone) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setStringList(
      ValueKey(phone).value,
      <String>[
        name,
        phone,
        'non-favorite',
      ],
    );
  }

  static Future<void> editContact(Contact contact) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setStringList(
      contact.id,
      <String>[
        contact.name,
        contact.phone,
        contact.favoriteState,
      ],
    );
  }

  static Future<void> toggleFavoriteState(Contact contact) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setStringList(
      contact.id,
      [
        contact.name,
        contact.phone,
        contact.favoriteState,
      ],
    );
  }

  static Future deleteContact(String id) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove(id);
  }
}
