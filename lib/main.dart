import 'package:flutter/material.dart';
import './src/Home.dart';
import './src/Cart.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Just test stream provider',
      theme: ThemeData(
        primarySwatch: Colors.indigo,

      ),
      routes: {
        // When navigating to the "/" route, build the FirstScreen widget.
        '/': (context) => MyHome(),
        // When navigating to the "/second" route, build the SecondScreen widget.
        '/cart': (context) => Cart(),
      },
      


      );
    
  }
}