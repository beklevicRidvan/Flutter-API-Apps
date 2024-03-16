import 'dart:convert';

import 'package:api_json_internetten_ornek/data/entity/character_models.dart';
import 'package:api_json_internetten_ornek/ui/views/karakter_detay.dart';
import 'package:flutter/material.dart';
class KarakterBilglileri extends StatefulWidget {
  const KarakterBilglileri({super.key});

  @override
  State<KarakterBilglileri> createState() => _KarakterBilglileriState();
}

class _KarakterBilglileriState extends State<KarakterBilglileri> {

  late Future<List<MyCharacters>> karakterlerListesi ;

  Color myColor = const Color(0xFF5E8BA0);
  Color cardColor = const Color(0xFF4D4E48).withOpacity(0.2);
  double? myFontSize = 25;


  Future<List<MyCharacters>> _karakterleriYukle() async {
    try{
      await Future.delayed(const Duration(seconds: 2));
      String okunanJson = await DefaultAssetBundle.of(context).loadString("assets/data/witcher.json");

      var jsonArray = jsonDecode(okunanJson);

      List<MyCharacters> tumKarakterler = (jsonArray as List)
          .map((karakterMap) =>  MyCharacters.fromMap(karakterMap))
          .toList();

      return tumKarakterler;

    }
    catch(e){
      return Future.error(e.toString());
    }
}

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    karakterlerListesi = _karakterleriYukle();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: myColor,
      appBar: AppBar(toolbarHeight: 100,automaticallyImplyLeading: false,backgroundColor: Colors.transparent,title: const Text("Witcher 3 Rehberi",style: TextStyle(color: Colors.white),),actions: [
        Image.asset("assets/logo.jpg",fit: BoxFit.cover,width: 160,),
      ],),

      body: FutureBuilder<List<MyCharacters>>(future: karakterlerListesi,
      builder: (context,snapshot){
        if(snapshot.hasData){
          List<MyCharacters> karakterListesi = snapshot.data!;
          return GridView.builder(itemCount: karakterListesi.length,gridDelegate:const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 1), itemBuilder: (BuildContext context,int index){
            var secilenKarakter = karakterListesi[index];
            return GestureDetector(
              onTap: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => KarakterDetay(karakter: secilenKarakter,myIndex: index,)),
                );


              },
              child: Card(


                shadowColor: Colors.black,
                elevation: 15,
                margin: const EdgeInsets.all(10),
                color: cardColor,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child:  ClipRRect(borderRadius: BorderRadius.circular(15),child: Image.asset("assets/witcher$index.jpg",fit: BoxFit.cover,width: 500,height: 300,)),
                    ),
                    Text(secilenKarakter.karakterAdi,style: TextStyle(fontFamily: "Vesper",fontWeight: FontWeight.bold,fontSize: myFontSize,color: Colors.white),),
                  ],
                ),
              ),
            );
          });
        }
        else if(snapshot.hasError){
          return Center(child: Text(snapshot.hasError.toString()),);
        }
        else{
          return const Center(child: CircularProgressIndicator(
            color: Colors.white,
            strokeAlign: 5,
          ));
        }

      },
      ),

    );
  }
}
