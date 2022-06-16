import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recuperacion/service.dart';

class MostrarCiudades extends StatelessWidget {
  const MostrarCiudades({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ciudad = Provider.of<Deportesservice>(context);
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(title: Text("Paises participantes"),centerTitle: true,backgroundColor: Colors.blueGrey,),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(8),
          child: ListView.builder(itemCount: ciudad.listCiudad[0].countries.length, itemBuilder: (_, index) {
          return Card(
            color: Colors.blue[300],
            child: ListTile(
              title: Text(ciudad.listCiudad[0].countries[index].nameEn,textAlign: TextAlign.center,),
              ),
          );
          })
        ),
      ),
    );
  }
}
