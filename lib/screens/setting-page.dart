import 'package:backendfinalproject/screens/settings/account_page.dart';
import 'package:backendfinalproject/screens/settings/icon_widget.dart';
import 'package:flutter/material.dart';
import 'package:backendfinalproject/screens/settings/header_page.dart';
import 'package:flutter_settings_screens/flutter_settings_screens.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) => Scaffold(
        body: SafeArea(
          
          child: ListView(
            padding: const EdgeInsets.all(24),
            children: [
              SettingsGroup(title: 'General', children: <Widget>[
                const AccountPage(),
                buildLogout(),
                buildDeleteAcount(),
                const SizedBox(
                  height: 32,
                ),
              ]),
              SettingsGroup(title: 'Feedback', children: <Widget>[
                const SizedBox(
                  height: 8,
                ),
                buildSendFeedback(context),
              ])
            ],
          ),
        ),
      );
  Widget buildLogout() => SimpleSettingsTile(
      title: 'Logout',
      subtitle: '',
      leading:  IconWidget(icon: Icons.logout, color: Colors.blueAccent),
      onTap: () {
        Settings.clearCache();
        // Utils.showSnackBar(context, 'Clicked Logout');
      });

  Widget buildDeleteAcount() => SimpleSettingsTile(
      title: 'Delete Account',
      subtitle: '',
      leading: const IconWidget(icon: Icons.delete, color: Colors.pink),
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

  Widget buildSendFeedback(BuildContext context) => SimpleSettingsTile(
      title: 'Send Feedback',
      subtitle: '',
      leading: const IconWidget(icon: Icons.thumb_up, color: Colors.purple),
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
