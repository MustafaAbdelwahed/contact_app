// DO NOT EDIT. This is code generated via package:easy_localization/generate.dart

// ignore_for_file: prefer_single_quotes

import 'dart:ui';

import 'package:easy_localization/easy_localization.dart' show AssetLoader;

class CodegenLoader extends AssetLoader{
  const CodegenLoader();

  @override
  Future<Map<String, dynamic>?> load(String path, Locale locale) {
    return Future.value(mapLocales[locale.toString()]);
  }

  static const Map<String,dynamic> ar = {
  "contacts": "جهة الاتصال",
  "favorites": "المفضلة",
  "addNewContact": "اضافة جهة اتصال",
  "editContact": "تعديل جهة اتصال",
  "name": "الاسم",
  "Phone": "رقم الهاتف",
  "save": "حفظ",
  "changeLanguage": "تغير اللغة "
};
static const Map<String,dynamic> en = {
  "contacts": "Contacts",
  "favorites": "Favorite",
  "addNewContact": "Add new contact",
  "editContact": "Edit Contact",
  "name": "Name",
  "password": "Phone",
  "save": "Save",
  "changeLanguage": "Change Language"
};
static const Map<String, Map<String,dynamic>> mapLocales = {"ar": ar, "en": en};
}
