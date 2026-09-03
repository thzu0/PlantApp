import 'package:flutter/material.dart';
import 'package:plant_app_1/const/constants.dart';
import 'package:plant_app_1/models/plant.dart';
import 'package:plant_app_1/widgets/extentions.dart';

class DetailPage extends StatefulWidget {
  final int plantId;
  const DetailPage({super.key, required this.plantId});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    List<Plant> plantList = Plant.plantList;
    return Scaffold(
      body: Stack(
        children: <Widget>[
          ///==================================
          /// APP BAR
          ///==================================
          Positioned(
            top: 70.0,
            left: 20.0,
            right: 20.0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ///==================================
                /// X BUTTON
                ///==================================
                Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50.0),
                    color: Constants.primaryColor.withValues(alpha: 0.15),
                  ),
                  child: IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(Icons.close),
                    color: Constants.primaryColor,
                  ),
                ),

                ///==================================
                /// LIKE BUTTON
                ///==================================
                Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50.0),
                    color: Constants.primaryColor.withValues(alpha: 0.15),
                  ),
                  child: Icon(
                    plantList[widget.plantId].isFavorated == true
                        ? Icons.favorite
                        : Icons.favorite_border,
                    color: Constants.primaryColor,
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top: 130.0,
            right: 20.0,
            left: 20.0,
            child: Container(
              width: size.width * 0.8,
              height: size.height * 0.8,
              padding: const EdgeInsets.all(20.0),
              child: Stack(
                children: [
                  ///===========================
                  /// PRODUCT IMAGE
                  ///===========================
                  Positioned(
                    top: 35.0,
                    left: 0.0,
                    child: SizedBox(
                      height: 400,
                      child: Image.asset(plantList[widget.plantId].imageURL),
                    ),
                  ),

                  ///===========================
                  /// PLANT FEATURE
                  ///===========================
                  Positioned(
                    top: 20.0,
                    right: 0.0,
                    child: SizedBox(
                      height: 200.0,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          PlantFeature(
                            title: 'اندازه گیاه',
                            plantFeature: plantList[widget.plantId].size,
                          ),

                          PlantFeature(
                            title: 'رطوبت هوا',
                            plantFeature: plantList[widget.plantId].humidity
                                .toString()
                                .farsiNumber,
                          ),

                          PlantFeature(
                            title: 'دمای نگهداری',
                            plantFeature: plantList[widget.plantId].temperature
                                .toString()
                                .farsiNumber,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              padding: const EdgeInsets.only(
                top: 80.0,
                left: 30.0,
                right: 30.0,
              ),
              height: size.height * 0.5,
              width: size.width,
              decoration: BoxDecoration(
                color: Constants.primaryColor.withValues(alpha: 0.5),
                borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(40.0),
                  topLeft: Radius.circular(40),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.star,
                            size: 30,
                            color: Constants.primaryColor,
                          ),
                          Text(
                            plantList[widget.plantId].rating
                                .toString()
                                .farsiNumber,
                            style: TextStyle(
                              fontFamily: 'Vazirmatn',
                              color: Constants.primaryColor,
                              fontSize: 20,
                            ),
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            plantList[widget.plantId].plantName,
                            style: TextStyle(
                              fontFamily: 'Vazirmatn',
                              color: Constants.primaryColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 30,
                            ),
                          ),
                          const SizedBox(height: 20.0),
                          Row(
                            children: [
                              SizedBox(
                                height: 19,
                                child: Image.asset(
                                  'assets/images/PriceUnit-green.png',
                                ),
                              ),
                              SizedBox(width: 6),
                              Text(
                                plantList[widget.plantId].price
                                    .toString()
                                    .farsiNumber,
                                style: TextStyle(
                                  fontFamily: 'Vazirmatn',
                                  color: Constants.blackColor,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 24,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 25),
                  Text(
                    plantList[widget.plantId].decription,
                    textDirection: TextDirection.rtl,
                    textAlign: TextAlign.justify,
                    style: TextStyle(
                      fontFamily: 'Vazirmatn',
                      color: Constants.blackColor.withValues(alpha: 0.7),
                      height: 1.7,
                      fontSize: 22,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: SizedBox(
        width: size.width * 0.9,
        height: 50.0,
        child: Row(
          children: [
            Container(
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                color: Constants.primaryColor.withValues(alpha: 0.5),
                borderRadius: BorderRadius.circular(50.0),
                boxShadow: [
                  BoxShadow(
                    offset: Offset(0.0, 1.0),
                    blurRadius: 5.0,
                    color: Constants.primaryColor.withValues(alpha: 0.3),
                  ),
                ],
              ),
              child: Icon(Icons.shopping_cart, color: Colors.white),
            ),
            SizedBox(width: 20.0),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Constants.primaryColor,
                  borderRadius: BorderRadius.circular(10.0),
                  boxShadow: [
                    BoxShadow(
                      offset: Offset(0.0, 1.0),
                      blurRadius: 5.0,
                      color: Constants.primaryColor.withValues(alpha: 0.3),
                    ),
                  ],
                ),
                child: const Center(
                  child: Text(
                    'افزودن به سبد خرید',
                    style: TextStyle(
                      fontFamily: 'Vazirmatn',
                      color: Colors.white,

                      fontSize: 22,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class PlantFeature extends StatelessWidget {
  final String title;
  final String plantFeature;
  const PlantFeature({
    super.key,
    required this.title,
    required this.plantFeature,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: <Widget>[
        Text(
          title,
          style: TextStyle(
            fontFamily: 'Vazirmatn',
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
            color: Constants.blackColor,
          ),
        ),
        Text(
          plantFeature,
          style: TextStyle(
            fontFamily: 'Vazirmatn',
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
            color: Constants.primaryColor,
          ),
        ),
      ],
    );
  }
}
