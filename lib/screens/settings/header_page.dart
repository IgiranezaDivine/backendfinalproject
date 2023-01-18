import 'package:backendfinalproject/screens/settings/icon_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_settings_screens/flutter_settings_screens.dart';

class HeaderPage extends StatelessWidget {
  const HeaderPage({super.key});

  @override
  Widget build(BuildContext context) => Column(
        children: [
          buildHeader(),
          const SizedBox(height: 32),
         // buildUser(context),
        ],
      );

  Widget buildHeader() => Center(
        child: Text('Settings'),
      );
}
