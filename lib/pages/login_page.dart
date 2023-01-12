import 'package:flutter/material.dart';
import 'package:testing_flutter_apps/models/login_result.dart';
import 'package:testing_flutter_apps/pages/change_password_page.dart';
import 'package:testing_flutter_apps/pages/home_page.dart';
import 'package:testing_flutter_apps/services/user_service.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final UserService _userService = UserService();

  String _textError = '';

  void _setTextError(String textError) {
    setState(() {
      _textError = textError;
    });
  }

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 32.0),
        child: Center(
          child: Column(
            children: <Widget>[
              Text(
                'Login',
                style: Theme.of(context).textTheme.headline4,
              ),
              const SizedBox(height: 32.0),
              SizedBox(
                width: 320.0,
                child: TextField(
                  key: const Key('textfield_username'),
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Username',
                    hintText: 'Enter username',
                  ),
                  controller: _usernameController,
                  textInputAction: TextInputAction.next,
                ),
              ),
              const SizedBox(height: 16.0),
              SizedBox(
                width: 320.0,
                child: TextField(
                  key: const Key('textfield_password'),
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Password',
                    hintText: 'Enter password',
                  ),
                  controller: _passwordController,
                  obscureText: true,
                  keyboardType: TextInputType.visiblePassword,
                  textInputAction: TextInputAction.done,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: Text(
                  _textError,
                  key: const Key('text_error'),
                  style: const TextStyle(color: Colors.red),
                ),
              ),
              // const SizedBox(height: 32.0),
              ElevatedButton(
                key: const Key('button_signin'),
                child: const Text('Sign In'),
                onPressed: () => _onSignInPressed(context),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _onSignInPressed(BuildContext context) async {
    _setTextError('');
    String username = _usernameController.text;
    String password = _passwordController.text;
    LoginResult result = await _userService.login(username, password);
    if (result.status == 'SUCCESS') {
      if (mounted) {
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (_) => HomePage(username: username)));
      }
    } else {
      _usernameController.clear();
      _passwordController.clear();
      if (result.message == 'WRONG_USERNAME_OR_PASSWORD') {
        _setTextError(result.message!);
      } else if (result.message == 'ACCOUNT_LOCK') {
        _setTextError(result.message!);
      } else if (result.message == 'FORCE_CHANGE_PASSWORD') {
        if (mounted) {
          Navigator.push(context,
              MaterialPageRoute(builder: (_) => const ChangePasswordPage()));
        }
      }
    }
  }
}
