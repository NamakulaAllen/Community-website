import 'package:flutter/material.dart';
import '../components/footer.dart';
import 'sign_up_screen.dart'; // Make sure to import the SignUpScreen

class LoginScreen extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Image.asset(
              'assets/images/afric.png',
              height: 150, // Adjusted height
              width: 150, // Adjusted width
            ),
            const SizedBox(width: 10),
          ],
        ),
        backgroundColor: const Color(0xFF0C2939),
      ),
      body: Column(
        children: [
          Expanded(
            child: Center(
              child: SingleChildScrollView(
                child: Container(
                  padding: const EdgeInsets.all(16.0),
                  width: 350, // Decreased width to make the form more compact
                  constraints: const BoxConstraints(
                    maxHeight: 400, // Limit the height of the form
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white, // White background color for the form
                    borderRadius:
                        BorderRadius.circular(12.0), // Rounded corners
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black26,
                        offset: Offset(0, 4), // Horizontal and Vertical offset
                        blurRadius: 10, // Blur effect
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Text(
                        'Log in to your account',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 20),
                      // Email Input
                      TextField(
                        controller: emailController,
                        decoration: InputDecoration(
                          labelText: 'Email',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),
                      // Password Input
                      TextField(
                        controller: passwordController,
                        obscureText: true,
                        decoration: InputDecoration(
                          labelText: 'Password',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      // Login Button
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {
                            // Handle login logic here
                            String email = emailController.text;
                            String password = passwordController.text;
                            print('Email: $email, Password: $password');
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(
                                0xFF109347), // Green background color
                            padding: const EdgeInsets.symmetric(vertical: 16),
                          ),
                          child: const Text(
                            'Log In',
                            style: TextStyle(
                              color: Colors.white, // White text color
                              fontWeight: FontWeight.bold, // Bold text
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      // Register Redirect Text
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text("Don't have an account yet? "),
                          GestureDetector(
                            onTap: () {
                              // Navigate to SignUp Screen
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const SignUpScreen(),
                                ),
                              );
                            },
                            child: const Text(
                              'Register',
                              style: TextStyle(
                                color: Color(0xFFEA8C24),
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      // Forgot Password
                      GestureDetector(
                        onTap: () {
                          // Implement forgot password functionality here
                        },
                        child: const Text(
                          'Forgot your password?',
                          style: TextStyle(
                            color: Color(0xFFEA8C24),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          const Footer(), // Footer widget at the bottom
        ],
      ),
    );
  }
}
