import 'package:flutter/material.dart';

class HomePageTemp extends StatelessWidget {

  final opciones = [ 'Uno', 'Dos', 'Tres', 'Cuatro', 'Cinco'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Componentes Temp'),
      ),
      body: ListView(
        //children: _crearItems()
        children: _crearItemsCorta()
      )
    );
  }

  List<Widget> _crearItems(){

  List<Widget> lista = new List<Widget>();

    for (var opt in opciones) {
      
      final tempWidget = ListTile(
        title: Text( opt),
      );

      lista
           ..add( tempWidget )
           ..add( Divider() );

    }

    return lista;
  }

  List<Widget> _crearItemsCorta(){

    return opciones.map( ( item ) {

      return Column(
        children: <Widget>[
          ListTile(
            title: Text( item + '!'),
            subtitle: Text( 'Subtitulo'),
            leading: Icon(Icons.add),
            trailing: Icon(Icons.arrow_forward_ios),
            onTap: () {},
          ),
          Divider(),
        ],
      );

    }).toList();

  }
}