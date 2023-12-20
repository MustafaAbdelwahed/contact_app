import 'package:contact_app/home_screen.dart';
import 'package:contact_app/translations/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class ChangeLanguageScreen extends StatelessWidget {
  const ChangeLanguageScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final lang = context.locale.toString();
    return Scaffold(
      appBar: AppBar(
        title: Text(LocaleKeys.changeLanguage.tr()),
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          ListTile(
            onTap: () {
              changeLanguage(context, "ar");
            },
            title: const Text("عربي"),
            trailing: lang == "ar"
                ? const Icon(Icons.check)
                : const SizedBox.shrink(),
          ),
          ListTile(
            onTap: () {
              changeLanguage(context, "en");
            },
            title: const Text("English"),
            trailing: lang == "en"
                ? const Icon(Icons.check)
                : const SizedBox.shrink(),
          )
        ],
      ),
    );
  }

  void changeLanguage(BuildContext context, String lang) async {
    await context.setLocale(Locale(lang));
    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) => const HomeScreen()),
        (route) => false);
  }
}
