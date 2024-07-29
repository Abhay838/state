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
        body: ValueListenableBuilder<List<Contact>>(
          valueListenable: ContactBook(),
          builder: (contact, contacts, child) {
            return ListView.builder(
              itemCount: contacts.length,
              itemBuilder: (context, index) {
                final contact = contacts[index];
                return Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
                  child: Dismissible(
                    onDismissed: (direction) {
                      contactBook.remove(contact: contact);
                    },
                    key: ValueKey(contact.id),
                    child: Material(
                      elevation: 6,
                      color: Colors.white,
                      child: ListTile(
                        title: Text(contact.name),
                      ),
                    ),
                  ),
                );
              },
            );
          },
        ));
  }
}
