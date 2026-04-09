import 'package:yod/yod.dart';
import 'package:yod_presentation_travel_to_gether/features/auth/data/models/login_request.dart';
import 'package:yod_presentation_travel_to_gether/features/auth/data/models/login_response.dart';

abstract class RemoteDataSource {
  Future<LoginResponse> login(LoginRequest request);
}

class AuthRemoteDataSource extends RemoteDataSource {
  AuthRemoteDataSource() {
    serviceHttp = YodNetworkHttp();
  }

  late final YodNetworkHttp serviceHttp;

  @override
  Future<LoginResponse> login(LoginRequest request) async {
    YodHttpBaseOption option = YodHttpBaseOption(
      urlName: 'login',
      method: Method.post,
      contentType: 'application/json; charset=utf-8',
      headers: {'Content-Type': 'application/json'},
      body: request.toJson(),
    );
    print('#->>> Login request: ${option.toJson()}');
    final response = await serviceHttp.request(option);
    // final response = await dio.post('/login', data: request.toJson());

    print('#->>>  Login response: ${response.data}');

    return LoginResponse.fromJson(response.data);
  }
}
