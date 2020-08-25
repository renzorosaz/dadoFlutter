import 'dart:math';

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
      home: PaginaDado(),
    );
  }
}


class PaginaDado extends StatefulWidget {
  @override
  _PaginaDadoState createState() => _PaginaDadoState();
}

class _PaginaDadoState extends State<PaginaDado> {

  int _cantidadDados = 1;
  bool _scollingVertically = false;
  Offset _offsetVertical = Offset.zero;

  @override
  Widget build(BuildContext context) {

      String t="";
    String inver="";

    TextEditingController _controller= TextEditingController();

    return Scaffold(
        appBar: AppBar(
          title: Text("Dado"),
        ),
        body: Container(
            child: Column(
              children: [
                TextField(                  
                    controller: _controller,
                ),
                RaisedButton(
                  onPressed: ((){
                      setState(() {
                        t=_controller.text;
                      inver=t.split('').reversed.join();

                      print(t);
                      print(inver);
                      });
                  }),
                  ),
                Text(t,style: TextStyle(color:Colors.black)),
                Text(inver),
              ],
            ),
        ),
        );
  }
}
