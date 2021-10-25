import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:stepper/data/model/models.dart';
import 'package:stepper/presentation/home/views/rating_indicator.dart';

void main() {
  const String mockIndicatorText = 'mockString';
  const double mockIndicatorWidth = 30.0;
  const double mockIndicatorHeight = 5.0;
  const double mockIndicatorPadding = 8.0;
  final Area mockArea = Area(
    areaName: 'areaName',
    numberOfUpdate: 2,
    rating: 2,
    areaType: AreaType.scope,
    areaDescription: 'dummy description'
  );

  testWidgets('Rating indicator', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(
      home: RatingIndicator(
        key: const Key('Rating_Indicator'),
        indicatorText: mockIndicatorText,
        indicatorWidth: mockIndicatorWidth,
        indicatorHeight: mockIndicatorHeight,
        indicatorPadding: mockIndicatorPadding,
        area: mockArea,
      ),
    ));

    await expectLater(
      find.byKey(const Key('Rating_Indicator')),
      matchesGoldenFile(
        'golden_test_images/rating_indicator_widget.png',
      ),
      skip: !Platform.isMacOS,
    );

    expect(find.byKey(const Key('Rating_Indicator')), findsOneWidget);
    expect(find.byType(Text), findsOneWidget);
    expect(find.byType(Container), findsNWidgets(3));
  });
}