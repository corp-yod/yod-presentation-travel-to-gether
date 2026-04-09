import 'package:flutter/material.dart';
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
}
