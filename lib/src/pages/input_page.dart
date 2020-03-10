import 'package:flutter/material.dart';

class InputPage extends StatefulWidget {

  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> { 

  String _nombre = "";


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title : Text('Input de textos'),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal:10.0, vertical:20.0),
        children: <Widget>[
          _crearInput(),
          Divider(),
          _crearPersona()
        ],
      ),
    );
  }
  Widget _crearInput(){ 
    
    return TextField(
      //autofocus: true,
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
        border      : OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        counter     : Text('Letras ${ _nombre.length }'),
        hintText    : 'Escribe tu nombre',
        labelText   : 'Nombre',
        helperText  : 'Sólo escribe tu nombre.',
        suffixIcon  : Icon(Icons.accessibility),
        icon        : Icon(Icons.account_circle),
      ),
      onChanged: ( data ){
        setState(() {
          _nombre = data;
        });
      },
    );
  
  }
  Widget _crearPersona() {

    return ListTile(
      title: Text('Nombre es : $_nombre'),
    );

  }
}