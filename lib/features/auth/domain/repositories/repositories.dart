import 'package:yod_presentation_travel_to_gether/features/auth/domain/entities/user.dart';

abstract class Repositories {
  Future<User> login(String email, String password);
}
