import 'package:bloc_pattern_providerpackage_katmanlimimari_uygulamasi/data/repo/hava_durumu_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/entity/hava_durumu_model.dart';

class WeatherAppCubit extends  Cubit<List<HavaDurumuModel>>{
  WeatherAppCubit():super(<HavaDurumuModel>[]);


  Future<void> listeyiYukle(String arananSehir) async{
    var liste = await HavaDururumuDaoRepository.havaDurumlariniGetir(arananSehir);
    emit(liste);
  }
}