import 'package:flutter/material.dart';
import 'package:fluttercontact/ui/views/contactDetails.dart';
import 'package:fluttercontact/ui/widgets/contactCard.dart';
import 'package:provider/provider.dart';
import 'package:fluttercontact/core/models/contactModel.dart';
import 'package:fluttercontact/core/viewmodels/CRUDModel.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class HomeView extends StatefulWidget {
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  List<Contact> contacts;

  @override
  Widget build(BuildContext context) {
    final productProvider = Provider.of<CRUDModel>(context);
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        elevation: 4,
        splashColor: Colors.deepOrange,
        onPressed: () {
          Navigator.pushNamed(context, '/addContact');
        },
        child: Icon(Icons.add),
      ),
      appBar: AppBar(
        title: Text('Contacts'),
      ),
      body: Container(
          child: StreamBuilder(
              stream: productProvider.fetchContactAsStream(),
              builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                if (snapshot.hasData) {
                  contacts = snapshot.data.documents
                      .map((doc) => Contact.fromMap(doc.data, doc.documentID))
                      .toList();
                  return ListView.builder(
                      shrinkWrap: true,
                      itemCount: contacts.length,
                      itemBuilder: (buildContext, index) {
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (_) => ContactDetails(
                                        contacts: contacts[index])));
                          },
                          child: Container(
                            padding: EdgeInsets.all(8.0),
                            child: Card(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15.0)),
                              elevation: 10,
                              child: ListTile(
                                contentPadding: EdgeInsets.symmetric(
                                    horizontal: 20.0, vertical: 10.0),
                                leading: CircleAvatar(
                                  child: Text(
                                    '${contacts[index].name[0]}',
                                    style: TextStyle(),
                                  ),
                                ),
                                trailing: Icon(Icons.keyboard_arrow_right),
                                title: Text(contacts[index].name),
                                subtitle: Text(
                                    "Phone Number : ${contacts[index].phone}"),
                              ),
                            ),
                          ),
                        );
                      });
                } else {
                  return Center(child: CircularProgressIndicator());
                }
              })),
    );
  }
}
