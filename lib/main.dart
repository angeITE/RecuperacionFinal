import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recuperacion/menu.dart';
import 'principal.dart';
import 'service.dart';

void main() => runApp(const AppState());

class AppState extends StatelessWidget{
  const AppState({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context){
    return MultiProvider(providers: [
    ChangeNotifierProvider(create: (_) => Deportesservice()),
    ],
    child: const MyApp(),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'REST-API',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Menu(),
    );
  }
}
