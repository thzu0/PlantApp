import 'package:flutter/material.dart';

import 'package:plant_app_1/const/constants.dart';

class BuildOptions extends StatelessWidget {
  final IconData icon;
  final String title;

  const BuildOptions({super.key, required this.icon, required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 28.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Icon(
            Icons.arrow_back_ios_new,
            size: 16,
            color: Constants.blackColor.withValues(alpha: 0.4),
          ),
          Row(
            children: [
              Text(
                title,
                style: TextStyle(
                  fontFamily: 'Vazirmatn',
                  color: Constants.blackColor,
                  fontSize: 18.0,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(width: 7.0),
              Icon(
                icon,
                color: Constants.blackColor.withValues(alpha: 0.5),
                size: 24,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
