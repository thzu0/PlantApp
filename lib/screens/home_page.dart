import 'package:flutter/material.dart';
import 'package:plant_app_1/const/constants.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final PageController _pageController = PageController();
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right: 10.0),
            child: TextButton(
              onPressed: () {},
              child: const Text(
                'رد کردن ',
                style: TextStyle(
                  color: Colors.grey,
                  fontFamily: 'Vazirmatn',
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
      body: Stack(
        children: <Widget>[
          PageView(
            onPageChanged: (int page) {
              currentIndex = page;
            },
            controller: _pageController,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 50.0, right: 50.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(
                      height: 350.0,
                      child: Image.asset('assets/images/plant-one.png'),
                    ),
                    const SizedBox(height: 20.0),
                    Text(
                      Constants.titleOne,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: 'Vazirmatn',
                        fontSize: 25,
                        fontWeight: FontWeight.w700,
                        color: Constants.primaryColor,
                      ),
                    ),
                    SizedBox(height: 20.0),
                    Text(
                      textAlign: TextAlign.center,
                      Constants.descriptionOne,
                      style: TextStyle(
                        fontFamily: 'Vazirmatn',
                        fontSize: 21.0,
                        fontWeight: FontWeight.w400,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
