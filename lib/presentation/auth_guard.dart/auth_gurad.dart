import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yod_navigator/presentation/yod_navigator/yod_navigator.dart';
import 'package:yod_presentation_travel_to_gether/presentation/bloc/auth_guard/auth_bloc.dart';
import 'package:yod_presentation_travel_to_gether/route_name.dart';

class AuthGuard extends StatelessWidget {
  final Widget child;

  const AuthGuard({required this.child, super.key});

  @override
  StatelessElement createElement() {
    // TODO: implement createElement
    return super.createElement();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthBloc()..add(AuthenticationCheckingEvent()),

      child: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is UnauthenticatedState) {
            // Navigate to login screen
            YodNavigator().pushReplacement(
              context,
              RouteNameTravel.travelLoginScreen,
            );
          }
        },
        builder: (context, state) {
          if (state is AuthInitialState) {
            return const Scaffold(
              body: Center(child: CircularProgressIndicator()),
            );
          }

          if (state is AuthenticatedState) {
            return child;
          }

          // While waiting for authentication check, show loading
          return const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        },
      ),
    );
  }
}
