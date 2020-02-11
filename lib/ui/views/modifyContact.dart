import 'package:flutter/material.dart';
import 'package:fluttercontact/core/models/contactModel.dart';
import 'package:fluttercontact/core/viewmodels/CRUDModel.dart';
import 'package:provider/provider.dart';

class ModifyContact extends StatefulWidget {
  final Contact contacts;

  ModifyContact({@required this.contacts});
  @override
  _ModifyContactState createState() => _ModifyContactState();
}

class _ModifyContactState extends State<ModifyContact> {
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
                initialValue: widget.contacts.name,
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
                initialValue: widget.contacts.phone,
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
              RaisedButton(
                onPressed: () async{
                  if(_formKey.currentState.validate()){
                    _formKey.currentState.save();
                    await contactProvider.updateContact(Contact(name: name,phone: phone),widget.contacts.id);
                    Navigator.pop(context);
                  }
                },
                child: Text('Modify Contact'),
              )
            ],
          ),
        ),
      ),
    );
  }
}