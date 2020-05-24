import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:jsonmapeoa3/Splash.dart';
import 'package:jsonmapeoa3/CardHero.dart';
import 'package:audioplayers/audio_cache.dart';
import 'package:audioplayers/audioplayers.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
// TODO: implement build
    return MaterialApp(
      theme: ThemeData(
        fontFamily: 'Schyler',
        brightness: Brightness.light,
        primarySwatch: Colors.indigo,
      ),
      darkTheme: ThemeData(
        fontFamily: 'Schyler',
        brightness: Brightness.dark,
        primarySwatch: Colors.red,
      ),
      home: ScreenSplash(),
    );
  }
}

class homePage extends StatefulWidget {
  @override
  _myHomePageState createState() => new _myHomePageState();
}

class _myHomePageState extends State<homePage> {
  //Metodo Asincrono para leer el JSON
  Future<String> _loadAsset() async {
    return await rootBundle.loadString('json_assets/heroes.json');
  }

  Future<List<heroes>> _getHeroes() async {
    String jsonString = await _loadAsset();
    var jsonData = json.decode(jsonString);
    print(jsonData.toString());

    List<heroes> MarvelHeroes = [];
    for (var h in jsonData) {
      heroes he = heroes(h["profile"], h["nombre"], h["identidad"], h["edad"],
          h["altura"], h["genero"], h["descripcion"]);
      MarvelHeroes.add(he);
    }
    print("Numero de elementos");
    print(MarvelHeroes.length);
    return MarvelHeroes;
  }

  //Variables busqueda
  String searchString = "";
  bool _isSearching = false;
  final searchController = TextEditingController();

  //Audio
  AudioPlayer audioPlayer;
  AudioCache audioCache;

  @override
  void initState() {
    audioPlayer = AudioPlayer();
    audioCache = AudioCache();
    super.initState();

    setState(() {
      audioCache.play('avengers.mp3');
    });
  }


  @override
  Widget build(BuildContext context) {
// TODO: implement build
    return new Scaffold(
      appBar: new AppBar(
          centerTitle: true,
          title: _isSearching
            ? TextField(
          decoration: InputDecoration(
              hintText: "Search",
              hintStyle: TextStyle(fontSize: 20,fontWeight: FontWeight.bold, color: Colors.black45),
              icon: Icon(Icons.search)),
          onChanged: (value) {
            setState(() {
              searchString = value;
            });
          },
          controller: searchController,
        )
            : Text("MARVEL",
            style: TextStyle(
                fontSize: 40,fontWeight:
                FontWeight.bold,
                color: Colors.white
            ),
          ),
        actions: <Widget>[
          !_isSearching
              ? IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              setState(() {
                searchString = "";
                this._isSearching = !this._isSearching;
              });
            },
          )
              : IconButton(
            icon: Icon(Icons.cancel),
            onPressed: () {
              setState(() {
                this._isSearching = !this._isSearching;
              });
            },
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Container(
          child: FutureBuilder(
            future: _getHeroes(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.data == null) {
                return Container(
                  child: Center(
                    child: Text("Loading..."),
                  ),
                );
              }
              else{
                return ListView.builder(
                    itemCount: snapshot.data.length,
                    itemBuilder: (BuildContext context, int index){
                      return snapshot.data[index].identidad
                          .contains(searchString)
                          ? ListTile(
                            leading: CircleAvatar(
                            backgroundImage: NetworkImage(snapshot.data[index].profile.toString())),
                            title: new Text(snapshot.data[index].nombre.toString(),
                            style: TextStyle(
                                fontSize: 20.0,
                              ),
                            ),
                            subtitle: new Text(snapshot.data[index].identidad.toString()),
                            onTap: (){
                              Navigator.push(context,
                                  new MaterialPageRoute(builder: (context) => SendCard (snapshot.data[index])));
                            },
                        )
                      : Container();
                     },
                );
              }
            },
          ),
        ),
      ),
    );
  }
}

class heroes {
  final String profile;
  final String nombre;
  final String identidad;
  final String edad;
  final String altura;
  final String genero;
  final String descripcion;

  heroes(this.profile, this.nombre, this.identidad, this.edad, this.altura,
      this.genero, this.descripcion);
}

