import 'package:bootcampapidenvericekme/data/entity/country_model.dart';
import 'package:bootcampapidenvericekme/ui/models/ortak_liste.dart';
import 'package:bootcampapidenvericekme/ui/models/ulke_detay.dart';
import 'package:flutter/material.dart';

class Favoriler extends StatefulWidget {
  final List<String> favoriUlkeKodlari;
  final List<Ulke> tumUlkeler;
  const Favoriler({super.key,required this.favoriUlkeKodlari,required this.tumUlkeler});


  @override
  State<Favoriler> createState() => _FavorilerState();


}

class _FavorilerState extends State<Favoriler> {
  
  final List<Ulke> favoriUlkeler=[];


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    for(Ulke ulke in widget.tumUlkeler){
      if(widget.favoriUlkeKodlari.contains(ulke.ulkeKodu)){
        favoriUlkeler.add(ulke);

      }
    }
  }


  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(leading: IconButton(onPressed: (){

        setState(() {
          Navigator.pop(context);
        });
      },icon: const Icon(Icons.arrow_back_ios,color: Colors.white,),iconSize: 25,),actionsIconTheme: const IconThemeData(color: Colors.white,size: 30),backgroundColor: Colors.blue,title: const Text("Favoriler",style: TextStyle(color: Colors.white)),centerTitle: true,),

      body: favoriUlkeler.isNotEmpty ? OrtakListe(ulkeler: favoriUlkeler, ulkeKodlari: widget.favoriUlkeKodlari) : const Center(child: Text("Favori Ülkeniz Bulunumuyor",style: TextStyle(fontSize: 30),),)
    );


  }

  Card buildCard(BuildContext context, Ulke oAnkiUlke) {
    return Card(

        child: ListTile(
          onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>UlkeDetaylari(ulke: oAnkiUlke)));

          },
          trailing: const Icon(Icons.favorite,color: Colors.red,),
          title: Text(oAnkiUlke.isim),
          leading: CircleAvatar(backgroundImage:NetworkImage(oAnkiUlke.bayrak)),
          subtitle: Text("Başkent: ${oAnkiUlke.baskent}"),

        ),
      );
  }
}
