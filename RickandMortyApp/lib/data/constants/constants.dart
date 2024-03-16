import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Constants{
  static double deviceWidth = 412;
  static double deviceHeight = 892;
  static String ramLogo = "https://res.cloudinary.com/dkfzj9tmk/image/upload/v1677166689/backend-project/Rick-And-Morty-Logo-Transparent-File_arpmel.png";
  static Color defaultTextColor = Colors.white;
  static Color ramTextColor =const Color(0xff00BFA5);


  static EdgeInsets getPadding(){
    if(ScreenUtil().orientation == Orientation.portrait){
      return EdgeInsets.all(10.h);
    }
    else{
      return EdgeInsets.all(8.w);
    }


  }


  static EdgeInsets getMargin() {
    if (ScreenUtil().orientation == Orientation.portrait) {
      return EdgeInsets.only(bottom:10.h,right: 8.h);
    }
    else {
      return EdgeInsets.only(top :5.w, right: 5.w);
    }
  }
  static EdgeInsets getDetailPadding() {
    if (ScreenUtil().orientation == Orientation.portrait) {
      return EdgeInsets.symmetric(horizontal: 30.h);
    }
    else {
      return EdgeInsets.symmetric(horizontal: 20.w);
    }
  }
  static EdgeInsets getDetailRowPadding() {
    if (ScreenUtil().orientation == Orientation.portrait) {
      return EdgeInsets.symmetric(horizontal: 30.h);
    }
    else {
      return EdgeInsets.only(left: 20.w,right: 20.w,bottom: 10.w);
    }
  }



  static double calculateFontSize(double size){
    if(ScreenUtil().orientation==Orientation.portrait){
      return size.sp;
    }
    else{
      return (size*0.3).sp;
    }
  }


  static final Map<String,Color> _colorListesi = {
    'Dead':Colors.redAccent,
    'Alive':Colors.greenAccent,
    'unkown':Colors.black12,

  };



  static Color chipRengiBelirle(String anahtar){
    if(_colorListesi.containsKey(anahtar)){
      return _colorListesi[anahtar] ?? Colors.blue;
    }
    else{
      return  Colors.blue;
    }

  }
  static TextStyle chipTextStyle(double size){
    return TextStyle(
      fontSize:ScreenUtil().orientation==Orientation.portrait ? calculateFontSize(size) : calculateFontSize(size*1.5),
      color: Colors.black,
    );
  }





  static TextStyle defaultTextStyle(double size){
    return TextStyle(
      fontSize: calculateFontSize(size),
      color: defaultTextColor,

    );
  }
  static TextStyle detailKeyTextStyle(double size){
    return TextStyle(
      fontSize: calculateFontSize(size),
        color: Colors.black,
      fontWeight: FontWeight.bold

    );
  }

  static TextStyle detailValueTextStyle(double size){
    return TextStyle(
      fontSize: calculateFontSize(size),
      color: Colors.black,

      fontFamily: "Rick",
    );
  }


  static TextStyle rickAndMortyTextStyle(double size){
    return TextStyle(
      fontSize: calculateFontSize(size),
      color: ramTextColor,
      fontFamily: "Rick",
    );
  }
  static TextStyle responsiveDetailText(double size){
    return ScreenUtil().orientation==Orientation.portrait ? detailKeyTextStyle(size) : detailKeyTextStyle(size*1.5);
  }



  static TextStyle responsiveText(double size){
    return ScreenUtil().orientation==Orientation.portrait ? rickAndMortyTextStyle(size) : defaultTextStyle(size);
  }


  static double logoBoyutuAyarla(double size) {
    if(ScreenUtil().orientation==Orientation.portrait){
      return size.w;
    }
    else{
      return (size*3).h;
    }
  }

  static EdgeInsets chipPaddingBelirle(double size){
    if(ScreenUtil().orientation == Orientation.portrait){
      return  EdgeInsets.symmetric(horizontal: size);
    }
    else{
      return  EdgeInsets.symmetric(horizontal: size*4.5);

    }
  }


}