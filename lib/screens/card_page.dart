import 'package:flutter/material.dart';
import 'package:plant_app_1/const/constants.dart';
import 'package:plant_app_1/models/plant.dart';
import 'package:plant_app_1/widgets/extentions.dart';
import 'package:plant_app_1/widgets/plant_widget.dart';

class CardPage extends StatefulWidget {
  final List<Plant> addToCartPlants;
  final VoidCallback onBackToHome;

  const CardPage({
    super.key,
    required this.addToCartPlants,
    required this.onBackToHome,
  });

  @override
  State<CardPage> createState() => _CardPageState();
}

class _CardPageState extends State<CardPage> {
  int get totalPrice {
    return widget.addToCartPlants.fold(0, (sum, plant) => sum + plant.price);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          widget.addToCartPlants.isEmpty
              ? Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      SizedBox(
                        height: 100.0,
                        child: Image.asset('assets/images/add-cart.png'),
                      ),
                      const SizedBox(height: 20.0),
                      Text(
                        'سبد خرید تار عنکبوت بسته است :( ',
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
                  // height: size.height * 0.5,
                  child: Column(
                    children: [
                      Expanded(
                        child: ListView.builder(
                          physics: const BouncingScrollPhysics(),
                          itemCount: widget.addToCartPlants.length,
                          itemBuilder: (context, index) {
                            return NewPlantWidget(
                              plantList: widget.addToCartPlants,
                              index: index,
                              onCartTap: widget.onBackToHome,
                            );
                          },
                        ),
                      ),
                      Column(
                        children: [
                          const Divider(thickness: 1.0),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  SizedBox(
                                    height: 20,
                                    child: Image.asset(
                                      'assets/images/PriceUnit-green.png',
                                    ),
                                  ),
                                  const SizedBox(width: 8.0),
                                  Text(
                                    totalPrice.toString().farsiNumber,
                                    style: TextStyle(
                                      fontFamily: 'Vazirmatn',
                                      color: Constants.primaryColor,
                                      fontSize: 25,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ],
                              ),
                              const Text(
                                'جمع کل',
                                style: TextStyle(
                                  fontFamily: 'Vazirmatn',
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
        ],
      ),
    );
  }
}
