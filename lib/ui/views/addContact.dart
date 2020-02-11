import 'package:flutter/material.dart';
import 'package:fluttercontact/core/models/contactModel.dart';
import 'package:fluttercontact/core/viewmodels/CRUDModel.dart';
import 'package:provider/provider.dart';

class AddContact extends StatefulWidget {
  @override
  _AddContactState createState() => _AddContactState();
}

class _AddContactState extends State<AddContact> {
  final _formKey = GlobalKey<FormState>();
  String name;
  String phone;

  @override
  Widget build(BuildContext context) {
    var contactProvider = Provider.of<CRUDModel>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Contact'),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(12),
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              TextFormField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Contact name",
                ),
                validator: (value){
                  if(value.isEmpty){
                    return 'Please enter contact name';
                  }
                },
                onSaved: (value) => name = value
              ),
              SizedBox(
                height: 16,
              ),
              TextFormField(
                keyboardType: TextInputType.numberWithOptions(),
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Phone Number',
                ),
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Please enter The Phone Number';
                  }
                },
                  onSaved: (value) => phone = value
              ),
              SizedBox(
                height: 16,
              ),
              RaisedButton(
                onPressed: () async{
                  if(_formKey.currentState.validate()){
                    _formKey.currentState.save();
                    await contactProvider.addContact(Contact(name: name,phone: phone));
                    Navigator.pop(context);
                  }
                },
                child: Text('Add Contact'),
                splashColor: Colors.deepOrange,
              )
            ],
          ),
        ),
      ),
    );
  }
}