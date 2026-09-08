import 'package:flutter/material.dart';

import 'package:plant_app_1/const/constants.dart';
import 'package:plant_app_1/widgets/profile_widget.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(20.0),
        height: size.height,
        width: size.width,
        child: Column(
          children: <Widget>[
            ///=====================================
            ///PROFILE IMAGE
            ///=====================================
            Container(
              width: 150.0,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: Constants.primaryColor.withValues(alpha: 0.5),
                  width: 5.0,
                ),
              ),
              child: const CircleAvatar(
                radius: 60.0,
                backgroundColor: Colors.transparent,
                backgroundImage: ExactAssetImage('assets/images/profile.jpg'),
              ),
            ),
            const SizedBox(height: 20.0),

            ///==================================
            ///PROFILE NAME
            ///==================================
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'ساناز امینی',
                  style: TextStyle(
                    color: Constants.blackColor,
                    fontSize: 20.0,
                    fontFamily: 'Vazirmatn',
                  ),
                ),
                const SizedBox(width: 7.0),
                SizedBox(
                  height: 20.0,
                  child: Image.asset('assets/images/verified.png'),
                ),
              ],
            ),
            const SizedBox(height: 8.0),

            ///==============================
            ///PROFILE EMAIL
            ///==============================
            Text(
              'Sanaz.amini1387@gmail.com',
              style: TextStyle(
                color: Constants.blackColor.withValues(alpha: 0.4),
                fontSize: 16.0,
              ),
            ),
            const SizedBox(height: 25.0),

            ///
            ///PROFILE OPTION
            ///
            SizedBox(
              height: size.height * 0.5,
              width: size.width,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ///=======================================
                  ///BACK BUTTON(OPEN THE PAGE FOR EVERY ONE)
                  ///=======================================
                  BuildOptions(title: 'پروفایل من', icon: Icons.person),
                  BuildOptions(title: 'تنظیمات', icon: Icons.settings),
                  BuildOptions(
                    title: 'اطلاغ رسانی ها',
                    icon: Icons.notifications,
                  ),
                  BuildOptions(title: 'شبکه های اجتماعی ', icon: Icons.share),
                  BuildOptions(title: 'خروج', icon: Icons.logout),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
