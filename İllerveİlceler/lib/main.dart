import 'package:flutter/material.dart';
import 'package:iller_ilceler/ana_sayfa.dart';

void main(){
  runApp(MyApp());
}


class MyApp extends StatelessWidget{

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      home: AnaSayfa(),

    );
  }
}