import 'package:flutter/material.dart';

import 'dart:math';
import 'dart:ui';

//botones page


class BotonesPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
          children: <Widget>[
            _fondoApp(),

            SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  _titulos(),
                  _botonesRedondeados()
                ],
              ),
            )

          ],
        ),
        bottomNavigationBar: _bottomNavigationBar(context)
    );
  }


  Widget _fondoApp(){

    final gradiente = Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: FractionalOffset(0.0, 0.6),
              end: FractionalOffset(0.0, 1.0),
              colors: [
                Color.fromARGB(255, 60, 238, 6),
                Color.fromARGB(255, 207, 207, 207)
              ]
          )
      ),
    );


    final cajaRosa = Transform.rotate(
        angle: -pi / 5.0,
        child: Container(
          height: 360.0,
          width: 360.0,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(80.0),
              gradient: LinearGradient(
                  colors: [
                    Color.fromARGB(255, 236, 102, 98),
                    Color.fromARGB(255, 68, 16, 31)
                  ]
              )
          ),
        )
    );

    return Stack(
      children: <Widget>[
        gradiente,
        Positioned(
            top: -100.0,
            child: cajaRosa
        )
      ],
    );

  }

  Widget _titulos() {

    return SafeArea(
      child: Container(
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text('PAGINATION ', style: TextStyle( color: Color.fromARGB(255, 0, 255, 242), fontSize: 30.0, fontWeight: FontWeight.bold )),
            SizedBox( height: 10.0 ),
            Text('Clasifica esta transaccion en una categoria ', style: TextStyle( color: Color.fromARGB(255, 255, 255, 255), fontSize: 18.0 )),
          ],
        ),
      ),
    );

  }

  Widget _bottomNavigationBar(BuildContext context) {

    return Theme(
      data: Theme.of(context).copyWith(
          canvasColor: Color.fromARGB(255, 243, 243, 255),
          primaryColor: Color.fromARGB(255, 0, 0, 0),
          textTheme: Theme.of(context).textTheme
              .copyWith( caption: TextStyle( color: Color.fromRGBO(116, 117, 152, 1.0) ) )
      ),
      child: BottomNavigationBar(

        items: [
          BottomNavigationBarItem(
              icon: Icon( Icons.calendar_today, size: 30.0 ),
              label: "titulo"
          ),
          BottomNavigationBarItem(
              icon: Icon( Icons.bubble_chart, size: 30.0 ),
              label: "Titulo"
          ),
          BottomNavigationBarItem(
              icon: Icon( Icons.supervised_user_circle, size: 30.0 ),
              label: "titulo"
          ),
        ],
      ),
    );

  }


  Widget _botonesRedondeados() {

    return Table(
      children: [
        TableRow(
            children: [
              _crearBotonRedondeado( Color.fromARGB(255, 24, 163, 152), Icons.border_all, 'General' ),
              _crearBotonRedondeado( Color.fromARGB(255, 204, 18, 59), Icons.directions_bus, 'Bus' ),
            ]
        ),
        TableRow(
            children: [
              _crearBotonRedondeado( Colors.pinkAccent, Icons.shop, 'Compras' ),
              _crearBotonRedondeado( Color.fromARGB(255, 145, 64, 27), Icons.insert_drive_file, 'Archivo' ),
            ]
        ),
        TableRow(
            children: [
              _crearBotonRedondeado( Color.fromARGB(255, 65, 139, 77), Icons.movie_filter, 'Entretenimiento' ),
              _crearBotonRedondeado( Colors.green, Icons.cloud, 'Comestibles' ),
            ]
        ),
        TableRow(
            children: [
              _crearBotonRedondeado( Colors.red, Icons.collections, 'Galeria' ),
              _crearBotonRedondeado( Colors.teal, Icons.help_outline, 'General' ),
            ]
        )
      ],
    );

  }

  Widget _crearBotonRedondeado( Color color, IconData icono, String texto ) {


    return ClipRect(
      child: BackdropFilter(
        filter: ImageFilter.blur( sigmaX: 10.0, sigmaY: 10.0 ),
        child: Container(
          height: 180.0,
          margin: EdgeInsets.all(15.0),
          decoration: BoxDecoration(
              color: Color.fromRGBO(62, 66, 107, 0.7),
              borderRadius: BorderRadius.circular(20.0)
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              SizedBox( height: 5.0 ),
              CircleAvatar(
                backgroundColor: color,
                radius: 35.0,
                child: Icon( icono, color: Colors.white, size: 30.0 ),
              ),
              Text( texto , style: TextStyle( color: color )),
              SizedBox( height: 5.0 )
            ],
          ),

        ),
      ),
    );
  }


}