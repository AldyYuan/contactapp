import 'package:flutter/material.dart';
import 'package:fluttercontact/core/models/contactModel.dart';
import 'package:fluttercontact/core/viewmodels/CRUDModel.dart';
import 'package:fluttercontact/ui/views/modifyContact.dart';
import 'package:provider/provider.dart';

class ContactDetails extends StatelessWidget {
  final Contact contacts;

  ContactDetails({@required this.contacts});

  @override
  Widget build(BuildContext context) {
    final contactProvider = Provider.of<CRUDModel>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Contact Details'),
        actions: <Widget>[
          IconButton(
            iconSize: 35,
            icon: Icon(Icons.delete_forever),
            onPressed: () async {
              await contactProvider.removeContact(contacts.id);
              Navigator.pop(context);
            },
          ),
          IconButton(
              iconSize: 35,
              icon: Icon(Icons.mode_edit),
              onPressed: () async {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (_) => ModifyContact(contacts: contacts)));
              })
        ],
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            CircleAvatar(
              radius: 32,
              child: Text('${contacts.name[0]}', style: TextStyle(fontSize: 28),),
            ),
            Divider(),
            Text(
              contacts.name,
              style: TextStyle(
                  fontWeight: FontWeight.w900,
                  fontSize: 22,
                  fontStyle: FontStyle.italic),
            ),
            SizedBox(
              height: 8,
            ),
            Text(
              'Phone Number : ${contacts.phone}',
              style: TextStyle(
                  fontWeight: FontWeight.w900,
                  fontSize: 22,
                  fontStyle: FontStyle.italic),
            ),
            SizedBox(
              height: 16,
            ),
            Container(
              height: 92,
              child: Card(
                margin: EdgeInsets.all(16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0)
                ),
                elevation: 8,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    IconButton(
                      icon: Icon(Icons.call, size: 28,),
                      splashColor: Colors.cyanAccent,
                      onPressed: () {},
                    ),
                    IconButton(
                      icon: Icon(Icons.message, size: 28),
                      splashColor: Colors.cyanAccent,
                      onPressed: () {},
                    ),
                    IconButton(
                      icon: Icon(Icons.video_call, size: 28),
                      splashColor: Colors.cyanAccent,
                      onPressed: () {},
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
