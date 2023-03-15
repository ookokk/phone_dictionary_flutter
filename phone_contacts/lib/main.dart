import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:phone_contacts/contact_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
          brightness: Brightness.dark,
        ),
        home: ContactPage());
  }
}
