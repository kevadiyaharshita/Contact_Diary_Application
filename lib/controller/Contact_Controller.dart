import 'dart:developer';
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
    _allContacts.clear();
    for (int i = 0; i < counter; i++) {
      SP_Contacs = preferences.getStringList('Contact : ${i}')!;
      Contact_Modal cm = Contact_Modal(
        First_Name: SP_Contacs[0],
        Last_Name: SP_Contacs[1],
        Email: SP_Contacs[3],
        Phone: SP_Contacs[2],
        // image: SP_Contacs[4],
      );

      _allContacts.add(cm);
    }
    return _allContacts;
  }

  List<String> setSp_Contact({required Contact_Modal contact}) {
    SP_Contacs.clear();
    SP_Contacs.add(contact.First_Name);
    SP_Contacs.add(contact.Last_Name);
    SP_Contacs.add(contact.Phone);
    SP_Contacs.add(contact.Email);
    // SP_Contacs.add(contact.image);

    return SP_Contacs;
  }

  bool addContact({required Contact_Modal contact}) {
    if (_allContacts.any((element) => element.Phone == contact.Phone)) {
      return false;
    } else {
      // SP_Contacs.clear();
      _contact_counter = counter;
      SP_Contacs = setSp_Contact(contact: contact);
      // SP_Contacs.add(contact.First_Name);
      // SP_Contacs.add(contact.Last_Name);
      // SP_Contacs.add(contact.Phone);
      // SP_Contacs.add(contact.Email);

      preferences.setStringList('Contact : ${_contact_counter}', SP_Contacs);
      preferences.setInt('contact_counter', ++_contact_counter);

      SP_Contacs.clear();

      _allContacts.add(contact);

      notifyListeners();

      return true;
    }
  }

  void editContact({required Contact_Modal contact, required int index}) {
    // SP_Contacs.clear();
    SP_Contacs = setSp_Contact(contact: contact);
    // SP_Contacs.add(contact.First_Name);
    // SP_Contacs.add(contact.Last_Name);
    // SP_Contacs.add(contact.Phone);
    // SP_Contacs.add(contact.Email);

    preferences.setStringList('Contact : ${index}', SP_Contacs);
    _allContacts[index] = contact;
    SP_Contacs.clear();
    notifyListeners();
  }

  void deleteContact({required int index}) {
    _allContacts.removeAt(index);
    _allContacts.forEach((element) {
      print(element.First_Name);
    });
    for (int i = 0; i < _allContacts.length; i++) {
      SP_Contacs = setSp_Contact(contact: _allContacts[i]);
      preferences.setStringList('Contact : ${i}', SP_Contacs);
    }
    preferences.setInt('contact_counter', --_contact_counter);
    notifyListeners();
  }
}
