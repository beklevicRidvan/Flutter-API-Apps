import 'package:api_json_internetten_ornek/data/entity/character_models.dart';
import 'package:flutter/material.dart';

class KarakterDetay extends StatefulWidget {
  final MyCharacters karakter;
  final int myIndex;
  

  const KarakterDetay({super.key,required this.karakter,required this.myIndex});

  @override
  State<KarakterDetay> createState() => _KarakterDetayState();
}

class _KarakterDetayState extends State<KarakterDetay> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }


  Color myColor = const Color(0xFF5E8BA0);
  Color cardColor = const Color(0xFF4D4E48).withOpacity(0.2);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(toolbarHeight: 210,backgroundColor: Colors.transparent,flexibleSpace:
      const Image(
        image: AssetImage("assets/logo.jpg"),
        height: 200,
        fit: BoxFit.cover,

      ),
      ),
      backgroundColor: myColor,

      body:Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          height: 600,
          width: 500,
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [

                    Image.asset("assets/pop${widget.myIndex}.png",fit: BoxFit.contain,width: 120,)



                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text("Karakter Adı",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 20,fontFamily: "Vesper"),),
                    Text(widget.karakter.karakterAdi,style: const TextStyle(color: Colors.grey,fontSize: 17,fontFamily: "Vesper"),),

                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text("Şehir",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 20,fontFamily: "Vesper"),),
                    Text(widget.karakter.sehir,style: const TextStyle(color: Colors.grey,fontSize: 17,fontFamily: "Vesper"),),

                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text("Tür",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 20,fontFamily: "Vesper"),),
                    Text(widget.karakter.tur,style: const TextStyle(color: Colors.grey,fontSize: 17,fontFamily: "Vesper"),),

                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text("Yetenekler",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 20,fontFamily: "Vesper"),),
                    Text(yetenekAdlariniGetir(),style: const TextStyle(color: Colors.grey,fontSize: 15,fontFamily: "Vesper"),),


                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text("Savunma",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 20,fontFamily: "Vesper"),),
                    savunmaGetir(),

                  ],
                ),



              ],
            ),
          ),
          // Container içeriği buraya eklenebilir
        ),
      ),



    );
  }

  String yetenekAdlariniGetir(){
      var degisken="";
      for (var eleman in widget.karakter.yetenekler){
        degisken = "$degisken${eleman.yetenekAdi} ";
      }
      return degisken;


  }

  Widget savunmaGetir(){
      for (int i=0;i<widget.karakter.yetenekler.length;){
        if(widget.karakter.yetenekler[i].savunma == true){
          return const Text("Var",style: TextStyle(color: Colors.grey,fontSize: 17,fontFamily: "Vesper"),);

  }
        else{
    return const Text("Yok",style: TextStyle(color: Colors.grey,fontSize: 17,fontFamily: "Vesper"));


    }

      }
    return const Text("");
  }
}
