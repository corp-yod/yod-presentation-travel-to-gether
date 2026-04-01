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
        // return MaterialPageRoute(builder: (context) => const Page1());
        return _buildPageRoute(settings, const Page1());
    }
    return null;
  }

  PageRouteBuilder _buildPageRoute(RouteSettings settings, Widget page) {
    return PageRouteBuilder(
      settings: settings,
      pageBuilder: (context, animation, secondaryAnimation) => page,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        var begin = const Offset(1, 0);
        const end = Offset.zero;
        const curve = Curves.ease;

        var tween = Tween(
          begin: begin,
          end: end,
        ).chain(CurveTween(curve: curve)).animate(animation);

        return SlideTransition(position: tween, child: child);
      },
    );
  }
}
