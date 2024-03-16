import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:iller_ilceler/ilce.dart';

import 'il.dart';
class AnaSayfa  extends StatefulWidget {
  @override
  State<AnaSayfa> createState() => _AnaSayfaState();
}

class _AnaSayfaState extends State<AnaSayfa> {
List<Il> iller =[];

List<Ilce> tumIlceler = [];

void initState(){
  super.initState();
  WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
    _jsonCozumle();
  });
}



Widget _listeOgesiniOlustur(BuildContext context, int index){
  return ListTile(
    title: Text(iller[index].ilIsmi),
    leading: Icon(Icons.location_city),
    trailing: Text(iller[index].plakaKodu),
  );
}


Widget _ilceOgesiniOlustur(BuildContext context,int index){
  return ListTile(
    title: Text(tumIlceler[index].ilceIsmi),
    leading: Icon(Icons.home_filled),
    trailing: Text(tumIlceler[index].ilceKodu),
  );
}



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor:Colors.blue,title: Text("İller ve İlçeler",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold,color: Colors.white),),centerTitle: true,),
      body:ListView.builder(itemBuilder: _ilceOgesiniOlustur,itemCount: iller.length,)
      
    );
  }





  void _jsonCozumle() async{
      String jsonString = await rootBundle.loadString("assets/iller_ilceler.json");

      Map<String,dynamic> illerMap = jsonDecode(jsonString);


      for(String plakaKodu in illerMap.keys){

        Map<String,dynamic> ilMap = illerMap[plakaKodu];

        String ilIsmi = ilMap["name"];

        Map<String,dynamic> ilcelerMap = ilMap["districts"];



        for(String ilceKodu in ilcelerMap.keys){
          Map<String,dynamic> ilceMap = ilcelerMap[ilceKodu];

          String ilceIsmi = ilceMap["name"];

          Ilce ilce = Ilce(ilceIsmi,ilceKodu);
          tumIlceler.add(ilce);

        }
        Il il = Il(ilIsmi,plakaKodu,tumIlceler);
        iller.add(il);
      }
      setState(() {

      });

  }


  
}
