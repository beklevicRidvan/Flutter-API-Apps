import 'package:api_boss_ornek/data/constants/constants.dart';
import 'package:api_boss_ornek/data/entity/rick_and_morty_data.dart';
import 'package:api_boss_ornek/ui/models/detay_sayfas%C4%B1.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CharacterItem extends StatelessWidget {
  const CharacterItem({
    super.key,
    required this.oAnkiKarakter,
  });

  final RickAndMortyModels oAnkiKarakter;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.push(context, CupertinoPageRoute(builder: (context)=>DetailPage(rickAndMortyModels:oAnkiKarakter)));
      },
      child: Container(
        margin: Constants.getMargin(),
        child: Card(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.w)),
          shadowColor: Colors.white,
          elevation: 5,
          child: Padding(
            padding: Constants.getPadding(),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Align(alignment: ScreenUtil().orientation == Orientation.portrait ? Alignment.topLeft : Alignment.topCenter,child: Chip(padding:Constants.chipPaddingBelirle(10) ,label: Text(oAnkiKarakter.status ?? "",style: Constants.chipTextStyle(20),),backgroundColor: Constants.chipRengiBelirle(oAnkiKarakter.status ?? ""))),

                ClipRRect(borderRadius: BorderRadius.circular(15),child: Hero(tag: oAnkiKarakter.id ?? 0,child: CachedNetworkImage(fit: BoxFit.fitWidth,width: 0.3.sh,imageUrl: oAnkiKarakter.image ?? ""))),
                Text(oAnkiKarakter.name ?? "Unkown",style: Constants.responsiveText(25),),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
