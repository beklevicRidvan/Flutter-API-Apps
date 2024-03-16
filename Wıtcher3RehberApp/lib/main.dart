import 'package:api_json_internetten_ornek/ui/views/karakter_bilgileri.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main(){

  runApp(MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      home: AnaSayfa(),

    );
  }
}



class AnaSayfa extends StatelessWidget {
  const AnaSayfa({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(

      body: Stack(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height:MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
              image: DecorationImage(image: NetworkImage("https://i.redd.it/c74vx4r9anx81.jpg"),fit: BoxFit.cover)
            ),
          ),
          Positioned(bottom: 0,top: 360,right: 0,left: 0,child: TextButton(onPressed: (){
            Navigator.push(context, CupertinoPageRoute(builder: (context)=> const KarakterBilglileri()));
          } ,child: const Text("Karakter Bilgileri",style: TextStyle(color: Colors.white,fontSize: 30),),)),


        ],
      ),
    );
  }
}



