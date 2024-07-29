import 'package:flutter/material.dart';
import 'package:ui_design/src/model/model_1.dart';

class Page1 extends StatefulWidget {
  const Page1({super.key});

  @override
  State<Page1> createState() => _Page1State();
}

class _Page1State extends State<Page1> {
  final contactBook = ContactBook();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.tealAccent,
        title: const Text("Contact Home"),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.tealAccent.shade100,
        onPressed: () async {
          await Navigator.pushNamed(context, '/add');
        },
        child: const Icon(
          Icons.add,
          size: 30,
          color: Colors.grey,
        ),
      ),
      body: ListView.builder(
        itemCount: contactBook.length,
        itemBuilder: (context, index) {
          final contact = contactBook.contact(atIndex: index)!;
          return ListTile(
            title: Text(contact.name),
          );
        },
      ),
    );
  }
}
