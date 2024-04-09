import 'package:flutter/material.dart';
import 'package:nobetci_eczane_api_provider/view_model/pharmacy_page_view_model.dart';
import 'package:provider/provider.dart';

import '../view/pharmacy_page_view.dart';

class HomePageViewModel with ChangeNotifier {


  late TextEditingController _cityController;
  late TextEditingController _countyController;


  HomePageViewModel() {
    _cityController = TextEditingController();
    _countyController = TextEditingController();
  }


  void goPharmacyPageView(BuildContext context){
    MaterialPageRoute pageRoute = MaterialPageRoute(builder: (context) {
      return ChangeNotifierProvider(create: (context) => PharmachyPageViewModel(il: _cityController.text,ilce: _countyController.text),child:  PharmachyPageView(cityName:cityController.text,countyName: countyController.text,),);
    },);
    Navigator.push(context, pageRoute);
  }



  TextEditingController get  countyController => _countyController;

  TextEditingController get cityController => _cityController;
}
