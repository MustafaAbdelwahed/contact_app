import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:contact_app/model/contact_model.dart';

class TestDataBase {
  static Future getContact(
      List<Contact> contacts, List<Contact> favorites) async {
    final db = FirebaseFirestore.instance;
    final docRef = await db.collection("contacts").get();
    for (var docSnapShot in docRef.docs) {
      final contactMap = docSnapShot.data();
      contacts.add(
        Contact(
          id: contactMap["id"],
          name: contactMap["name"],
          phone: contactMap["phone"],
          favoriteState: contactMap["favoriteState"],
        ),
      );
      if (contactMap["favoriteState"] == "favorite") {
        favorites.add(
          Contact(
            id: contactMap["id"],
            name: contactMap["name"],
            phone: contactMap["phone"],
            favoriteState: contactMap["favoriteState"],
          ),
        );
      }
    }
  }

  static Future setContact(String name, String phone) async {
    final db = FirebaseFirestore.instance;
    final docRef = db.collection('contacts').doc();
    final contact = {
      "id": docRef.id,
      "name": name,
      'phone': phone,
      "favoriteState": 'non-favoritre',
    };
    await docRef.set(contact);
  }

  static Future editContact(Contact contact) async {
    final db = FirebaseFirestore.instance;
    db.collection("contacts").doc(contact.id).set({
      "id": contact.id,
      "name": contact.name,
      'phone': contact.phone,
      "favoriteState": contact.favoriteState,
    });
  }
}
