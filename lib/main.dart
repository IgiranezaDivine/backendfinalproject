import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:backendfinalproject/screens/register_founded_person.dart';
import 'package:backendfinalproject/screens/settings/header_page.dart';
import 'package:backendfinalproject/theme/dark_light_mode.dart';
import 'package:backendfinalproject/theme/theme_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_settings_screens/flutter_settings_screens.dart';
import 'package:google_fonts/google_fonts.dart';
import 'screens/screens.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Missing Person',
      
        
      initialRoute: '/',
      routes: {
        '/': (context) => const Splash(),
        '/ForgotPassword': (context) => const ForgotPassword(),
        '/CreateNewAccount': (context) => const CreateNewAccount(),
        '/HomeScreen': (context) => const HomeScreen(),
        // '/':(context) => const UserDetails(),
         //'/':(context) => const EditUser(),
        // '/':(context) => const DetectUser(),
        //  '/':(context) => const RegisterUser(),
        //'/':(context) => const MainPage(),
        // '/':(context) => const RegisterHome(),
        //'/':(context) => const RegisterFoundedPeople(),
          // '/':(context) => const EditRegisterHome(),
        // '/': (context) => ContactUs(),
        //'/': (context) => WelcomePage(),
        //'/': (context) => SendEmail(),
        //  '/': (context) => SettingsPage(),
        //   '/': (context) => const DarkLightMode(),
        
      },
    );
  }
  //);

}
