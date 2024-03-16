import 'package:api_boss_ornek/data/constants/constants.dart';
import 'package:api_boss_ornek/data/services/rick_and_morty_api.dart';
import 'package:api_boss_ornek/ui/widgets/character_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../data/entity/rick_and_morty_data.dart';

class CharacterList extends StatefulWidget {
  const CharacterList({
    super.key,

  });



  @override
  State<CharacterList> createState() => _CharacterListState();
}

class _CharacterListState extends State<CharacterList> {
  late Future<List<RickAndMortyModels>> karakterListesi;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    karakterListesi = RMApi.getData();


  }


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: Constants.getPadding(),
      child: FutureBuilder<List<RickAndMortyModels>>(future: karakterListesi,builder: (context,snapshots){
        if(snapshots.hasData){
          var tumKarakterler = snapshots.data!;
          return GridView.builder(itemCount: tumKarakterler.length,
              gridDelegate:  SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: ScreenUtil().orientation == Orientation.portrait ? 1 : 3,
              ), itemBuilder: (context,index){
            var oAnkiKarakter = tumKarakterler[index];

            return CharacterItem(oAnkiKarakter: oAnkiKarakter);
          });

        }
        else if (snapshots.hasError){
          return  Center(child: Text(snapshots.error.toString(),style: Constants.defaultTextStyle(20),),);
        }
        else{
          return const Center(child: CircularProgressIndicator(color: Colors.white,strokeWidth: 5,),);
        }

      }
      ),
    );
  }
}

