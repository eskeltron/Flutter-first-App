import 'package:flutter/material.dart';

class CardPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cards'),
      ),
      body: ListView(
        padding: EdgeInsets.all(10.0),
        children: <Widget>[
          _cardTipoUno(),
          SizedBox(height:20.0),
          _cardTipoDos(),
        ],
      ),
    );
  }

  Widget _cardTipoUno() {
    return Card(
      elevation: 10.0,
      shape: RoundedRectangleBorder( borderRadius: BorderRadius.circular(20.0)),
      child: Column(
        children: <Widget>[
          ListTile(
            leading: Icon(Icons.photo_album, color: Colors.blue,),
            title: Text('Soy el título de esta tarjeta'),
            subtitle: Text('Aquí va la descripción de la tarjeta la cual será bastante larga así que escribo mucho'),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              FlatButton(
                child: Text('Cancelar'),
                onPressed: () {}, 
              ),
              FlatButton(
                child: Text('Ok'),
                onPressed: () {}, 
              ),
            ],
          )
        ],
      )
    );
  }

  Widget _cardTipoDos() {
    final card = Container(
      child: Column(
        children: <Widget>[
          FadeInImage(
            image: NetworkImage('https://upload.wikimedia.org/wikipedia/commons/thumb/8/81/Parque_Eagle_River%2C_Anchorage%2C_Alaska%2C_Estados_Unidos%2C_2017-09-01%2C_DD_02.jpg/1024px-Parque_Eagle_River%2C_Anchorage%2C_Alaska%2C_Estados_Unidos%2C_2017-09-01%2C_DD_02.jpg'),
            placeholder: AssetImage('assets/original.gif'),
            fadeOutDuration: Duration( milliseconds: 200 ),
            height: 300.0,
            fit: BoxFit.cover
          ),
          //Image(
          //  image: 
          //),
          Container(
            padding: EdgeInsets.all(10.0),
            child: Text('Text')
          ),

        ],
      ),
    );
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30.0),
        color: Colors.white,
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.black26,
            blurRadius: 10.0,
            spreadRadius: 2.0,
            offset: Offset(2.0 , 10.0 )
          ),
        ],
      ),
      child: ClipRRect(
        child: card,
        borderRadius: BorderRadius.circular(30.0),
      ),
    ); 
  }
}
