import 'package:bootcampapidenvericekme/data/entity/country_model.dart';
import 'package:flutter/material.dart';

class UlkeDetaylari extends StatefulWidget {
  final Ulke ulke;
  const UlkeDetaylari({super.key,required this.ulke});

  @override
  State<UlkeDetaylari> createState() => _UlkeDetaylariState();
}

class _UlkeDetaylariState extends State<UlkeDetaylari> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(title: Text(widget.ulke.isim,style: const TextStyle(color: Colors.white)),centerTitle: true,backgroundColor: Colors.blue),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,

              children: [
                Image.network(widget.ulke.bayrak,)
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [

                Text(widget.ulke.isim,style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 30),)
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
               const  Text("Ülke İsmi:",style: TextStyle(fontWeight: FontWeight.bold),),
                Text(widget.ulke.isim)
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const  Text("Başkent:",style: TextStyle(fontWeight: FontWeight.bold),),
                Text(widget.ulke.baskent)
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const Text("Bölge:",style: TextStyle(fontWeight: FontWeight.bold),),
                Text(widget.ulke.bolge)
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const  Text("Nüfus:",style: TextStyle(fontWeight: FontWeight.bold),),
                Text(widget.ulke.nufus.toString())
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const  Text("Dil:",style: TextStyle(fontWeight: FontWeight.bold),),
                Text(widget.ulke.dil)
              ],
            ),
          ],
        ),
      ),
    );
  }
}
