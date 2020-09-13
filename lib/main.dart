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
  final TextEditingController _weightController = TextEditingController();
  final TextEditingController _heightController = TextEditingController();

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String _textInfo = "Informe seus dados";

  void _resetFields() {
    _weightController.text = "";
    _heightController.text = "";

    setState(() {
      _textInfo = "Informe seus dados";
    });
  }

  void _calculate() {
    double weight = double.parse(_weightController.text);
    double height = (double.parse(_heightController.text) / 100);
    double imc = weight / (height * height);

    setState(() {
      if (imc < 18.6) {
        _textInfo = "Abaixo do peso (${imc.toStringAsPrecision(2)})";
      } else if ((imc >= 18.6) && (imc < 24.9)) {
        _textInfo = "Peso ideal (${imc.toStringAsPrecision(2)})";
      } else if ((imc >= 24.9) && (imc < 29.9)) {
        _textInfo = "Levemente acima do peso (${imc.toStringAsPrecision(2)})";
      } else if ((imc >= 29.9) && (imc < 34.9)) {
        _textInfo = "Obesidade grau I (${imc.toStringAsPrecision(2)})";
      } else if ((imc >= 34.9) && (imc < 39.9)) {
        _textInfo = "Obesidade grau II (${imc.toStringAsPrecision(2)})";
      } else if (imc >= 39.9) {
        _textInfo = "Obesidade grau III (${imc.toStringAsPrecision(2)})";
      }
    });
  }

  String _validateField(String value) {
    if (value.isEmpty) {
      return "Este campo não pode estar vazio!";
    } else if (double.tryParse(value) == null) {
      return "Este campo precisa ser um valor inteiro ou com decimais!";
    }

    return null;
  }

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
            onPressed: _resetFields,
          ),
        ],
      ),
      backgroundColor: Colors.white,
      body: _body(),
    );
  }

  Widget _body() {
    return
    Form(
      key: _formKey,
      child: ListView(
        padding: EdgeInsets.only(left: 15, right: 15),
        children: <Widget>[
          Icon(Icons.person_outline, size: 120, color: Colors.green,),

          // Peso
          TextFormField(keyboardType: TextInputType.number,
            decoration: InputDecoration(labelText: "Peso (kg)",
                labelStyle: TextStyle(color: Colors.green)
            ),
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.green, fontSize: 25.0),
            controller: _weightController,
            validator: _validateField,
          ),

          // Altura
          TextFormField(keyboardType: TextInputType.number,
            decoration: InputDecoration(labelText: "Altura (cm)",
                labelStyle: TextStyle(color: Colors.green)
            ),
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.green, fontSize: 25.0),
            controller: _heightController,
            validator: _validateField,
          ),

          Padding( padding: EdgeInsets.only(top: 15.0),),

          // Botão para calcular
          Container(
            height: 50.0,
            child: RaisedButton(
              onPressed: () {
                if (_formKey.currentState.validate()) { _calculate(); }
              },
              child: Text("Calcular",
                style: TextStyle(color: Colors.white, fontSize: 20.0),
              ),
              color: Colors.green,
            ),
          ),

          Padding( padding: EdgeInsets.only(top: 15.0),),

          // Infromação
          Text("$_textInfo",
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.green, fontSize: 25.0),
          ),
        ],
      ),
    );
  }
}
