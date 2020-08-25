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
    return Scaffold(
        appBar: AppBar(
          title: Text("Dado"),
        ),
        body: Container(
          color: Colors.red,
          child: Center(
            child: Column(
              children: [
                Row(
                  children: [
                    RaisedButton(
                      onPressed: () {
                        setState(() {
                          if (_cantidadDados > 1) _cantidadDados--;
                          //si lista de alimentos de desayuno  <0
                          //debe agregar alimentos
                        });
                      },
                      child: Text("Quitar"),
                    ),
                    RaisedButton(
                      onPressed: () {
                        setState(() {
                          _cantidadDados++;
                        });
                      },
                      child: Text("Agregar"),
                    ),
                  ],
                ),
                Expanded(
                  child: GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3),
                      itemCount: _cantidadDados,
                      itemBuilder: (context, index) {
                        return Padding(
                            padding: EdgeInsets.all(10),
                            child: Image(
                              image: AssetImage("assets/dice1.png"),
                              height: 80,
                              width: 80,
                            ));
                      }),
                ),
                GestureDetector(
                  onVerticalDragStart: (details) {
                    setState(() {
                      _scollingVertically = true;
                    });
                  },
                  onVerticalDragEnd: (details) {
                    setState(() {
                      _scollingVertically = false;
                    });
                  },
                  
                  onPanUpdate: (details){
                    setState(() {
                      _offsetVertical += details.delta;
                    });
                  },
                  child: Container(
                    height: 280,
                    width: 250,
                    color: Colors.grey,
                    child: Center(
                      child: Transform.translate(
                        offset:_offsetVertical,
                        child:Text(_scollingVertically ? "Drag" : "Stop")
                          ),
                      ),
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
