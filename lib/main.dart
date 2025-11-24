import 'package:flutter/material.dart';
import 'package:libarary/pages/book_details.dart';
import 'package:libarary/pages/library_page.dart';
import 'package:libarary/pages/login_page.dart';
import 'package:libarary/pages/registration_page.dart';
import 'package:libarary/pages/search_page.dart';
import 'package:libarary/providers/Auth_provider.dart';
import 'package:libarary/providers/book_provider.dart';
import 'package:libarary/providers/search_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: [
      ChangeNotifierProvider
      (create: (_) => AuthProvider()),
       ChangeNotifierProvider
      (create: (_) => BookProvider()),
      ChangeNotifierProvider
      (create: (_) => SearchProvider()),
     
    ],
    child: MaterialApp(
    home: RegistrationPage(),
      routes: {
       "/library" : (_) => LibraryPage(),
       "/login" : (_) => LoginPage(),
       "/search"  : (_) => SearchPage(),
       "/registration" : (_) => RegistrationPage(),
      },
    ),
    );
  }
}
