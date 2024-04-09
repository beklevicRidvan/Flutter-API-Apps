import 'package:dio/dio.dart';

import '../model/pharmacy_model.dart';

class DatabaseRepository{



  Future<List<PharmacyModel>> getEczaneData(String il, String ilce) async {
    List<PharmacyModel> pharmacies = [];
    final String url = "https://api.collectapi.com/health/dutyPharmacy?ilce=$ilce&il=$il";
    const Map<String, dynamic> headers = {
      "authorization": "apikey 2Vf7L5BMgVmXLYvNdXblMC:1Yg7hh7UjZ7OtygVQWd6mf",
      "content-type": "application/json"
    };

    final dio = Dio();
    final response = await dio.get(url, options: Options(headers: headers));

    if (response.statusCode != 200) {
      return Future.error("Bir sorun oluştu...");
    }

    final List list = response.data["result"];
    pharmacies = list.map((e) => PharmacyModel.fromJson(e)).toList();
    return pharmacies;
    }
}