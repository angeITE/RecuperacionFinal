import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recuperacion/service.dart';

class InfoDeporte extends StatelessWidget {
  final int index;
  const InfoDeporte({Key? key, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final deporte = Provider.of<Deportesservice>(context);
    final item = deporte.listDepo[0].sports[index];
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(title: Text(item.strSport),centerTitle: true,backgroundColor: Colors.blueGrey,),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Center(
          child: Column(
            children: [
              Image.network(item.strSportThumb,),
              const SizedBox(
                height: 10,
              ),
              Container(height: 2, color: Colors.yellow,),
              SizedBox(
                height: 180,
                width: double.maxFinite,
                child: SingleChildScrollView(
                  child: Text(item.strSportDescription),
                ),
              ), 
              Container(height: 2, color: Colors.yellow,),
              ListTile(
                title: const Text("Formato del deporte: "),
                subtitle: Text(item.strFormat.toString().substring(10)),
              )
            ],
          ),
        ),
      )
    );
  }
}