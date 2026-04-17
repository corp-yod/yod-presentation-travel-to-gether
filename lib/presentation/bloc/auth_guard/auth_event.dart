part of 'auth_bloc.dart';

abstract class AuthEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class AuthenticationCheckingEvent extends AuthEvent {}

class LoggedInEvent extends AuthEvent {}

class LoggedOutEvent extends AuthEvent {}
