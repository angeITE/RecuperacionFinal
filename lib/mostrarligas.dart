import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'modelos/ligas.dart';
import 'service.dart';

class MostrarLigas extends StatelessWidget {
  MostrarLigas({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ciudad = Provider.of<Deportesservice>(context);
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(title: Text("Ligas vigentes",),backgroundColor: Colors.blueGrey,),
      body: Center(
        child: ListView.builder(itemCount: ciudad.lisLigas[0].leagues.length, itemBuilder: (_,index) {
          return Card(
            color: Colors.blue[400],
            child: ListTile(
              title: Text(ciudad.lisLigas[0].leagues[index].strLeague.toString()),
            ),
          );
        }),
      ),
    );
  }
}