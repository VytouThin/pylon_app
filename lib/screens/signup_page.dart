/* import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:app/providers/auth_provider.dart';

class SignupPage extends ConsumerStatefulWidget {
  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends ConsumerState<SignupPage> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  final _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Sign Up')),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _usernameController,
              decoration: InputDecoration(labelText: 'Username'),
            ),
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
              onPressed: () async {
                final username = _usernameController.text;
                final email = _emailController.text;
                final password = _passwordController.text;
                final response = await ref
                    .read(authProvider)
                    .signup(username, password, email);
                if (response.statusCode == 200) {
                  // Navigate to the login page
                  Navigator.pushReplacementNamed(context, '/login');
                } else {
                  // Show error message
                  ScaffoldMessenger.of(context)
                      .showSnackBar(SnackBar(content: Text('Signup failed')));
                }
              },
              child: Text('Sign Up'),
            ),
            TextButton(
              onPressed: () {
                Navigator.pushReplacementNamed(context, '/login');
              },
              child: Text('Login'),
              style: TextButton.styleFrom(
                primary:
                    Theme.of(context).primaryColor, // Use app's primary color
              ),
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

class SignupPage extends ConsumerStatefulWidget {
  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends ConsumerState<SignupPage> {
  final _usernameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _formKey =
      GlobalKey<FormState>(); // Add a GlobalKey for form validation

  String? _usernameError;
  String? _emailError;
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
        title: Text('Sign Up'),
        centerTitle: true, // Center the title for better aesthetics
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 24.0, vertical: 32.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment:
                CrossAxisAlignment.stretch, // Align widgets horizontally
            children: [
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
                controller: _emailController,
                decoration: InputDecoration(
                  labelText: 'Email',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  errorText: _emailError, // Display error message if present
                ),
                keyboardType:
                    TextInputType.emailAddress, // Set keyboard type for email
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    setState(() {
                      _emailError = 'Email is required';
                    });
                    return _emailError;
                  }
                  // Basic email validation (can be improved)
                  if (!RegExp(
                          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+\.[a-zA-Z]+")
                      .hasMatch(value)) {
                    setState(() {
                      _emailError = 'Invalid email format';
                    });
                    return _emailError;
                  }
                  setState(() {
                    _emailError = null; // Reset error message if valid
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
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    // Username, email, and password are valid, proceed with signup logic (replace with your implementation)
                    final username = _usernameController.text;
                    final email = _emailController.text;
                    final password = _passwordController.text;
                    final response = ref
                        .read(authProvider)
                        .signup(username, password, email);
                    if (response) {
                      // Login successful, navigate to desired page (replace with your logic)
                      Navigator.pushReplacementNamed(context, '/employees');
                    } else {
                      // Login failed, show error message
                      ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('Register failed')));
                    }
                  }
                },
                child: Text('Sign Up'),
              ),
              SizedBox(height: 16.0), // Spacing between buttons
              Row(
                mainAxisAlignment:
                    MainAxisAlignment.center, // Center text buttons
                children: [
                  Text('Already have an account?'),
                  SizedBox(width: 8.0), // Spacing between text and button
                  TextButton(
                    onPressed: () {
                      Navigator.pushReplacementNamed(context, '/login');
                    },
                    child: Text('Login'),
                    style: TextButton.styleFrom(
                      primary: Theme.of(context)
                          .primaryColor, // Use app's primary color
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
