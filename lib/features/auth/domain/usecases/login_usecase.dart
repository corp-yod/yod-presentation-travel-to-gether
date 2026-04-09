import 'package:yod_presentation_travel_to_gether/features/auth/domain/entities/user.dart';
import 'package:yod_presentation_travel_to_gether/features/auth/domain/repositories/repositories.dart';

class LoginUseCase {
  LoginUseCase({required this.repositories});

  final Repositories repositories;

  Future<User> call(String email, String password) {
    try {
      return repositories.login(email, password);
    } catch (e) {
      rethrow;
    }
  }
}
