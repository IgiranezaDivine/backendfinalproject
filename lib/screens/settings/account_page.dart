import 'package:backendfinalproject/screens/settings/icon_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_settings_screens/flutter_settings_screens.dart';

class AccountPage extends StatelessWidget {
  static const keyLanguage = 'key-language';
  static const KeyLocation = 'key-location';

  const AccountPage({super.key});

  @override
  Widget build(BuildContext context) => SimpleSettingsTile(
        title: 'Account Setting',
        subtitle: 'Privacy, Security, Language',
        leading: const IconWidget(icon: Icons.person, color: Colors.green),
        child: SettingsScreen(
          title: 'Account Settings',
          children: <Widget>[
            buildLanguage(),
            buildLocation(),
            buildPrivacy(context),
            buildSecurity(context),
            buildAccountInfo(context)
          ],
        ),
      );

  Widget buildLanguage() => DropDownSettingsTile(
        title: 'Language',
        settingKey: keyLanguage,
        selected: 1,
        values: <int, String>{
          1: 'English',
          2: 'French',
          3: 'Kinyarwanda',
        },
        onChange: (language) {/*Nooooo*/},
      );

  Widget buildLocation() => TextInputSettingsTile(
        settingKey: KeyLocation,
        title: 'Location',
        initialValue: 'Nyarugenge',
        onChange: (location) {/*NOOO*/},
      );

  Widget buildPrivacy(BuildContext context) => SimpleSettingsTile(
      title: 'Privacy',
      subtitle: '',
      leading: IconWidget(icon: Icons.lock, color: Colors.blue),
      onTap: () {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: const Text('snack'),
          duration: const Duration(seconds: 1),
          action: SnackBarAction(
            label: 'ACTION',
            onPressed: () {},
          ),
        ));
      });

  Widget buildSecurity(BuildContext context) => SimpleSettingsTile(
      title: 'Security',
      subtitle: '',
      leading: IconWidget(icon: Icons.security, color: Colors.red),
      onTap: () {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: const Text('snack'),
          duration: const Duration(seconds: 1),
          action: SnackBarAction(
            label: 'ACTION',
            onPressed: () {},
          ),
        ));
      });

  Widget buildAccountInfo(BuildContext context) => SimpleSettingsTile(
      title: 'Language',
      subtitle: '',
      leading: IconWidget(icon: Icons.language, color: Colors.green),
      onTap: () {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: const Text('snack'),
          duration: const Duration(seconds: 1),
          action: SnackBarAction(
            label: 'ACTION',
            onPressed: () {},
          ),
        ));
      });
}
