import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:recuperacion/modelos/ciudades.dart';
import 'package:recuperacion/modelos/ligas.dart';

import 'modelos/deportes.dart';

class Deportesservice extends ChangeNotifier {
  final deporteUrl = 'thesportsdb.com';
  List<Deportes> listDepo = [];
  List<Ligas> lisLigas = [];
  List<Ciudades> listCiudad = [];

  Deportesservice(){
    getDeporte();
    getCiudad();
    getCiudades();
  }
  getDeporte() async{
    final url = Uri.https(deporteUrl, 'api/v1/json/2/all_sports.php');
    final response = await http.get(url);
    final resDepo = Deportes.fromJson(response.body);
    listDepo.add(resDepo);
    notifyListeners();
  }

  getCiudad() async {
    final url = Uri.https(deporteUrl, 'api/v1/json/2/all_countries.php');
    final response = await http.get(url);
    final resCiudad = Ciudades.fromJson(response.body);
    listCiudad.add(resCiudad);
    notifyListeners();
  }

  getCiudades() async {
    final url = Uri.https(deporteUrl, 'api/v1/json/2/all_leagues.php');
    final response = await http.get(url);
    final resCiudad = Ligas.fromJson(response.body);
    lisLigas.add(resCiudad);
    notifyListeners();
   
  }
    
}