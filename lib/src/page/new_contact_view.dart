import 'package:flutter/material.dart';
import 'package:ui_design/src/model/model_1.dart';

class NewContactView extends StatefulWidget {
  const NewContactView({super.key});

  @override
  State<NewContactView> createState() => _NewContactViewState();
}

class _NewContactViewState extends State<NewContactView> {
  final TextEditingController text1 = TextEditingController();

  @override
  void dispose() {
    text1.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("add new contact"),
      ),
      body: Column(
        children: [
          TextField(
            controller: text1,
            decoration: const InputDecoration(
                hintText: 'Add new contact',
                border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                )),
          ),
          TextButton(
            onPressed: () {
              final contact = Contact(name: text1.text.trim());
              ContactBook().add(contact: contact);
              print('name : ${text1.text}');
              Navigator.of(context).pop();
            },
            child: const Text('Add'),
          )
        ],
      ),
    );
  }
}
