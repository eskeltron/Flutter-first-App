import 'package:flutter/material.dart';
import 'dart:math';

class AnimatedContainerPage extends StatefulWidget {

  @override
  _AnimatedContainerPageState createState() => _AnimatedContainerPageState();
}

class _AnimatedContainerPageState extends State<AnimatedContainerPage> {

  double _width   = 50.0;
  double _height  = 50.0;
  Color  _color   = Colors.pink;

  BorderRadiusGeometry _borderRadius = BorderRadius.circular(8.0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Animated Container'),
      ),
      body: Center(
        child: AnimatedContainer(
          duration: Duration(milliseconds: 1000),
          curve: Curves.bounceIn,
          width  : _width,
          height : _height,
          decoration: BoxDecoration(
            borderRadius : _borderRadius,
            color        : _color
          ),
        ),
      ),
      floatingActionButton: _cambiarFormas(),
    );
  }

    Row _cambiarFormas(){
      return Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          FloatingActionButton(
            heroTag: "btn1",
            child: Icon(Icons.add),
            onPressed: _cambiarForma,
          ),
          SizedBox(width: 10.0,),
          FloatingActionButton(
            heroTag: "btn2",
            child: Icon(Icons.sentiment_dissatisfied),
            onPressed: _cambiarTamanio,
          ),
        ],
      );
    }

    void _cambiarTamanio(){
      setState(() {
        _width  = 0.0;
        _height = 0.0;
      });

    }

    void _cambiarForma(){

      final random = Random();

      setState(() {
      
        _width  = random.nextInt(300).toDouble();
        _height = random.nextInt(300).toDouble();
        _color  = Color.fromRGBO(
          random.nextInt(255), 
          random.nextInt(255), 
          random.nextInt(255), 
          1
        );
        _borderRadius = BorderRadius.circular( random.nextInt(100).toDouble() );
      });

    }
}