import 'package:flutter/material.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final String emailDomain = '@northsouth.edu'; // Fixed domain

  @override
  void initState() {
    super.initState();
    _emailController.text = '@northsouth.edu'; // Initial empty state
  }

  // Function to validate email
  bool _isValidEmail(String email) {
    return email.endsWith(emailDomain);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [const Color.fromARGB(255, 255, 255, 255), const Color.fromARGB(255, 255, 255, 255)], // Gradient colors
            begin: Alignment.topLeft, // Starting point of the gradient
            end: Alignment.bottomRight, // Ending point of the gradient
          ),
        ),
         child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  // Use your own image as an icon here
                  Image.asset(
                    'assets/images/car1.png', // Path to your image in assets
                    width: 300,
                    height: 300,
                  ),
        
                  const SizedBox(height: 40),

                  // Email Text Field (Fixed @northsouth.edu domain)
                  TextField(
                    controller: _emailController,
                    style: const TextStyle(color: Colors.white),
                    
                    decoration: InputDecoration(
                      labelText: 'Email',
                      labelStyle: const TextStyle(color: Colors.white),
                      hintText: 'Enter your email',
                      prefixIcon: const Icon(Icons.email, color: Colors.white),
                      suffixText: emailDomain,  // The domain part is fixed here
                      suffixStyle: const TextStyle(color: Colors.transparent), // Hide the domain
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(color: Colors.white),
                      ),
                      filled: true,
                      fillColor: Colors.deepPurple.shade600,
                    ),
                    keyboardType: TextInputType.emailAddress,
                    textInputAction: TextInputAction.next,
                    onChanged: (value) {
                      // Append @northsouth.edu if the user types before the '@'
                      if (!value.contains('@')) {
                        _emailController.text = value + emailDomain;
                        _emailController.selection = TextSelection.collapsed(offset: _emailController.text.length);
                      } else {
                        if (!_emailController.text.endsWith(emailDomain)) {
                          _emailController.text = value.split('@')[0] + emailDomain;
                        }
                      }
                    },
                  ),
                  const SizedBox(height: 20),

                  // Password Text Field
                  TextField(
                    controller: _passwordController,
                    obscureText: true,
                    decoration: InputDecoration(
                      labelText: 'Password',
                      labelStyle: const TextStyle(color: Colors.white),
                      hintText: 'Enter your password',
                      prefixIcon: const Icon(Icons.lock, color: Colors.white),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(color: Colors.white),
                      ),
                      filled: true,
                      fillColor: Colors.deepPurple.shade600,
                    ),
                    textInputAction: TextInputAction.done,
                  ),
                  const SizedBox(height: 30),

                  // Sign In Button
                  ElevatedButton(
                    onPressed: () {
                      String email = _emailController.text.trim();
                      String password = _passwordController.text.trim();

                      // Check if the email ends with @northsouth.edu
                      if (!_isValidEmail(email)) {
                        // Show error message if email is not valid
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Only @northsouth.edu email can sign in.'),
                            backgroundColor: Colors.red,
                          ),
                        );
                      } else {
                        // Add your sign-in logic here
                        // For now, just print the email and password
                        print('Email: $email');
                        print('Password: $password');
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.deepPurple,
                      minimumSize: const Size(double.infinity, 50),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: const Text(
                      'Sign In',
                      style: TextStyle(fontSize: 18, color: Colors.white),
                    ),
                  ),
                  const SizedBox(height: 20),

                  // Forgot Password Link
                  TextButton(
                    onPressed: () {
                      // Add your forgot password logic here
                    },
                    child: const Text(
                      'Forgot Password?',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  const SizedBox(height: 20),

                  // Sign Up Redirect
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      const Text(
                        'Don\'t have an account?',
                        style: TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
                      ),
                      TextButton(
                        onPressed: () {
                          // Add your sign-up redirection logic here
                        },
                        child: const Text(
                          'Sign Up',
                          style: TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
