

import 'package:dio/dio.dart';

import '../entity/hava_durumu_model.dart';

class HavaDururumuDaoRepository{



   static String _apiKey = "3ddfe642c6bc4a3cbe836a961946b7c4";


  static Future<List<HavaDurumuModel>> havaDurumlariniGetir(String arananSehir) async {
    List<HavaDurumuModel> havaDurumlari = [];
    try {
      String url = "https://api.weatherbit.io/v2.0/current?country=TR&city=$arananSehir&key=$_apiKey";

      var response = await Dio().get(url);

      if (response.statusCode == 200) {
        Map<String,dynamic> jsonData = response.data;

        var results = jsonData["data"];
        print(results);

        if(results is List){
          havaDurumlari = results.map((e) => HavaDurumuModel.fromJson(e)).toList();
        }


        return havaDurumlari;
      } else {
        throw Exception('Hava durumu verileri alınamadı. Durum kodu: ${response.statusCode}');
      }
    } on Exception catch (e) {
      return Future.error(e.toString());
    }
  }






/*
  _futureBuilderVerse(){
     FutureBuilder<List<HavaDurumuModel>>(future: havaListesi, builder: (context,snapshots){
        if(snapshots.hasData){
          List<HavaDurumuModel> bilgiler = snapshots.data!;
          return GridView.builder(itemCount: bilgiler.length,gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 1), itemBuilder: (context,index){
            var currentElement = bilgiler[index];
            return Card(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Center(
                        child: Text(
                          currentElement.cityName,
                          style:
                          const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 30),
                        )),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Center(
                        child: Text(
                          "Son Güncelleme: ${currentElement.datetime}",
                          style: TextStyle(
                              fontWeight: FontWeight.w500, fontSize: 20),
                        )),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Center(
                        child: FlutterLogo(
                          size: 144,
                        )),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text(
                              "Maximum: ${currentElement.temp}" + "°C",
                              style: TextStyle(fontSize: 20),
                            ),
                            Text(
                              "Minimum: ${currentElement.appTemp}" + "°C",
                              style: TextStyle(fontSize: 20),
                            ),
                          ],
                        )),
                  ),
                ],
              ),
            );
          });
        }
        else if(snapshots.hasError){
          return  Center(child: Text(snapshots.error.toString()),);
        }
        else{
          return const Center( child:  CircularProgressIndicator(color: Colors.blue,),);
        }
      }

      ),
  }

 */


}