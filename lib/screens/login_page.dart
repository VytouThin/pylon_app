/* import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:app/providers/auth_provider.dart';

class LoginPage extends ConsumerStatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends ConsumerState<LoginPage> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Login')),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _usernameController,
              decoration: InputDecoration(labelText: 'Username'),
            ),
            TextField(
              controller: _passwordController,
              decoration: InputDecoration(labelText: 'Password'),
              obscureText: true,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                // final username = _usernameController.text;
                // final password = _passwordController.text;
                // final response =
                //     await ref.read(authProvider).login(username, password);
                // if (response.statusCode == 200) {
                //   // Navigate to the employee list page
                //   // ref.read(authStateProvider).state = true;
                Navigator.pushReplacementNamed(context, '/employees');
                // } else {
                //   // Show error message
                //   ScaffoldMessenger.of(context)
                //       .showSnackBar(SnackBar(content: Text('Login failed')));
                // }
              },
              child: Text('Login'),
            ),
            GestureDetector(
              onTap: () async {
                // final username = _usernameController.text;
                // final password = _passwordController.text;
                // final response =
                //     await ref.read(authProvider).login(username, password);
                // if (response.statusCode == 200) {
                //   // Navigate to the employee list page
                //   // ref.read(authStateProvider).state = true;
                Navigator.pushReplacementNamed(context, '/signup');
                // } else {
                //   // Show error message
                //   ScaffoldMessenger.of(context)
                //       .showSnackBar(SnackBar(content: Text('Login failed')));
                // }
              },
              child: Text('Signup'),
            ),
          ],
        ),
      ),
    );
  }
}
 */

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:app/providers/auth_provider.dart';

// final authProvider = Provider((ref) => AuthProvider());

class LoginPage extends ConsumerStatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends ConsumerState<LoginPage> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  final _formKey =
      GlobalKey<FormState>(); // Add a GlobalKey for form validation

  String? _usernameError;
  String? _passwordError;
  bool _obscureText = true;

  void _togglePasswordVisibility() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
        centerTitle: true, // Center the title for better aesthetics
      ),
      body: SingleChildScrollView(
        // Allow scrolling if keyboard hides content on small screens
        padding: EdgeInsets.symmetric(horizontal: 24.0, vertical: 32.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment:
                CrossAxisAlignment.stretch, // Align widgets horizontally
            children: [
              // Optional logo/app name
              // SizedBox(height: 20.0),

              TextFormField(
                controller: _usernameController,
                decoration: InputDecoration(
                  labelText: 'Username',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  errorText: _usernameError, // Display error message if present
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    setState(() {
                      _usernameError = 'Username is required';
                    });
                    return _usernameError;
                  }
                  setState(() {
                    _usernameError = null; // Reset error message if valid
                  });
                  return null;
                },
              ),
              SizedBox(height: 16.0), // Spacing between text fields
              TextFormField(
                controller: _passwordController,
                decoration: InputDecoration(
                  labelText: 'Password',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  suffixIcon: IconButton(
                    icon: Icon(
                      _obscureText ? Icons.visibility_off : Icons.visibility,
                    ),
                    onPressed: _togglePasswordVisibility,
                  ),
                  errorText: _passwordError, // Display error message if present
                ),
                obscureText: _obscureText,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    setState(() {
                      _passwordError = 'Password is required';
                    });
                    return _passwordError;
                  }
                  setState(() {
                    _passwordError = null; // Reset error message if valid
                  });
                  return null;
                },
              ),
              SizedBox(height: 24.0), // Spacing before buttons
              ElevatedButton(
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    // Username and password are valid, proceed with login logic
                    final username = _usernameController.text;
                    final password = _passwordController.text;
                    final response =
                        await ref.read(authProvider).login(username, password);
                    if (response) {
                      // Login successful, navigate to desired page (replace with your logic)
                      Navigator.pushReplacementNamed(context, '/employees');
                    } else {
                      // Login failed, show error message
                      ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('Login failed')));
                    }
                  }
                },
                child: Text('Login'),
              ),
              SizedBox(height: 16.0), // Spacing between buttons
              TextButton(
                onPressed: () {
                  Navigator.pushReplacementNamed(context, '/signup');
                },
                child: Text('Signup'),
                style: TextButton.styleFrom(
                  primary:
                      Theme.of(context).primaryColor, // Use app's primary color
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
