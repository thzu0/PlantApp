import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:plant_app_1/const/constants.dart';

import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:plant_app_1/screens/camera_page.dart';

class ScanPage extends StatefulWidget {
  const ScanPage({super.key});

  @override
  State<ScanPage> createState() => _ScanPageState();
}

class _ScanPageState extends State<ScanPage> {
  MobileScannerController cameraController = MobileScannerController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
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
                  child: Icon(Icons.share, color: Constants.primaryColor),
                ),
              ],
            ),
          ),

          Positioned(
            top: 100.0,
            right: 20.0,
            left: 20.0,
            child: SizedBox(
              width: size.width * 0.8,
              height: size.height * 0.8,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: .center,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          PageTransition(
                            child: const CameraPage(),
                            type: PageTransitionType.fade,
                          ),
                        );
                      },
                      child: Image.asset(
                        'assets/images/code-scan.png',
                        height: 150.0,
                      ),
                    ),
                    const SizedBox(height: 25.0),
                    Text(
                      'برای اسکن گیاه کلیک کنید',
                      style: TextStyle(
                        fontFamily: 'Vazirmatn',
                        fontWeight: FontWeight.bold,
                        fontSize: 23.0,
                        color: Constants.primaryColor.withValues(alpha: 0.8),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
