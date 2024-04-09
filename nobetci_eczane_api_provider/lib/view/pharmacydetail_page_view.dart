import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../model/pharmacy_model.dart';

class PharmacyDetailPageView extends StatelessWidget {
  final PharmacyModel pharmacyModel;
  const PharmacyDetailPageView({super.key,required this.pharmacyModel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: _buildBody(),
    );
  }

  _buildAppBar() {
    return AppBar(
      title: Text("${pharmacyModel.name} Eczanesi"),
      backgroundColor: Colors.redAccent.shade100,
    );
  }

  _buildBody() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Center(
        child: Stack(
          children: [
          Positioned(top: 0,left: 0,right: 0,child: Image.asset("assets/pharmachy.png",fit: BoxFit.contain,width: 100,height: 100,)),
            Container(
              margin: const EdgeInsets.only(top: 60),
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  const SizedBox(height: 30,),
                  Text(pharmacyModel.name,style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 18),),
                  const SizedBox(height: 20,),
                  const Text("Adres",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                  const SizedBox(height: 5,),

                  Text(pharmacyModel.address),
                  const SizedBox(height: 20,),
                  const Text("Telefon",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(Icons.phone),
                      const SizedBox(width: 10,),
                      Text(pharmacyModel.phone),

                    ],
                  )


                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
