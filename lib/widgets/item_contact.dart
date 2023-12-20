import 'package:contact_app/add_contact.dart';
import 'package:contact_app/model/contact_model.dart';
import 'package:contact_app/provider/contact_screen_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ContactItem extends StatefulWidget {
  const ContactItem({
    super.key,
    required this.contacts,
  });
  final Contact contacts;

  @override
  State<ContactItem> createState() => _ContactItemState();
}

class _ContactItemState extends State<ContactItem> {
  bool isFavorite = false;
  @override
  void initState() {
    super.initState();
    isFavorite = widget.contacts.favoriteState == "favorite";
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Consumer(builder: (context, ref, _) {
        return Dismissible(
          key: ValueKey(widget.contacts.id),
          onDismissed: (direction) async {
            ref.watch(contactProvder).deleteContact(widget.contacts.id);
          },
          background: Container(
            decoration: BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.circular(30),
            ),
            child: const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(
                    Icons.delete,
                    color: Colors.white,
                    size: 28,
                  ),
                  Icon(
                    Icons.delete,
                    color: Colors.white,
                    size: 28,
                  ),
                ],
              ),
            ),
          ),
          child: ListTile(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
            leading: const Icon(Icons.person),
            title: Text(widget.contacts.name),
            subtitle: Text(widget.contacts.phone),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Consumer(builder: (context, ref, _) {
                  return IconButton(
                    onPressed: () async {
                      setState(() {
                        isFavorite = !isFavorite;
                      });
                      ref.read(contactProvder).favoriteContact(widget.contacts);
                    },
                    icon: isFavorite
                        ? const Icon(Icons.favorite)
                        : const Icon(Icons.favorite_outline),
                  );
                }),
                IconButton(
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => AddNewContactScreen(
                          isEdit: true,
                          contacts: Contact(
                            name: widget.contacts.name,
                            phone: widget.contacts.phone,
                            id: widget.contacts.id,
                            favoriteState: widget.contacts.favoriteState,
                          ),
                        ),
                      ),
                    );
                  },
                  icon: const Icon(Icons.edit),
                ),
              ],
            ),
            tileColor: Colors.amber[200]!.withOpacity(0.5),
          ),
        );
      }),
    );
  }
}
