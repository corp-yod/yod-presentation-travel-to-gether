import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:yod/yod.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitialState()) {
    on<AuthenticationCheckingEvent>(onAuthenticationChecking);

    on<LoggedInEvent>((event, emit) {
      emit(AuthenticatedState());
    });

    on<LoggedOutEvent>((event, emit) async {
      // await repo.logout();
      emit(UnauthenticatedState());
    });
  }

  onAuthenticationChecking(
    AuthenticationCheckingEvent event,
    Emitter<AuthState> emit,
  ) async {
    final loggedIn = await isLoggedIn();
    emit(loggedIn ? AuthenticatedState() : UnauthenticatedState());
  }

  Future<bool> isLoggedIn() async {
    final accessToken = await YodData.instance.secureStorage().getKeyValue(
      'accessToken',
    );
    if (accessToken == null) return false;

    if (isTokenExpired(accessToken)) {
      // return await refreshAccessToken();
      return false;
    }

    return true;
  }

  bool isTokenExpired(String token) {
    final parts = token.split('.');
    if (parts.length != 3) return true;

    final payload = json.decode(
      utf8.decode(base64Url.decode(base64Url.normalize(parts[1]))),
    );

    final exp = payload['exp'];
    final now = DateTime.now().millisecondsSinceEpoch ~/ 1000;

    print('#->>> isTokenExpired payload $payload');
    print('#->>> isTokenExpired exp $exp');
    print('#->>> isTokenExpired now $now');

    return now >= exp;
  }

  // Future<bool> refreshAccessToken() async {
  //   final refreshToken = await storage.read(key: 'refreshToken');

  //   if (refreshToken == null) return false;

  //   final response = await callRefreshApi(refreshToken);

  //   if (response.success) {
  //     await saveTokens(response.accessToken, response.refreshToken);
  //     return true;
  //   }

  //   return false;
  // }
}
