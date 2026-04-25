import 'package:yod_navigator/yod_navigator.dart';
import 'package:yod_presentation_travel_to_gether/presentation/login/login_screen.dart';
import 'package:yod_presentation_travel_to_gether/presentation/main_app_travel_together.dart';
import 'package:yod_presentation_travel_to_gether/presentation/travel/booking_screen.dart';
import 'package:yod_presentation_travel_to_gether/route_name.dart';

class TravelToGetherDomain extends YodRouterModule {
  @override
  void init() {}

  @override
  List<YodRouterBase> routes() {
    return [
      YodRouterBase(
        path: RouteNameTravel.travelLoginScreen,
        name: RouteNameTravel.travelLoginScreen,
        builder: (context, state) => const LoginScreen(),
      ),
      YodRouterBase(
        path: RouteNameTravel.mainAppTravelToGether,
        name: RouteNameTravel.mainAppTravelToGether,
        builder: (context, state) => const MainAppTravelToGether(),
        routes: [
          YodRouterBase(
            path: RouteNameTravel.bookingScreen,
            name: RouteNameTravel.bookingScreen,
            builder: (context, state) {
              // final bodyJson = state.extra as Map<String, dynamic>?;
              // print('#->>> BookingScreen bodyJson: $bodyJson');
              return BookingScreen();
            },
          ),
        ],
      ),
    ];
  }

  // PageRouteBuilder _buildPageRoute(RouteSettings settings, Widget page) {
  //   return PageRouteBuilder(
  //     settings: settings,
  //     pageBuilder: (context, animation, secondaryAnimation) => page,
  //     transitionsBuilder: (context, animation, secondaryAnimation, child) {
  //       var begin = const Offset(1, 0);
  //       const end = Offset.zero;
  //       const curve = Curves.ease;

  //       var tween = Tween(
  //         begin: begin,
  //         end: end,
  //       ).chain(CurveTween(curve: curve)).animate(animation);

  //       return SlideTransition(position: tween, child: child);
  //     },
  //   );
  // }
}
