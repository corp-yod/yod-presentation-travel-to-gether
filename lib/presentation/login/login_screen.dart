import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:yod/yod.dart';
import 'package:yod_navigator/presentation/yod_navigator/yod_navigator.dart';
import 'package:yod_presentation_travel_to_gether/features/auth/data/datasource/remote_datasource.dart';
import 'package:yod_presentation_travel_to_gether/features/auth/data/repositories/repository_impl.dart';
import 'package:yod_presentation_travel_to_gether/features/auth/domain/usecases/login_usecase.dart';
import 'package:yod_presentation_travel_to_gether/route_name.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  bool initialized = false;

  @override
  void initState() {
    super.initState();
    // YodData.instance.secureStorage().removeKeyValue('accessToken');
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    if (initialized) return;
    initialized = true;

    isLoggedIn().then((loggedIn) {
      if (loggedIn) {
        YodNavigator().pushReplacementNamed(
          context,
          RouteNameTravel.travelMainApp,
        );
      }
    });
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Future<void> handleLogin() async {
    // final tokenStorage = TokenStorage();

    final repository = RepositoryImpl(remoteDataSource: AuthRemoteDataSource());
    final loginUseCase = LoginUseCase(repositories: repository);

    try {
      final user = await loginUseCase.call('test@mail.com', '123456');

      print('#### User ID: ${user.id}');
      print('#### Access Token: ${user.accessToken}');
      print('#### Refresh Token: ${user.refreshToken}');

      YodNavigator().pushNamed(context, RouteNameTravel.travelMainApp);
    } catch (e) {
      print('Login error: $e');
    }
  }

  void _login() {
    if (_formKey.currentState!.validate()) {
      handleLogin();
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
        backgroundColor: theme.primaryColor,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                controller: _emailController,
                decoration: InputDecoration(
                  labelText: 'Email',
                  border: OutlineInputBorder(),
                  filled: true,
                  fillColor: theme.inputDecorationTheme.fillColor,
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your email';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _passwordController,
                decoration: InputDecoration(
                  labelText: 'Password',
                  border: OutlineInputBorder(),
                  filled: true,
                  fillColor: theme.inputDecorationTheme.fillColor,
                ),
                obscureText: true,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your password';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: _login,
                style: ElevatedButton.styleFrom(
                  backgroundColor: theme.primaryColor,
                  foregroundColor: theme.colorScheme.onPrimary,
                ),
                child: const Text('Login'),
              ),
            ],
          ),
        ),
      ),
    );
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
