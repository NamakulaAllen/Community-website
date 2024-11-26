import 'package:flutter/material.dart';
import '../components/footer.dart'; // Adjust to your actual path

class ContactUsPage extends StatelessWidget {
  const ContactUsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Image.asset(
              'assets/images/afric.png',
              height: 150,
              width: 150,
            ),
            const SizedBox(width: 10), // Spacing between logo and title
          ],
        ),
        backgroundColor: const Color(0xFF0C2939),
        centerTitle: false, // Title aligned left with logo
      ),
      body: Column(
        children: [
          // Scrollable content for form and information
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  // Right Section: Contact Information and Form
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        flex: 2,
                        child: Align(
                          alignment: Alignment.centerRight,
                          child: Container(
                            padding: const EdgeInsets.all(20),
                            width: MediaQuery.of(context).size.width * 0.4,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: const [
                                BoxShadow(
                                  color: Colors.black12,
                                  blurRadius: 10.0,
                                  offset: Offset(0, 2),
                                ),
                              ],
                            ),
                            child: Column(
                              children: [
                                // Heading
                                const Text(
                                  'We\'d love to hear from you!',
                                  style: TextStyle(
                                    fontSize: 28,
                                    fontWeight: FontWeight.bold,
                                    color: Color(
                                        0xFFEA8C24), // Green color for text
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                                const SizedBox(height: 20),
                                const Text(
                                  'Feel free to reach out to us for any inquiries, support, or feedback.',
                                  style: TextStyle(
                                      fontSize: 16,
                                      color: Color(
                                          0xFFEA8C24)), // Green color for text
                                  textAlign: TextAlign.center,
                                ),
                                const SizedBox(height: 40),
                                const Text(
                                  'CONTACT INFORMATION:',
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: Color(0xFF109347)),
                                ),
                                const SizedBox(height: 10),
                                const Text(
                                  'Email: atwitcomm@gmail.com',
                                  style: TextStyle(
                                      fontSize: 16,
                                      color: Color(
                                          0xFFEA8C24)), // Green color for text
                                ),
                                const SizedBox(height: 10),
                                const Text(
                                  'Phone: +256 753 117500',
                                  style: TextStyle(
                                      fontSize: 16,
                                      color: Color(
                                          0xFFEA8C24)), // Green color for text
                                ),
                                const SizedBox(height: 30),
                                const Text(
                                  'Send us a message:',
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: Color(0xFFEA8C24)),
                                ),
                                const SizedBox(height: 10),
                                const TextField(
                                  decoration: InputDecoration(
                                    labelText: 'Your Name',
                                    labelStyle:
                                        TextStyle(color: Color(0xFFEA8C24)),
                                    border: OutlineInputBorder(),
                                  ),
                                ),
                                const SizedBox(height: 15),
                                const TextField(
                                  decoration: InputDecoration(
                                    labelText: 'Email',
                                    labelStyle:
                                        TextStyle(color: Color(0xFFEA8C24)),
                                    border: OutlineInputBorder(),
                                  ),
                                ),
                                const SizedBox(height: 15),
                                const TextField(
                                  decoration: InputDecoration(
                                    labelText: 'Message',
                                    labelStyle:
                                        TextStyle(color: Color(0xFFEA8C24)),
                                    border: OutlineInputBorder(),
                                  ),
                                  maxLines: 4,
                                ),
                                const SizedBox(height: 20),
                                ElevatedButton(
                                  onPressed: () {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                          content: Text('Message Sent!')),
                                    );
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: const Color(0xFF109347),
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 40, vertical: 15),
                                    textStyle: const TextStyle(fontSize: 16),
                                  ),
                                  child: const Text(
                                    'Submit',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          // Footer placed after the content
          const Footer(),
        ],
      ),
    );
  }
}
