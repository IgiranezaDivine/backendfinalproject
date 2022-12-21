import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quickalert/quickalert.dart';
import 'screens/screens.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Missing Person',
      theme: ThemeData(
        textTheme: GoogleFonts.josefinSansTextTheme(Theme.of(context).textTheme),
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        // '/':(context) => const Splash(),
        // 'ForgotPassword':(context) => const ForgotPassword(),
        // 'CreateNewAccount':(context) => const CreateNewAccount(),
      '/':(context) => const HomeScreen(),
       // '/':(context) => const UserDetails(),
      // '/':(context) => const EditUser(),
      // '/':(context) => const DetectUser(),
       // '/':(context) => const RegisterUser(),
       
      },
    );
  }
}

