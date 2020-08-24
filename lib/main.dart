import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: Text('appDados'),
    );
  }

  }

  class PaginaDado extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Text("Dado"),
      ),
      body:FlatButton(
        onPressed: (){},
         child: Image(
           image:AssetImage("assets/images/dice1.png"),
         ))
    );
  }

  }