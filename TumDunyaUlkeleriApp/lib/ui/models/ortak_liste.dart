import 'package:bootcampapidenvericekme/data/entity/country_model.dart';
import 'package:bootcampapidenvericekme/ui/models/ulke_detay.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OrtakListe extends StatefulWidget {
    List<Ulke> ulkeler = [];

    List<String> ulkeKodlari = [];

   OrtakListe({super.key,required this.ulkeler,required this.ulkeKodlari});

  @override
  State<OrtakListe> createState() => _OrtakListeState();
}

class _OrtakListeState extends State<OrtakListe> {
  @override
  Widget build(BuildContext context) {
    return  buildListView();
  }

  ListView buildListView() {
    return ListView.builder(itemCount: widget.ulkeler.length,itemBuilder: (BuildContext context,int index){

      var oAnkiUlke = widget.ulkeler[index];
      return Card(
        color: Colors.white,

        child: ListTile(
          onTap: (){
            ulkeTiklandi(context,oAnkiUlke);
          },

          trailing: IconButton(
            icon: Icon(
              widget.ulkeKodlari.contains(oAnkiUlke.ulkeKodu)
                  ? Icons.favorite
                  : Icons.favorite_border,
              color: Colors.red,

            ),
            onPressed: (){
              _favoriTiklandi(oAnkiUlke);
            },
          ),
          title: Text(oAnkiUlke.isim),
          leading: CircleAvatar(backgroundImage:NetworkImage(oAnkiUlke.bayrak)),
          subtitle: Text("Başkent: ${oAnkiUlke.baskent}"),
        ),
      );

    }
    );
  }


  void _favoriTiklandi(Ulke ulke) async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if(widget.ulkeKodlari.contains(ulke.ulkeKodu)){
      widget.ulkeKodlari.remove(ulke.ulkeKodu);
    }
    else{
      widget.ulkeKodlari.add(ulke.ulkeKodu);
    }
    await prefs.setStringList("favoriler", widget.ulkeKodlari);
    setState(() {

    });
  }
  void ulkeTiklandi(BuildContext context,Ulke ulke){
    MaterialPageRoute sayfaYolu = MaterialPageRoute(builder: (context){
      return UlkeDetaylari(ulke: ulke);
    });
    Navigator.push(context, sayfaYolu);
  }

}
