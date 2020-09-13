import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Home(),
  ));
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Calculadora de IMC"),
        centerTitle: true,
        backgroundColor: Colors.green,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.refresh),
            onPressed: () {},
          ),
        ],
      ),
      backgroundColor: Colors.white,
      body: _body(),
    );
  }

  Widget _body() {
    return
      ListView(
        padding: EdgeInsets.only(left: 15, right: 15),
        children: <Widget>[
          Icon(Icons.person_outline, size: 120, color: Colors.green,),

          // Peso
          TextField(keyboardType: TextInputType.number,
            decoration: InputDecoration(labelText: "Peso (kg)",
                labelStyle: TextStyle(color: Colors.green)
            ),
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.green, fontSize: 25.0),
          ),

          // Altura
          TextField(keyboardType: TextInputType.number,
            decoration: InputDecoration(labelText: "Altura (cm)",
                labelStyle: TextStyle(color: Colors.green)
            ),
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.green, fontSize: 25.0),
          ),

          Padding( padding: EdgeInsets.only(top: 15.0),),

          // Botão para calcular
          Container(
            height: 50.0,
            child: RaisedButton(
              onPressed: () {},
              child: Text("Calcular",
                style: TextStyle(color: Colors.white, fontSize: 20.0),
              ),
              color: Colors.green,
            ),
          ),

          Padding( padding: EdgeInsets.only(top: 15.0),),

          // Infromação
          Text("Info",
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.green, fontSize: 25.0),
          ),
        ],
      );
  }
}
