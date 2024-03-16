import 'package:api_boss_ornek/data/entity/rick_and_morty_data.dart';
import 'package:api_boss_ornek/ui/widgets/homepage_app_bar.dart';
import 'package:api_boss_ornek/ui/widgets/character_list.dart';

import 'package:flutter/material.dart';


class AnaSayfa extends StatefulWidget {
  const AnaSayfa({super.key});

  @override
  State<AnaSayfa> createState() => _AnaSayfaState();
}

class _AnaSayfaState extends State<AnaSayfa> {

  late Future<List<RickAndMortyModels>> karakterListesi;




  @override
  Widget build(BuildContext context) {
    return  Scaffold(

      body: OrientationBuilder(

          builder: (context,orientation)=> const Column(
            children: [
              MyAppBar(),
              Expanded(child:  CharacterList()),
            ],
          ),
      ),







    );
  }
}


