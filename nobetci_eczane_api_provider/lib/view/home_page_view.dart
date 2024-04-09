import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../view_model/home_page_view_model.dart';

class HomePageView extends StatelessWidget {
  const HomePageView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffFAF3E0),
      appBar: _buildAppBar(),
      body: _buildBody(context),
    );
  }

  _buildAppBar() {
    return AppBar(
      title: const Text("Pharmacy App"),
      backgroundColor: Colors.transparent,
      bottom: PreferredSize(preferredSize: const Size(double.infinity, 150), child:           Image.asset("assets/logo.png",fit: BoxFit.contain,width: 100,height: 100,),
      ),
    );
  }

  _buildBody(BuildContext context) {
    HomePageViewModel viewModel =
        Provider.of<HomePageViewModel>(context, listen: false);
    return Center(
      child: Stack(
        children: [



          Container(
            margin: const EdgeInsets.symmetric(horizontal: 16),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              boxShadow: const [
                BoxShadow(
                    color: Colors.red,
                    blurRadius: 10,
                    blurStyle: BlurStyle.solid)
              ],
              gradient: const LinearGradient(
                  colors: [Colors.white, Colors.redAccent, Colors.white],
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight),
            ),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(32.0),
                    child: TextField(
                      controller: viewModel.cityController,
                      decoration: InputDecoration(
                          filled: true, fillColor: Colors.redAccent.shade100),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(32.0),
                    child: TextField(
                      controller: viewModel.countyController,
                      decoration: InputDecoration(
                          filled: true, fillColor: Colors.redAccent.shade100),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Align(
                      alignment: AlignmentDirectional.bottomEnd,
                      child: IconButton(
                          onPressed: () {
                            if (viewModel.cityController.text.isNotEmpty &&
                                viewModel.countyController.text.isNotEmpty) {
                              viewModel.goPharmacyPageView(context);
                            }
                          },
                          icon: const Icon(
                            Icons.search_outlined,
                            size: 50,
                          )),
                    ),
                  )
                ],
              ),
            ),
          ),
          Positioned(
            right: 0,
            left: 0,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 60.0),
              child: Container(
                alignment: Alignment.center,
                child: const Text("ECZANE ARA",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
