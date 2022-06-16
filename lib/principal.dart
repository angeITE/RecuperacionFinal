import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recuperacion/infodeporte.dart';
import 'service.dart';

class Principal extends StatelessWidget {
  const Principal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final deportes = Provider.of<Deportesservice>(context);
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        title: const Text("Seleccione un deporte"),
      ),
      body: Center(
        child: ListView.builder(itemCount: deportes.listDepo[0].sports.length, 
        itemBuilder: (_, index) {
          final item = deportes.listDepo[0].sports[index];
          return Card(
            color: Colors.grey[400],
            child: ListTile(
              leading: Image.network(item.strSportIconGreen),
              title: Text(item.strSport),
              subtitle: Text(item.strSportDescription, overflow: TextOverflow.ellipsis, maxLines: 4,),
              onTap: () {
                Route route = MaterialPageRoute(builder: (_) => InfoDeporte(index: index,));
                Navigator.push(context, route);
              },
            ),
          );
        }
        ),
      ),
    );
  }
}