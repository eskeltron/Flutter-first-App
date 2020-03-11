import 'package:flutter/material.dart';

class SliderPage extends StatefulWidget {

  @override
  _SliderPageState createState() => _SliderPageState();
}

class _SliderPageState extends State<SliderPage> {

  double _valorActual    = 0;
  bool _bloquearCheck = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title : Text('Slider')
      ),
      body : Container(
        padding: EdgeInsets.only(top:50.0),
        child: Column(
          children: <Widget>[
            _crearSlider(),
            _crearCheckBox(),
            _crearSwitch(),
            Expanded(
              child: _crearImagen()
            ),
          ],
        ),
      ),
    );
  }
  
  Widget _crearImagen(){
    return Image(
      image : NetworkImage('https://upload.wikimedia.org/wikipedia/en/1/19/Batman_%28circa_2016%29.png'),
      width : _valorActual,
      fit   : BoxFit.contain
    );
  }

  Widget _crearCheckBox(){

    // return Checkbox(
    //   value: _bloquearCheck,
    //   onChanged: ( valor ){
    //     setState(() {
    //       _bloquearCheck = valor;
    //     });
    //   },
    // );

    return CheckboxListTile(
      title: Text('Bloquear slider'),
      value: _bloquearCheck,
      onChanged: (valor){
        setState(() {
          _bloquearCheck = valor;
        });
      },
    );

  }

  Widget _crearSwitch(){
    return SwitchListTile(
      title: Text('Bloquear slider'),
      value: _bloquearCheck,
      onChanged: (valor){
        setState(() {
          _bloquearCheck = valor;
        });
      },
    );
  }

  Widget _crearSlider(){

    return Slider(
      
      activeColor: Colors.indigo,
      label: 'Tamaño de la imagen',
      divisions: 20,
      value : _valorActual,
      min: 0.0,
      max: 100.0,
      onChanged: ( value ){
        if(!_bloquearCheck) {
          setState(() {
            _valorActual = value;
          });
        }
      },
    );

  }

}