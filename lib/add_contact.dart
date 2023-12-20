// ignore_for_file: use_build_context_synchronously

import 'package:contact_app/provider/contact_screen_provider.dart';
import 'package:contact_app/model/contact_model.dart';
import 'package:contact_app/translations/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AddNewContactScreen extends StatelessWidget {
  final bool isEdit;
  final Contact? contacts;
  AddNewContactScreen({
    super.key,
    required this.isEdit,
    this.contacts,
  }) {
    if (isEdit) {
      _nameController.text = contacts!.name;
      _phoneController.text = contacts!.phone;
    }
  }

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(isEdit
            ? LocaleKeys.editContact.tr()
            : LocaleKeys.addNewContact.tr()),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(
                  height: 30,
                ),
                TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'this field is require';
                    }
                    return null;
                  },
                  controller: _nameController,
                  decoration: InputDecoration(
                    label: Text(LocaleKeys.name.tr()),
                  ),
                ),
                const SizedBox(height: 40),
                TextFormField(
                  validator: (value) {
                    if (value == null || value.length <= 11) {
                      return 'the number is lower than 11 ';
                    }
                    return null;
                  },
                  controller: _phoneController,
                  decoration: InputDecoration(
                    label: Text(LocaleKeys.Phone.tr()),
                  ),
                ),
                const SizedBox(height: 60),
                Consumer(builder: (context, ref, _) {
                  final contactProv = ref.read(contactProvder);

                  return ElevatedButton(
                    onPressed: isEdit
                        ? () async {
                            contactProv.editContacts(Contact(
                                id: contacts!.id,
                                name: _nameController.text,
                                phone: _phoneController.text,
                                favoriteState: contacts!.favoriteState));

                            Navigator.of(context).pop(context);
                          }
                        : () async {
                            if (!_formKey.currentState!.validate()) {
                              return;
                            }
                            contactProv.addNewContact(
                              _nameController.text,
                              _phoneController.text,
                            );
                            Navigator.of(context).pop(context);
                          },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.deepPurple,
                      minimumSize: const Size(200, 40),
                    ),
                    child: Text(
                      LocaleKeys.save.tr(),
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                      ),
                    ),
                  );
                }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
