import 'package:api_boss_ornek/data/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import 'ui/models/ana_sayfa.dart';

void main(){
  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
    designSize: Size(Constants.deviceWidth, Constants.deviceHeight),

        builder: (context,_) {
          return  MaterialApp(
            debugShowCheckedModeBanner: false,
              theme: ThemeData.dark(),
              home:  AnaSayfa()

          );
        }



    );
  }
}
