import 'package:flutter/material.dart';

import '../model/pharmacy_model.dart';
import '../repository/database_repository.dart';
import '../view/pharmacydetail_page_view.dart';

class PharmachyPageViewModel with ChangeNotifier{
  List<PharmacyModel> _pharmacies = [];
  final _repo = DatabaseRepository();

  PharmachyPageViewModel({required String il,required String ilce}){
    WidgetsBinding.instance.addPostFrameCallback((_) {
      getData(il: il, ilce: ilce);
    });
  }

  void getData({required String il, required String ilce}) async {
    _pharmacies = await _repo.getEczaneData(il, ilce);
    notifyListeners();
  }

  void goDetailPage(BuildContext context,PharmacyModel pharmacyModel){
    MaterialPageRoute pageRoute = MaterialPageRoute(builder: (context) => PharmacyDetailPageView(pharmacyModel: pharmacyModel),);
    Navigator.push(context, pageRoute);
  }

  List<PharmacyModel> get pharmacies => _pharmacies;





}