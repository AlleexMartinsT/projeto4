import 'package:flutter/material.dart';
import 'amadeus.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Busca Hotel',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final Amadeus amadeus = Amadeus();

  @override
  void initState() {
    super.initState();
    amadeus.getHotelOffers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Busca Hotel'),
      ),
      body: Center(
        child: Text('Ainda não tem hoteis, mas não desanime :)'),
      ),
    );
  }
}
