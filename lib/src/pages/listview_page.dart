import 'package:flutter/material.dart';
import 'dart:async';


class ListaPage extends StatefulWidget {

  @override
  _ListaPageState createState() => _ListaPageState();
}

class _ListaPageState extends State<ListaPage> {

  ScrollController _scrollController = new ScrollController();

  List<int> _listaNumeros = new List();
  int       _ultimoItem   = 0;
  bool      _isLoading    = false;

  @override
  void initState() {
    super.initState();
    _agregarDiez();
    _scrollController.addListener((){

      if(_scrollController.position.pixels == _scrollController.position.maxScrollExtent){
        //_agregarDiez();
        fetchData();
      }

    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Listas')
      ),
      body: Stack(
        children: <Widget>[
          _crearLista(),
          _crearLoading(),
        ],
      )
    );
  }

  Widget _crearLista(){

    return RefreshIndicator(
        onRefresh   : _obtenerPaginaUno,
        child       : ListView.builder(
        itemCount   : _listaNumeros.length,
        controller  : _scrollController,
        itemBuilder : (BuildContext context , int indice){

          final imagen = _listaNumeros[indice];

          return FadeInImage(
            image       : NetworkImage('https://picsum.photos/500/300/?image=$imagen'),
            placeholder : AssetImage('assets/original.gif'),
          );
        },
      ),
    );

  }

  Future<Null> _obtenerPaginaUno() async{

    final duration = Duration(seconds: 2);
    new Timer(duration, () {
      _listaNumeros.clear();
      _ultimoItem++;
      _agregarDiez();
    });

    return Future.delayed(duration);
  }

  void _agregarDiez(){

    for (var i = 0 ; i < 10 ; i++){
      _ultimoItem++;
      _listaNumeros.add( _ultimoItem );
    }

    setState(() {
      
    });

  }

  Future<Null> fetchData() async {

    _isLoading = true;
    setState(() {});

    final duration = new Duration(seconds : 2);
    return new Timer( duration, respuestaHTTP);
  }

  void respuestaHTTP(){
    _isLoading = false;
    _scrollController.animateTo(
      _scrollController.position.pixels + 500,
      curve : Curves.elasticIn,
      duration: Duration( milliseconds: 900),
    );
    _agregarDiez();
  }

  Widget _crearLoading(){
    if ( _isLoading ){
      return Column(
        mainAxisAlignment: MainAxisAlignment.end,
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              CircularProgressIndicator(),
            ],
          ),
          SizedBox(height:15.0),
        ],
      );
    }else{
      return Container();
    }
  }

}