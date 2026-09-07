import 'package:flutter/material.dart';
import 'package:plant_app_1/const/constants.dart';
import 'package:plant_app_1/models/plant.dart';
import 'package:plant_app_1/widgets/extentions.dart';

class DetailPage extends StatefulWidget {
  final int plantId;
  final VoidCallback onCartTap;

  const DetailPage({super.key, required this.plantId, required this.onCartTap});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  bool toggleIsSelected(bool isSelected) {
    return !isSelected;
  }

  int get cartItemCount {
    return Plant.plantList.where((plant) => plant.isSelected).length;
  }

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
                  child: IconButton(
                    onPressed: () {
                      setState(() {
                        plantList[widget.plantId].isFavorated =
                            !plantList[widget.plantId].isFavorated;
                      });
                    },
                    icon: Icon(
                      plantList[widget.plantId].isFavorated
                          ? Icons.favorite
                          : Icons.favorite_border,
                      color: Constants.primaryColor,
                    ),
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
            InkWell(
              onTap: () {
                widget.onCartTap();
                Navigator.pop(context);
              },
              borderRadius: BorderRadius.circular(50.0),
              child: Stack(
                clipBehavior: Clip.none,
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

                  if (cartItemCount > 0)
                    Positioned(
                      right: -5,
                      top: -5,
                      child: Container(
                        height: 22,
                        width: 22,
                        decoration: const BoxDecoration(
                          color: Colors.red,
                          shape: BoxShape.circle,
                        ),
                        child: Center(
                          child: Text(
                            cartItemCount.toString(),
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                ],
              ),
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
                child: Center(
                  child: InkResponse(
                    onTap: () {
                      setState(() {
                        bool isSelected = toggleIsSelected(
                          plantList[widget.plantId].isSelected,
                        );
                        plantList[widget.plantId].isSelected = isSelected;
                      });
                      if (plantList[widget.plantId].isSelected) {
                        showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              backgroundColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(25.0),
                              ),
                              contentPadding: const EdgeInsets.fromLTRB(
                                25.0,
                                25.0,
                                25.0,
                                15.0,
                              ),
                              content: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  ///==================================
                                  /// SUCCESS ICON
                                  ///==================================
                                  Container(
                                    height: 70.0,
                                    width: 70.0,
                                    decoration: BoxDecoration(
                                      color: Constants.primaryColor.withValues(
                                        alpha: 0.15,
                                      ),
                                      shape: BoxShape.circle,
                                    ),
                                    child: Icon(
                                      Icons.check,
                                      size: 40.0,
                                      color: Constants.primaryColor,
                                    ),
                                  ),

                                  const SizedBox(height: 20.0),

                                  ///==================================
                                  /// TITLE
                                  ///==================================
                                  Text(
                                    'با موفقیت افزوده شد',
                                    textDirection: TextDirection.rtl,
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontFamily: 'Vazirmatn',
                                      fontSize: 21.0,
                                      fontWeight: FontWeight.bold,
                                      color: Constants.primaryColor,
                                    ),
                                  ),

                                  const SizedBox(height: 12.0),

                                  ///==================================
                                  /// MESSAGE
                                  ///==================================
                                  Text(
                                    'گیاه ${plantList[widget.plantId].plantName} به سبد خرید شما افزوده شد.',
                                    textDirection: TextDirection.rtl,
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontFamily: 'Vazirmatn',
                                      fontSize: 17.0,
                                      height: 1.7,
                                      color: Constants.blackColor.withValues(
                                        alpha: 0.7,
                                      ),
                                    ),
                                  ),

                                  const SizedBox(height: 20.0),

                                  ///==================================
                                  /// OK BUTTON
                                  ///==================================
                                  SizedBox(
                                    width: double.infinity,
                                    height: 45.0,
                                    child: ElevatedButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: Constants.primaryColor,
                                        elevation: 0.0,
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(
                                            12.0,
                                          ),
                                        ),
                                      ),
                                      child: const Text(
                                        'باشه',
                                        style: TextStyle(
                                          fontFamily: 'Vazirmatn',
                                          fontSize: 17.0,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                        );
                      }
                    },
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
