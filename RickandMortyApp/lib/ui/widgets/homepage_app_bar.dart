import 'package:api_boss_ornek/data/constants/constants.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class MyAppBar extends StatelessWidget {
  const MyAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding:  Constants.getPadding(),
            child: CachedNetworkImage(imageUrl:Constants.ramLogo,width: Constants.logoBoyutuAyarla(300),fit: BoxFit.contain,),
          ),
        ],
      ),
    );
  }
}
