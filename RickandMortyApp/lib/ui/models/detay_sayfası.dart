import 'package:api_boss_ornek/data/constants/constants.dart';
import 'package:api_boss_ornek/data/entity/rick_and_morty_data.dart';
import 'package:api_boss_ornek/ui/widgets/detail_information_row.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DetailPage extends StatefulWidget {
  final RickAndMortyModels rickAndMortyModels;
  const DetailPage({super.key,required this.rickAndMortyModels});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildDetailAppBar(),


      body: ScreenUtil().orientation == Orientation.portrait ? buildVerticalBody():buildHorizontalBody(),
    );
  }

  SafeArea buildHorizontalBody(){
    return SafeArea(child: Row(


      children: [
        Expanded(flex: 3,child: Column(
          children: [
            Hero(tag: widget.rickAndMortyModels.id ?? 0,child: ClipRRect(borderRadius: BorderRadius.circular(5),child: CachedNetworkImage(imageUrl: widget.rickAndMortyModels.image ?? "",width: 130.w,fit: BoxFit.fitWidth,))),
            SizedBox(height:0.01.sw ),
            Text(widget.rickAndMortyModels.name ?? "Unkown",style: Constants.defaultTextStyle(40),)
          ],
        ),
        ),
        Expanded(flex: 5,child:
        Padding(
          padding: Constants.getDetailRowPadding(),
          child: Container(decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),color: Colors.white),child:
          InformationRow(rickAndMortyModels: widget.rickAndMortyModels),
          ),
        ) )

      ],
    ));
  }

  SafeArea buildVerticalBody() {
    return SafeArea(
      child: Container(

        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Hero(tag: widget.rickAndMortyModels.id ?? 0,child: ClipRRect(borderRadius: BorderRadius.circular(5),child: CachedNetworkImage(imageUrl: widget.rickAndMortyModels.image ?? "",width: 0.2.sh,))),



              ],
            ),
            Expanded(child:

            Container(decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),color: Colors.white),margin:const EdgeInsets.only(top: 15),child:
            InformationRow(rickAndMortyModels: widget.rickAndMortyModels),
            )
            ),



          ],
        ),
      ),
    );
  }
  AppBar buildDetailAppBar(){
    return AppBar(
      centerTitle: ScreenUtil().orientation == Orientation.portrait ? true : false,
      toolbarHeight:ScreenUtil().orientation == Orientation.portrait ? 0.08.sh : 0.09.sw,
      backgroundColor: Colors.transparent,
      title: Text(widget.rickAndMortyModels.name ?? "Unkown",style: Constants.responsiveText(50),),
    );
  }
  
}

