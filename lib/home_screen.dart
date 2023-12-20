import 'package:contact_app/Screen/contact_screen.dart';
import 'package:contact_app/Screen/favorit_screen.dart';
import 'package:contact_app/add_contact.dart';
import 'package:contact_app/provider/contact_screen_provider.dart';
import 'package:contact_app/translations/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List screens = [];

  int currentSelectedScreenIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ref, _) {
      final contactProv = ref.watch(contactProvder);
      contactProv.contacts.sort(
        (a, b) => a.name.compareTo(b.name),
      );
      contactProv.favorites.sort(
        (a, b) => a.name.compareTo(b.name),
      );
      screens = [
        ContactsScreen(contacts: contactProv.contacts),
        FavoriteScreen(contacts: contactProv.favorites),
      ];

      return Scaffold(
        body: screens.isEmpty
            ? const Center(child: CircularProgressIndicator())
            : screens[currentSelectedScreenIndex],
        floatingActionButton: FloatingActionButton(
          shape: const CircleBorder(),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => AddNewContactScreen(
                  isEdit: false,
                ),
              ),
            );
          },
          child: const Icon(Icons.add),
        ),
        bottomNavigationBar: BottomNavigationBar(
          onTap: (index) {
            setState(() {
              currentSelectedScreenIndex = index;
            });
          },
          currentIndex: currentSelectedScreenIndex,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.contacts_outlined),
              label: LocaleKeys.contacts.tr(),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.favorite_outline),
              label: LocaleKeys.favorites.tr(),
            ),
          ],
        ),
      );
    });
  }
}
