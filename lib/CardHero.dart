import 'package:flutter/material.dart';
import 'package:jsonmapeoa3/main.dart';

class SendCard extends StatelessWidget {
  final heroes hero;

  SendCard(this.hero);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        backgroundColor: Colors.indigo,
        appBar: AppBar(
          automaticallyImplyLeading: false, //Quitar boton retroceso
          title: Text(hero.nombre.toString(),
            style: TextStyle(
              fontSize: 30.0,
            ),
          ),
          centerTitle: true,
          backgroundColor: Colors.black45,
        ),
        body: Stack(
          children: <Widget>[
            Positioned(
              height: MediaQuery.of(context).size.height / 1.5,
              width: MediaQuery.of(context).size.width - 19,
              left: 10.0,
              top: MediaQuery.of(context).size.height * 0.10,
              child: Container(
                child: SingleChildScrollView(
                  child: Card(
                    color: Colors.transparent,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        SizedBox(
                          height: 30.0,
                        ),
                        Container(
                          height: 250.0,
                          width: 250.0,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image:
                                      NetworkImage(hero.profile.toString()))),
                        ),
                        new Padding(
                          padding: EdgeInsets.all(10.0),
                        ),
                        Text(
                          hero.nombre.toString(),
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 25.0,
                              fontWeight: FontWeight.bold),
                        ),
                        new Padding(
                          padding: EdgeInsets.all(5.0),
                        ),
                        Text(
                          "Edad: ${hero.edad}",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 16.0,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "Altura: ${hero.altura}",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 16.0,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "Genero: ${hero.genero}",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 16.0,
                              fontWeight: FontWeight.bold),
                        ),
                        new Padding(
                          padding: EdgeInsets.all(5.0),
                        ),
                        Text(
                          "Descripción: ${hero.descripcion}",
                          textAlign: TextAlign.justify,
                          style: TextStyle(color: Colors.white, fontSize: 16.0),
                        ),
                        new Padding(
                          padding: EdgeInsets.all(15.0),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ));
  }
}
