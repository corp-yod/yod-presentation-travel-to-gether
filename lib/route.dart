import 'package:flutter/material.dart';
import 'package:yod_navigator/yod_navigator.dart';
import 'package:yod_presentation_travel_to_gether/page1.dart';

class TravelToGetherDomain extends YodRouterGenerator {
  @override
  void init() {}

  @override
  Set<String> routes() {
    return {'/travel_to_gether'};
  }

  @override
  Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/travel_to_gether':
        return MaterialPageRoute(builder: (context) => const Page1());
    }
    return null;
  }
}
