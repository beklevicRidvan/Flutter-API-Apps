import 'dart:convert';

import 'package:bootcampapidenvericekme/ui/models/favori_sayfasi.dart';
import 'package:bootcampapidenvericekme/ui/models/ortak_liste.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../../data/entity/country_model.dart';

class AnaSayfa extends StatefulWidget {
  const AnaSayfa({super.key});

  @override
  State<AnaSayfa> createState() => _AnaSayfaState();
}

class _AnaSayfaState extends State<AnaSayfa> {

  final String _apiUrl= 'https://restcountries.com/v3.1/all?fields=name,flags,cca2,capital,region,languages,population';


  late final List<Ulke> _butunUlkeler = [];

  late final List<String> ulkeKodlari = [];



  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      favorileriHafizadanCek().then((value) {
      ulkeVerileriniGetir();

      } );
    }

    );
  }

  void ulkeVerileriniGetir() async {


    await Future.delayed(const Duration(seconds: 2));

    Uri uri = Uri.parse(_apiUrl);
    http.Response response = await http.get(uri);

    List<dynamic> parsedResponse = jsonDecode(response.body);


    for(int i=0;i<parsedResponse.length;i++){
      Map<String,dynamic> ulkeMap = parsedResponse[i];
      Ulke ulke = Ulke.fromMap(ulkeMap);
      _butunUlkeler.add(ulke);

    }
    setState(() {

    });

  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Tum Ulkeler",style: TextStyle(color: Colors.white),),backgroundColor: Colors.blue,centerTitle: true,actions: [IconButton(padding: const EdgeInsets.symmetric(horizontal: 40),onPressed: (){
        Navigator.push(context, MaterialPageRoute(builder: (context)=>Favoriler(favoriUlkeKodlari: ulkeKodlari, tumUlkeler: _butunUlkeler)));

      },
          icon: const Icon(Icons.favorite,size: 30,color: Colors.red,))]),
      body: _butunUlkeler.isEmpty ? const Center(child: CircularProgressIndicator(color: Colors.white,strokeWidth: 5,))
          :OrtakListe(ulkeler: _butunUlkeler, ulkeKodlari: ulkeKodlari),
    );
  }





  Future<void> favorileriHafizadanCek ()async{
    SharedPreferences prefs = await SharedPreferences.getInstance();

    List<String>? favoriler = prefs.getStringList("favoriler");

    if(favoriler != null){
      for(String ulkeKodu in favoriler){
        ulkeKodlari.add(ulkeKodu);
      }
    }



  }



}
