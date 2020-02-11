import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fluttercontact/ui/views/addContact.dart';
import 'package:fluttercontact/ui/views/contactDetails.dart';
import 'package:fluttercontact/ui/views/homeView.dart';

class Router{
  static Route<dynamic> generateRoute(RouteSettings settings){
    switch(settings.name){
      case '/':
        return MaterialPageRoute(
          builder: (_) => HomeView()
        );
      
      case '/addContact' :
        return MaterialPageRoute(
          builder: (_)=> AddContact()
        );
      default: 
      return MaterialPageRoute(
        builder: (_) => Scaffold(
          body: Center(
            child: Text('No route defined for ${settings.name}'),
          )
        )
      );
    }
  }
}