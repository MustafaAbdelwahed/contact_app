import 'package:contact_app/model/contact_model.dart';
import 'package:contact_app/translations/locale_keys.g.dart';
import 'package:contact_app/widgets/item_contact.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../change_language_screen.dart';

class FavoriteScreen extends StatelessWidget {
  final List<Contact> contacts;
  const FavoriteScreen({
    Key? key,
    required this.contacts,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(LocaleKeys.favorites.tr()),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => ChangeLanguageScreen(),
                ));
              },
              icon: const Icon(Icons.language))
        ],
      ),
      body: ListView(
        children: contacts
            .map((e) => ContactItem(
                  contacts: e,
                  key: ValueKey(e.id),
                ))
            .toList(),
      ),
    );
  }
}
