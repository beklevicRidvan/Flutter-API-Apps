
import 'package:api_boss_ornek/data/entity/rick_and_morty_data.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class RMApi{
  static String _url = "https://rickandmortyapi.com/api/character/";

  static Future<List<RickAndMortyModels>> getData() async{

      List<RickAndMortyModels> rmList=[];

      var response = await Dio().get(_url);

      if(response.statusCode == 200){

        Map<String, dynamic> jsonData = response.data;

        var results = jsonData["results"];

        print(results);

        if(results is List){
          rmList = results.map((e) => RickAndMortyModels.fromJson(e)).toList();

        }

      }
      else{
        debugPrint("Hata Oluştu");
      }

      return rmList;

  }


}