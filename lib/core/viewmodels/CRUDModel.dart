import 'dart:async';
import 'package:flutter/material.dart';
import '../../locator.dart';
import '../services/api.dart';
import '../models/contactModel.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class CRUDModel extends ChangeNotifier{
  Api _api = locator<Api>();

  List<Contact> contacts;

  Future<List<Contact>> fetchContact() async{
    var results = await _api.getDataCollection();
    contacts = results.documents
      .map((doc) => Contact.fromMap(doc.data, doc.documentID))
      .toList() ;
    return contacts;
  }

  Stream<QuerySnapshot> fetchContactAsStream(){
    return _api.streamDataCollection();
  }

  Future<Contact> getContactById(String id) async{
    var doc = await _api.getDocumentById(id);
    return Contact.fromMap(doc.data, doc.documentID);
  }

  Future removeContact(String id) async{
    await _api.removeDocument(id);
    return ;
  }

  Future updateContact(Contact data, String id) async {
    await _api.updateDocument(data.toJson(), id);
    return ;
  }

  Future addContact(Contact data) async{
    var result = await _api.addDocument(data.toJson());

    return ;
  }
}