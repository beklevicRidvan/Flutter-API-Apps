import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class AnaSayfa extends StatefulWidget {
  const AnaSayfa({super.key});

  @override
  State<AnaSayfa> createState() => _AnaSayfaState();
}

class _AnaSayfaState extends State<AnaSayfa> {
  double _sonuc = 0.0;

  final String apiKey = "85d7a2b511a9ef5c98a8a3034d16c4e7";

  final String apiAdress =
      "http://api.exchangeratesapi.io/v1/latest?access_key=";

  final TextEditingController _controller = TextEditingController();

  Map<String, dynamic> oranlar = {};

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _verileriInternettenCek();
    });
  }


  String _secilenKur = "USD";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text(
          "Kur Dönüştürücü",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      onChanged: (String yeniDeger){
                        _hesapla();
                      },
                      controller: _controller,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 15),
                  DropdownButton(
                    items: oranlar.keys.map((kur) {
                      return DropdownMenuItem(
                        value: kur,
                        child: Text(kur),
                      );
                    }).toList(),
                    value: _secilenKur,
                    onChanged: (String? yeniDeger) {
                      if (yeniDeger != null) {
                        setState(() {

                          _secilenKur = yeniDeger;
                          _hesapla();
                        });
                      }
                    },
                    icon: const Icon(Icons.arrow_downward),
                    underline: const SizedBox(),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                 "${_sonuc.toStringAsFixed(2)} ₺",
                  style: const TextStyle(fontWeight: FontWeight.normal  , fontSize: 25),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Container(
                height: 2,
                color: Colors.black,
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child:
                    ListView.builder(
                        itemBuilder: _listeOgesiOlustur,
                        itemCount: oranlar.keys.length,
                    ),
              ),
            )
          ],
        ),
      ),
    );
  }


  Widget _listeOgesiOlustur(BuildContext buildContext,int index){
    return ListTile(
      title: Text(oranlar.keys.toList()[index],style: const TextStyle(fontSize: 20,fontWeight: FontWeight.normal),),
      trailing: Text(oranlar.values.toList()[index].toStringAsFixed(2),style: const TextStyle(fontSize: 20,fontWeight: FontWeight.normal),),
    );
  }



  void _verileriInternettenCek() async{
    Uri uri = Uri.parse(apiAdress + apiKey);
    http.Response  response = await http.get(uri);

    Map<String,dynamic>  parsedResponse = jsonDecode(response.body);

    Map<String,dynamic> rates = parsedResponse["rates"];

    double? baseTLKuru = rates["TRY"];

    if(baseTLKuru != null){
      for(String ulkeKuru in rates.keys){
        double? baseKur = double.tryParse(rates[ulkeKuru].toString());
        if(baseKur != null){
          double tlKuru = baseTLKuru/baseKur;

          oranlar[ulkeKuru]=tlKuru;
        }
      }
    }

    setState(() {

    });


  }



  /*

  {
    "success": true,
    "timestamp": 1519296206,
    "base": "EUR",
    "date": "2021-03-17",
    "rates": {
        "AUD": 1.566015,
        "CAD": 1.560132,
        "CHF": 1.154727,
        "CNY": 7.827874,
        "GBP": 0.882047,
        "JPY": 132.360679,
        "USD": 1.23396,
    [...]
    }
}
   */

  void _hesapla(){
    double? deger = double.tryParse(_controller.text);
    double? oran = oranlar[_secilenKur];

    if(deger != null && oran != null){
      setState(() {
        _sonuc = deger * oran;
      });
    }

  }
}
