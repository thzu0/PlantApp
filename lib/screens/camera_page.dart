import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:plant_app_1/const/constants.dart';
import 'package:plant_app_1/screens/qr_overlay.dart';

class CameraPage extends StatefulWidget {
  const CameraPage({super.key});

  @override
  State<CameraPage> createState() => _CameraPageState();
}

class _CameraPageState extends State<CameraPage> {
  final MobileScannerController cameraController = MobileScannerController();

  bool isTorchOn = false;

  @override
  void dispose() {
    cameraController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          MobileScanner(
            controller: cameraController,
            onDetect: (capture) {
              final List<Barcode> barcodes = capture.barcodes;

              for (final barcode in barcodes) {
                final String? code = barcode.rawValue;

                if (code == null) {
                  debugPrint('Failed to scan Barcode');
                } else {
                  debugPrint('Barcode found! $code');
                }
              }
            },
          ),
          QRScannerOverlay(overlayColour: Colors.black.withValues(alpha: 0.5)),
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
                    color: Constants.primaryColor.withValues(alpha: 0.2),
                  ),
                  child: IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(Icons.close),
                    color: Colors.white,
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
                    color: Constants.primaryColor.withValues(alpha: 0.2),
                  ),
                  child: IconButton(
                    color: Colors.white,
                    onPressed: () async {
                      await cameraController.toggleTorch();

                      setState(() {
                        isTorchOn = !isTorchOn;
                      });
                    },
                    icon: Icon(
                      isTorchOn ? Icons.flash_on : Icons.flash_off,
                      color: isTorchOn ? Colors.yellow : Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
