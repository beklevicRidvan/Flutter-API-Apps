import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'view/home_page_view.dart';
import 'view_model/home_page_view_model.dart';

void main(){
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ChangeNotifierProvider(create: (context) =>  HomePageViewModel(),child: const HomePageView(),),
    );
  }
}
