import 'package:curso_flutter/models/Gif.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late Future<List<Gif>> _listadoGifs;

  Future<List<Gif>> _tenerGifs() async {
    final response = await http.get(Uri.parse(
        "https://api.giphy.com/v1/gifs/trending?api_key=qV3hCkfiKSVXEyid6j6DqeqMtm1ckfjK&limit=5&rating=g"));
    if (response.statusCode == 200) {
      print(response.body);
    } else {
      throw Exception("Fallo la conexion");
    }
    throw "Conexion exitosa";
  }

  @override
  void initState() {
    super.initState();
    _tenerGifs();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Material App Bar'),
        ),
        body: Center(
          child: Container(
            child: Text('Hello World'),
          ),
        ),
      ),
    );
  }
}
