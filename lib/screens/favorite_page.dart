import 'package:flutter/material.dart';
import 'package:plant_app_1/models/plant.dart';
import 'package:plant_app_1/const/constants.dart';
import 'package:plant_app_1/widgets/plant_widget.dart';

class FavoritePage extends StatefulWidget {
  final List<Plant> favoritedPlant;
  const FavoritePage({super.key, required this.favoritedPlant});

  @override
  State<FavoritePage> createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: widget.favoritedPlant.isEmpty
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  SizedBox(
                    height: 100.0,
                    child: Image.asset('assets/images/favorited.png'),
                  ),
                  const SizedBox(height: 20.0),
                  Text(
                    'ظاهرا به هیچی علاقه نداشتی :|',
                    textDirection: TextDirection.rtl,
                    style: TextStyle(
                      fontFamily: 'Vazirmatn',
                      fontSize: 20.0,
                      fontWeight: FontWeight.w500,
                      color: Constants.primaryColor,
                    ),
                  ),
                ],
              ),
            )
          : Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 12,
                vertical: 30.0,
              ),
              height: size.height * 0.5,
              child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                itemCount: widget.favoritedPlant.length,
                itemBuilder: (context, index) {
                  return NewPlantWidget(
                    plantList: widget.favoritedPlant,
                    index: index,
                    onCartTap: () {},
                  );
                },
              ),
            ),
    );
  }
}
