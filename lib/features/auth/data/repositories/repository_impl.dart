// import 'package:yod_presentation_travel_to_gether/core/storage/token_storage.dart';
import 'package:yod/yod.dart';
import 'package:yod_presentation_travel_to_gether/features/auth/data/datasource/remote_datasource.dart';
import 'package:yod_presentation_travel_to_gether/features/auth/data/models/login_request.dart';
import 'package:yod_presentation_travel_to_gether/features/auth/domain/entities/user.dart';
import 'package:yod_presentation_travel_to_gether/features/auth/domain/repositories/repositories.dart';

class RepositoryImpl implements Repositories {
  RepositoryImpl({required this.remoteDataSource});

  final RemoteDataSource remoteDataSource;

  @override
  Future<User> login(String email, String password) async {
    try {
      final response = await remoteDataSource.login(
        LoginRequest(email: email, password: password),
      );
      await YodData.instance.secureStorage().setKeyValue(
        'accessToken',
        response.accessToken,
      );

      await YodData.instance.variableStorage().setKeyValueString(
        'userId',
        response.userId,
      );

      return User(
        id: response.userId,
        accessToken: response.accessToken,
        refreshToken: response.refreshToken,
      );
    } catch (e) {
      rethrow;
    }
  }
}
