import 'package:api_boss_ornek/data/constants/constants.dart';
import 'package:api_boss_ornek/data/entity/rick_and_morty_data.dart';
import 'package:flutter/material.dart';

class InformationRow extends StatelessWidget {
  RickAndMortyModels rickAndMortyModels;
   InformationRow({super.key,required this.rickAndMortyModels});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        buildInformationRow("Name",rickAndMortyModels.name),
        buildInformationRow("Status",rickAndMortyModels.status),
        buildInformationRow("Species",rickAndMortyModels.species),
        buildInformationRow("Gender",rickAndMortyModels.gender),
        buildInformationRow("Location",rickAndMortyModels.origin?.name ?? "Unkown"),
        buildInformationRow("Origin",rickAndMortyModels.location?.name ?? "Unkown"),
      ],
    );
  }
  Padding buildInformationRow(String label,dynamic value){
    return Padding(
      padding: Constants.getDetailPadding(),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label,style: Constants.responsiveDetailText(18),),
          if (value is List && value.isNotEmpty)
            Text(
              value.join(' , '),
              style: Constants.responsiveDetailText(15),
            )
          else if (value == null)
            Text(
              'Unkown',
              style: Constants.responsiveDetailText(15),
            )
          else
            Text(
              value,
              style: Constants.responsiveDetailText(15),
            ),

        ],
      ),
    );
  }

}
