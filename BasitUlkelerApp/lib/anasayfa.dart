import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:jsonsondeneme/ilce.dart';
import 'package:jsonsondeneme/sehir.dart';
import 'package:jsonsondeneme/ulke.dart';

class AnaSayfa extends StatefulWidget {
  const AnaSayfa({super.key});

  @override
  State<AnaSayfa> createState() => _AnaSayfaState();
}

class _AnaSayfaState extends State<AnaSayfa> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _jjsonCozumle();
    });
  }

  List<Ulke> ulkelerListesi = [];

  List<Sehir> tumSehirler = [];

  List<Ilce> tumIlceler = [];

  Widget _listeOgesiniOlustur(BuildContext context, int index) {
    return Card(
      child: ExpansionTile(
        title: Text(
          ulkelerListesi[index].ulkeAdi,
          style: const TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
        leading: const Icon(
          Icons.flag,
          size: 30,
        ),
        children: ulkelerListesi[index].sehirler.map((sehir) {
          return ListTile(
            title: Text(
              sehir.sehirAdi,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            trailing: Text(
              sehir.plakaKodu,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
          );
        }).toList(),



      ),
    );



  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink.withOpacity(0.6),

        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.sports_volleyball_outlined,
              size: 30,
            ),
            const Text(
              "Dünya Ülkeleri",
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.pink.withOpacity(0.6),
              Colors.black,
              Colors.amber,
              Colors.red.withOpacity(0.8)
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: ListView.builder(
          itemBuilder: _listeOgesiniOlustur,
          itemCount: ulkelerListesi.length,
        ),
      ),
    );
  }








  void _jjsonCozumle() async {
    String jsonString = await rootBundle.loadString("assets/ulkeler.json");

    Map<String, dynamic> jsonMap = jsonDecode(jsonString);

    for (String countryKey in jsonMap['countries'].keys) {
      Map<String, dynamic> ulkelerMap = jsonMap['countries'][countryKey]['cities'];

      Ulke ulke = Ulke(countryKey, []);

      for (String sehirKey in ulkelerMap.keys) {
        Map<String, dynamic> sehirMap = ulkelerMap[sehirKey];

        String sehirAdi = sehirMap["name"];
        String plakaKodu = sehirKey;
        List<Ilce> ilceler = [];

        Map<String, dynamic> ilcelerMap = sehirMap["districts"];

        for (String ilceKey in ilcelerMap.keys) {
          Map<String, dynamic> ilceMap = ilcelerMap[ilceKey];

          String ilceAdi = ilceMap["name"];
          Ilce ilce = Ilce(ilceAdi);
          ilceler.add(ilce);
        }

        Sehir sehir = Sehir(sehirAdi, plakaKodu, ilceler);
        ulke.sehirler.add(sehir);
      }

      ulkelerListesi.add(ulke);
    }
    setState(() {

    });
  }




}
