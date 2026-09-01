import 'package:flutter/material.dart';
import 'package:plant_app_1/const/constants.dart';
import 'package:plant_app_1/screens/root.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final PageController _pageController = PageController();
  int currentIndex = 0;

  ///============================================
  /// CREATE INDICATORS
  ///============================================
  Widget _indicators(bool isActive) {
    return AnimatedContainer(
      duration: const Duration(microseconds: 0),
      height: 10.0,
      width: isActive ? 20.0 : 8.0,
      margin: const EdgeInsets.only(right: 5.0),
      decoration: BoxDecoration(
        color: Constants.primaryColor,
        borderRadius: BorderRadius.circular(5.0),
      ),
    );
  }

  ///============================================
  /// WORK OF INDICATORS
  ///============================================
  List<Widget> _buildIndicator() {
    List<Widget> indicators = [];

    for (int i = 0; i < 3; i++) {
      if (currentIndex == i) {
        indicators.add(_indicators(true));
      } else {
        indicators.add(_indicators(false));
      }
    }
    return indicators;
  }

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
                  fontWeight: FontWeight.w700,
                  fontSize: 18,
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
              setState(() {
                currentIndex = page;
              });
            },
            controller: _pageController,
            children: [
              CreatePage(
                image: 'assets/images/plant-one.png',
                title: Constants.titleOne,
                description: Constants.descriptionOne,
              ),
              CreatePage(
                image: 'assets/images/plant-two.png',
                title: Constants.titleTwo,
                description: Constants.descriptionTwo,
              ),
              CreatePage(
                image: 'assets/images/plant-three.png',
                title: Constants.titleThree,
                description: Constants.descriptionThree,
              ),
            ],
          ),
          Positioned(
            bottom: 110.0,
            left: 40.0,
            child: Row(children: _buildIndicator()),
          ),
          Positioned(
            bottom: 90.0,
            right: 40.0,
            child: Container(
              padding: EdgeInsets.all(4),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Constants.primaryColor,
              ),
              child: IconButton(
                onPressed: () {
                  setState(() {
                    if (currentIndex < 2) {
                      currentIndex++;
                      if (currentIndex < 3) {
                        _pageController.nextPage(
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeIn,
                        );
                      }
                    } else {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const RootPage(),
                        ),
                      );
                    }
                  });
                },
                icon: const Icon(Icons.arrow_forward_ios, color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

///============================================
/// CREATE PAGE ONBOARD
///============================================

class CreatePage extends StatelessWidget {
  final String image;
  final String title;
  final String description;

  const CreatePage({
    super.key,
    required this.image,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 50.0, right: 50.0, bottom: 150.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          SizedBox(height: 350.0, child: Image.asset(image)),
          const SizedBox(height: 20.0),
          Text(
            title,
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
            description,
            style: TextStyle(
              fontFamily: 'Vazirmatn',
              fontSize: 21.0,
              fontWeight: FontWeight.w400,
              color: Colors.grey,
            ),
          ),
          SizedBox(height: 20.0),
        ],
      ),
    );
  }
}
