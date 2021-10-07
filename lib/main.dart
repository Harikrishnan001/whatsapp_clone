import 'package:flutter/material.dart';

import 'package:whatsapp_clone/constants.dart';
import 'package:whatsapp_clone/screens/main_screen/main_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: primaryColor,
        floatingActionButtonTheme:
            FloatingActionButtonThemeData(backgroundColor: secondaryColor),
      ),
      home: MainScreen(),
    );
  }
}
