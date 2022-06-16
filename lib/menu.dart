import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recuperacion/mostrarciudades.dart';
import 'package:recuperacion/principal.dart';

import 'mostrarligas.dart';
import 'service.dart';

class Menu extends StatelessWidget {
  const Menu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final deportes = Provider.of<Deportesservice>(context);
        if(deportes.listDepo.isEmpty && deportes.listCiudad.isEmpty){
      return Container(
        color: Colors.redAccent[400],
        child: Center(
          child: CircularProgressIndicator(color: Colors.yellowAccent[400],)
        ),
      );
    }
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(title: const Text("Seleccione una opcion"),centerTitle: true,backgroundColor: Colors.blueGrey,),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(8),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Card(
                  color: Colors.blue,
                  child: ListTile(
                    title: Image.network(deportes.listDepo[0].sports[0].strSportThumb),
                    subtitle: const Text("Aqui podras ver el catalogo de deportes disponibles."),
                    onTap: () {
                      Route route = MaterialPageRoute(builder: (_) => const Principal());
                      Navigator.push(context, route);
                    },
                  ),
                ),
                Card(
                  color: Colors.cyan,
                  child: ListTile(
                    title: Image.network('https://quizizz.com/media/resource/gs/quizizz-media/quizzes/1da3a40f-6efb-4a92-bd3d-9491e114244b?w=200&h=200'),
                    subtitle: const Text("Esta opcion es para ver los paises contemplados"),
                    onTap: () {
                    Route routes = MaterialPageRoute(builder: (_) => const MostrarCiudades());
                    Navigator.push(context, routes);
                    }
                  ),
                ),
                Card(
                  child: ListTile(
                    title: Image.network('https://www.atletasla.com/wp-content/uploads/2018/06/Captura-de-pantalla-2018-06-24-a-las-8.57.29-p.m..png'),
                    subtitle: const Text("Esta opcion es para ver las ligas vigentes"),
                    onTap: () {
                  Route routes = MaterialPageRoute(builder: (_) => MostrarLigas());
                  Navigator.push(context, routes);
                  },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}