import 'package:flutter/material.dart';
import 'package:your_package_name/firestore_service.dart'; // Adjust the import based on your package structure

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _isLoginMode = true;
  String _errorMessage = '';

  void _toggleMode() {
    setState(() {
      _isLoginMode = !_isLoginMode;
      _errorMessage = ''; // clear error message when toggling
    });
  }

  void _authenticate() async {
    final email = _emailController.text;
    final password = _passwordController.text;
    try {
      if (_isLoginMode) {
        await FirestoreService.login(email, password);
      } else {
        await FirestoreService.signup(email, password);
      }
      // Navigate to home page or show success message
    } catch (error) {
      setState(() {
        _errorMessage = error.toString();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_isLoginMode ? 'Login' : 'Sign Up'),
        actions: [
          TextButton(
            onPressed: _toggleMode,
            child: Text(
              _isLoginMode ? 'Create an account' : 'I already have an account',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[ 
            if (_errorMessage.isNotEmpty) ...[
              Text(
                _errorMessage,
                style: TextStyle(color: Colors.red),
              ),
              SizedBox(height: 20),
            ],
            TextField(
              controller: _emailController,
              decoration: InputDecoration(labelText: 'Email'),
            ),
            TextField(
              controller: _passwordController,
              decoration: InputDecoration(labelText: 'Password'),
              obscureText: true,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _authenticate,
              child: Text(_isLoginMode ? 'Login' : 'Sign Up'),
            ),
          ],
        ),
      ),
    );
  }
}
