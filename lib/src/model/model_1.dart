import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:uuid/uuid.dart';

class Contact {
  final String id;
  final String name;

  Contact({required this.name}) : id = const Uuid().v4();
  Contact.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        name = json['name'];

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
      };
}

class ContactBook extends ValueNotifier<List<Contact>> {
  // singleton
  ContactBook._sharedInstance() : super([]) {
    _loadContacts();
  }
  static final ContactBook _shared = ContactBook._sharedInstance();

  factory ContactBook() => _shared;

  int get length => value.length;

  void add({required Contact contact}) {
    value.add(contact);
    notifyListeners();
    _saveContacts();
  }

  void remove({required Contact contact}) {
    value.remove(contact);
    notifyListeners();
    _saveContacts();
  }

  Contact? contact({required int atIndex}) =>
      value.length > atIndex ? value[atIndex] : null;

  void _loadContacts() async {
    final prefs = await SharedPreferences.getInstance();
    final contactsJson = prefs.getString('contacts') ?? '[]';
    final List<dynamic> contactsList = jsonDecode(contactsJson);
    value = contactsList.map((json) => Contact.fromJson(json)).toList();
  }

  void _saveContacts() async {
    final prefs = await SharedPreferences.getInstance();
    final contactsJson = jsonEncode(value.map((c) => c.toJson()).toList());
    prefs.setString('contacts', contactsJson);
  }
}
