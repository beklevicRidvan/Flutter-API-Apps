import 'package:bloc_pattern_providerpackage_katmanlimimari_uygulamasi/data/entity/hava_durumu_model.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../cubit/weather_app_cubit.dart';

import 'package:flutter/material.dart';

class WeatherApp extends StatefulWidget {
  const WeatherApp({super.key});

  @override
  State<WeatherApp> createState() => _WeatherAppState();
}

class _WeatherAppState extends State<WeatherApp> {
  String kullanicininGirdigiSehir = "İstanbul";
  bool visibilty = false;
  final _textController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    context.read<WeatherAppCubit>().listeyiYukle(kullanicininGirdigiSehir);
  }

  @override
  Widget build(BuildContext context) {
    double deviceHeight = MediaQuery.of(context).size.height;

    return Scaffold(
        appBar: _buildAppBar(),
        body: _buildBody(deviceHeight),
    );
  }

  BlocBuilder<WeatherAppCubit, List<HavaDurumuModel>> _buildBody(
      double deviceHeight) {
    return BlocBuilder<WeatherAppCubit, List<HavaDurumuModel>>(
        builder: (context, bilgiler) {
      if (bilgiler.isNotEmpty) {
        return GridView.builder(
            itemCount: bilgiler.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 1, mainAxisExtent: deviceHeight * 0.6),
            itemBuilder: (context, index) {
              var currentElement = bilgiler[index];
              return _buildListItem(currentElement);
            });
      } else {
        return const Center(
          child: CircularProgressIndicator(),
        );
      }
    });
  }

  Card _buildListItem(HavaDurumuModel currentElement) {
    return Card(
      
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Center(
                child: Text(
              currentElement.cityName,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
            )),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Center(
              child: CachedNetworkImage(
                width: 200,
                imageUrl:
                    "https://cdn.weatherbit.io/static/img/icons/${currentElement.weather.icon}.png",
                progressIndicatorBuilder: (context, url, progress) => Center(
                  child: CircularProgressIndicator(
                    value: progress.progress,
                  ),
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(height: 10),
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Center(
                child: Text(
                  currentElement.weather.description,
                  style: const TextStyle(
                      fontSize: 30, fontWeight: FontWeight.w400),
                ),
              )),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Center(
                child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  "Temperature: ${currentElement.temp}" "°C",
                  style: const TextStyle(fontSize: 20),
                ),
                Text(
                  "Humidty: ${currentElement.rh}" " %",
                  style: const TextStyle(fontSize: 20),
                ),
              ],
            )),
          ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Last Update: ",
                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20),
                ),
                Text(
                  currentElement.obTime,
                  style: const TextStyle(fontWeight: FontWeight.w400, fontSize: 18),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  PreferredSizeWidget _buildAppBar() {
    return PreferredSize(
      preferredSize: const Size(double.infinity, 90),
      child: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/cloud.png"), fit: BoxFit.cover)),
          ),
          AppBar(
            backgroundColor: Colors.transparent,
            title: visibilty
                ? _buildAppBarTextFormField()
                : const Text(
                    "Weather App",
                    style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
                  ),
            actions: [
              IconButton(
                  onPressed: () {
                    setState(() {
                      visibilty = !visibilty;
                    });
                  },
                  icon: visibilty
                      ? const Icon(
                          CupertinoIcons.clear,
                          size: 30,
                        )
                      : const Icon(
                          Icons.search,
                          size: 40,
                        ))
            ],
          ),
        ],
      ),
    );
  }

  TextField _buildAppBarTextFormField() {
    return TextField(
      onSubmitted: (girilenDeger){
        if (girilenDeger.isNotEmpty){
          kullanicininGirdigiSehir = girilenDeger;
          context.read<WeatherAppCubit>().listeyiYukle(kullanicininGirdigiSehir);
        }
      },
                  controller: _textController,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    hintText: "Şehir seçin",
                    border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(15)),
                  ),
                );
  }




}
