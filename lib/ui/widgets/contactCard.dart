import 'package:flutter/material.dart';
import 'package:fluttercontact/core/models/contactModel.dart';
import 'package:fluttercontact/ui/views/contactDetails.dart';

class ContactCard extends StatelessWidget {
  final Contact contactDetails;

  ContactCard({@required this.contactDetails});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (_) => ContactDetails(contacts: contactDetails)));
      },
      child: Padding(
        padding: EdgeInsets.all(8),
        child: Card(
          elevation: 5,
          child: Container(
            height: MediaQuery.of(context).size.height * 0.45,
            width: MediaQuery.of(context).size.width* 0.9,
            child: Column(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.all(16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        contactDetails.name,
                        style: TextStyle(fontWeight: FontWeight.w900,fontSize: 22, fontStyle: FontStyle.italic),
                      ),
                      Text(
                        '${contactDetails.phone}',
                        style: TextStyle(fontWeight: FontWeight.w900,fontSize: 22, fontStyle: FontStyle.italic),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}