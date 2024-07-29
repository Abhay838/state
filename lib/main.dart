import 'package:flutter/material.dart';
import 'package:ui_design/src/page/new_contact_view.dart';
import 'package:ui_design/src/page/page_1.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const Page1(),
      routes: {
        '/home': (context) => const Page1(),
        '/add': (context) => const NewContactView(),
      },
    );
  }
}
