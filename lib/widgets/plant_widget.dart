import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:plant_app_1/const/constants.dart';
import 'package:plant_app_1/models/plant.dart';
import 'package:plant_app_1/screens/detail_page.dart';
import 'package:plant_app_1/widgets/extentions.dart';

class NewPlantWidget extends StatelessWidget {
  final List<Plant> _plantList;
  final int index;
  final VoidCallback onCartTap;

  const NewPlantWidget({
    super.key,
    required this._plantList,
    required this.index,
    required this.onCartTap,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          PageTransition(
            child: DetailPage(
              plantId: _plantList[index].plantId,
              onCartTap: onCartTap,
            ),
            type: PageTransitionType.rightToLeft,
          ),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          color: Constants.primaryColor.withValues(alpha: 0.1),
          borderRadius: BorderRadius.circular(10.0),
        ),
        height: 85,
        width: size.width,
        margin: const EdgeInsets.only(bottom: 10, top: 10),
        padding: const EdgeInsets.only(left: 10, top: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Row(
              children: <Widget>[
                SizedBox(
                  height: 20,
                  child: Image.asset('assets/images/PriceUnit-green.png'),
                ),
                const SizedBox(width: 5.0),

                Text(
                  _plantList[index].price.toString().farsiNumber,
                  style: TextStyle(
                    fontFamily: 'Vazirmatn',
                    fontWeight: FontWeight.bold,
                    color: Constants.primaryColor,
                    fontSize: 20.0,
                  ),
                ),
              ],
            ),
            Stack(
              clipBehavior: Clip.none,
              children: <Widget>[
                Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                    color: Constants.primaryColor.withValues(alpha: 0.8),
                    shape: BoxShape.circle,
                  ),
                ),
                Positioned(
                  bottom: 5.0,
                  right: 0,
                  left: 0,
                  child: SizedBox(
                    height: 80,
                    child: Image.asset(_plantList[index].imageURL),
                  ),
                ),
                Positioned(
                  bottom: 5.0,
                  right: 80.0,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: <Widget>[
                      Text(
                        _plantList[index].category,
                        style: TextStyle(
                          fontFamily: 'Vazirmatn',
                          fontSize: 14.0,
                        ),
                      ),
                      Text(
                        _plantList[index].plantName,
                        style: TextStyle(
                          fontFamily: 'Vazirmatn',
                          fontSize: 19.0,
                          color: Constants.blackColor,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
