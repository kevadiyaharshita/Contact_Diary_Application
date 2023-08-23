import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../modal/Contact_Modal.dart';

class ContactController extends ChangeNotifier {
  ContactController({required this.preferences});

  List<Contact_Modal> _allContacts = [];
  late int _contact_counter;

  List<String> SP_Contacs = [];

  late SharedPreferences preferences;

  get counter {
    _contact_counter = preferences.getInt('contact_counter') ?? 0;
    return _contact_counter;
  }

  get allContactlist {
    print("getter of allContacts");
    _allContacts.clear();
    for (int i = 0; i < counter; i++) {
      SP_Contacs = preferences.getStringList('Contact : ${i}')!;
      Contact_Modal cm = Contact_Modal(
          First_Name: SP_Contacs[0],
          Last_Name: SP_Contacs[1],
          Email: SP_Contacs[3],
          Phone: SP_Contacs[2]);
      _allContacts.add(cm);
    }
    return _allContacts;
  }

  bool addContact({required Contact_Modal contact}) {
    if (_allContacts.contains(contact)) {
      print("Contains");
      return false;
    } else {
      print("Not Contains");
      SP_Contacs.clear();
      _contact_counter = counter;
      SP_Contacs.add(contact.First_Name);
      SP_Contacs.add(contact.Last_Name);
      SP_Contacs.add(contact.Phone);
      SP_Contacs.add(contact.Email);
      print("Sp_Contacts is :${SP_Contacs}");
      // preferences.setInt('counter', _counter.counter);
      preferences.setStringList('Contact : ${_contact_counter}', SP_Contacs);
      preferences.setInt('contact_counter', ++_contact_counter);
      print("Preferences added succesfully");
      SP_Contacs.clear();
      print("After Cleaning : ${SP_Contacs}");
      _allContacts.add(contact);
      print("Contact added succesfully");
      notifyListeners();
      return true;
    }
  }
}
