import 'package:stepper/data/model/routing_data.dart';

extension StringExtension on String {
  RoutingData get getRoutingData {
    var uriData = Uri.parse(this);
    return RoutingData(
      route: uriData.path,
      queryParameter: uriData.queryParameters,
    );
  }
}