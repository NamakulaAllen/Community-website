import 'package:flutter/material.dart';
import 'login-screen.dart'; // Ensure to import the LoginScreen

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  String? _developerType; // This will hold the selected value from the dropdown

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Remove the AppBar title and use a container for the title
      appBar: AppBar(
        backgroundColor:
            Colors.transparent, // Makes the app bar background transparent
        elevation: 0, // Removes the app bar shadow
      ),
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(16.0),
          width: 300, // Set the desired width for the form
          constraints: const BoxConstraints(
            maxHeight: 600, // Increased max height to accommodate more fields
          ),
          decoration: BoxDecoration(
            color: Colors.white, // White background for the form
            borderRadius: BorderRadius.circular(12.0), // Rounded corners
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
              // Title inside the container
              const Padding(
                padding: EdgeInsets.only(bottom: 20),
                child: Text(
                  'Create an Account',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              // Email input
              const TextField(
                decoration: InputDecoration(labelText: 'Email'),
              ),
              const SizedBox(height: 20),
              // Phone Number input
              const TextField(
                decoration: InputDecoration(labelText: 'Phone Number'),
                keyboardType:
                    TextInputType.phone, // Ensures phone keyboard shows
              ),
              const SizedBox(height: 20),
              // Password input
              const TextField(
                decoration: InputDecoration(labelText: 'Password'),
                obscureText: true,
              ),
              const SizedBox(height: 20),
              // Confirm Password input
              const TextField(
                decoration: InputDecoration(labelText: 'Confirm Password'),
                obscureText: true,
              ),
              const SizedBox(height: 20),
              // Developer Type Dropdown
              DropdownButtonFormField<String>(
                value: _developerType, // Set the current value of the dropdown
                items: [
                  DropdownMenuItem(
                      value: 'Full Stack', child: Text('Full Stack')),
                  DropdownMenuItem(
                      value: 'Front End', child: Text('Front End')),
                  DropdownMenuItem(value: 'Back End', child: Text('Back End')),
                  DropdownMenuItem(value: 'Other', child: Text('Other')),
                ],
                onChanged: (String? newValue) {
                  setState(() {
                    _developerType = newValue; // Update the selected value
                  });
                },
                decoration: InputDecoration(labelText: 'Select Developer Type'),
              ),
              const SizedBox(height: 20),
              // Centered Sign Up Button with Green Color
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    // Navigate to the Login Screen when the user clicks Sign Up
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => LoginScreen()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(
                        0xFF109347), // Set button background color to green
                  ),
                  child: const Text(
                    'Sign Up',
                    style: TextStyle(
                      color: Colors.white, // Set the text color to white
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              // Back to login button
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Already have an account?',
                    style: TextStyle(
                      color: Colors.white, // Set the text color to white
                      fontSize: 16,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      // Navigate back to the Login Screen
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => LoginScreen()),
                      );
                    },
                    style: TextButton.styleFrom(
                      foregroundColor:
                          Colors.green, // Set the text button color to green
                    ),
                    child: const Text('Login'),
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
