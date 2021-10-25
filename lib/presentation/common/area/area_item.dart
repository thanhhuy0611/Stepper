import 'package:flutter/material.dart';
import 'package:stepper/common/consts.dart';
import 'package:stepper/common/palette.dart';
import 'package:stepper/data/model/models.dart';
import 'package:stepper/presentation/home/views/rating_indicator.dart';

class AreaItem extends StatelessWidget {
  final String areaSubTitle;
  final double itemWidth;
  final Area area;
  const AreaItem({
    Key? key,
    required this.areaSubTitle,
    required this.itemWidth,
    required this.area,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return Padding(
      padding: const EdgeInsets.only(bottom: screenMediumPadding),
      child: Container(
        decoration: BoxDecoration(
          color: darkGrey,
          borderRadius: BorderRadius.circular(mediumBorderRadius),
        ),
        width: itemWidth,
        height: screenSize.width * 0.15,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Flexible(
              flex: 2,
              child: Text(
                area.areaName,
                style: TextStyle(
                  fontSize: largeFontSize,
                  fontWeight: FontWeight.bold,
                  color: area.getAreaTheme()[2],
                ),
              ),
            ),
            Flexible(
              flex: 4,
              child: Padding(
                padding: const EdgeInsets.only(
                  bottom: screenSmallPadding,
                  left: screenSmallPadding,
                ),
                child: RatingIndicator(
                  indicatorText: areaSubTitle,
                  indicatorWidth: itemWidth * 0.6 / 3 - screenSmallPadding,
                  indicatorHeight: screenSize.width * 0.01,
                  indicatorPadding: indicatorPadding,
                  area: area,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}