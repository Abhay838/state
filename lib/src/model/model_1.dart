class Contact {
  final String name;

  const Contact({required this.name});
}

class ContactBook {
  // singleton
  ContactBook._sharedInstance();
  static final ContactBook _shared = ContactBook._sharedInstance();

  factory ContactBook() => _shared;

  // Changed to a mutable list
  final List<Contact> _contact = [
    Contact(name: 'Trupti'),
    Contact(name: 'Abhay'),
    Contact(name: 'Vivek'),
    Contact(name: 'Bobby'),
  ];

  int get length => _contact.length;

  void add({required Contact contact}) {
    _contact.add(contact);
  }

  void remove({required Contact contact}) {
    _contact.remove(contact);
  }

  Contact? contact({required int atIndex}) =>
      _contact.length > atIndex ? _contact[atIndex] : null;
}
