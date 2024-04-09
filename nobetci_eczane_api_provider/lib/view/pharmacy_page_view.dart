
import 'package:flutter/material.dart';
import 'package:nobetci_eczane_api_provider/model/pharmacy_model.dart';
import 'package:provider/provider.dart';

import '../view_model/pharmacy_page_view_model.dart';

class PharmachyPageView extends StatelessWidget {
  final String cityName;
  final String countyName;
  const PharmachyPageView({super.key,required this.cityName,required this.countyName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: _buildBody(),
    );
  }

  _buildAppBar() {
    return AppBar(
      title:  Text("$cityName/$countyName Nöbetçi Eczaneleri"),
      backgroundColor: Colors.redAccent,
    );
  }

  _buildBody() {
    return Consumer<PharmachyPageViewModel>(builder: (context, value, child) {
      if(value.pharmacies.isNotEmpty){
        return ListView.builder(itemCount: value.pharmacies.length,itemBuilder: (context, index) {
          var currentElement = value.pharmacies[index];
          return _buildListItem(currentElement,context);
        },);
      }
      else{
        return const Center( child:  Text("Loading..",style: TextStyle(color: Colors.redAccent,fontSize: 22),));
      }
    },);
  }

  _buildListItem(PharmacyModel currentElement, BuildContext context) {
    return ListTile(
      onTap: (){
        context.read<PharmachyPageViewModel>().goDetailPage(context, currentElement);
      },
      title:  Text(currentElement.name),
      leading: const Icon(Icons.local_pharmacy,color: Colors.red,size: 35,),

    );
  }
}
