import 'package:flutter/material.dart';

class AboutUsPage extends StatelessWidget {
  const AboutUsPage({Key? key}) : super(key: key);

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
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(16.0),
          width: double.infinity, // Allow container to take full width
          constraints:
              const BoxConstraints(maxWidth: 800), // Max width of content
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: Colors.black26,
                blurRadius: 8,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Introduction Section
                const Text(
                  "Welcome to A Women in Technology!",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.orange,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 10),
                const Text(
                  "We are a platform dedicated to empowering women across Africa in the field of technology. Through collaboration, innovation, and education, we aim to bridge the gender gap in tech and provide opportunities for women to excel in this dynamic industry.",
                  style: TextStyle(fontSize: 16, color: Colors.black87),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 20),

                // Mission Section
                const Text(
                  "Our Mission",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.orange,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 10),
                const Text(
                  "To create a supportive ecosystem that inspires, trains, and empowers women to thrive in technology, unlocking their potential to lead and innovate in Africa's digital transformation.",
                  style: TextStyle(fontSize: 16, color: Colors.black87),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 20),

                // Vision Section
                const Text(
                  "Our Vision",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.orange,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 10),
                const Text(
                  "A future where African women lead the way in technology, driving economic growth, social progress, and innovation across the continent and beyond.",
                  style: TextStyle(fontSize: 16, color: Colors.black87),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 20),

                // Values Section
                const Text(
                  "Our Core Values",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.orange,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 10),
                const ListTile(
                  leading: Icon(Icons.check_circle, color: Colors.orange),
                  title: Text(
                    "Empowerment: Providing tools and opportunities for women to succeed in tech.",
                    style: TextStyle(fontSize: 16, color: Colors.black87),
                  ),
                ),
                const ListTile(
                  leading: Icon(Icons.check_circle, color: Colors.orange),
                  title: Text(
                    "Innovation: Encouraging creativity and problem-solving to shape the future.",
                    style: TextStyle(fontSize: 16, color: Colors.black87),
                  ),
                ),
                const ListTile(
                  leading: Icon(Icons.check_circle, color: Colors.orange),
                  title: Text(
                    "Collaboration: Building a network of support through partnerships and teamwork.",
                    style: TextStyle(fontSize: 16, color: Colors.black87),
                  ),
                ),
                const ListTile(
                  leading: Icon(Icons.check_circle, color: Colors.orange),
                  title: Text(
                    "Inclusivity: Fostering a diverse and equitable environment for all women.",
                    style: TextStyle(fontSize: 16, color: Colors.black87),
                  ),
                ),
                const SizedBox(height: 20),

                // Meet the Team Section
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Meet Our Team',
                      // style: TextAlign(Center),
                      style: TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 10),
                    // Team Member 1
                    Row(
                      children: [
                        CircleAvatar(
                          radius: 40,
                          backgroundImage:
                              AssetImage('assets/images/team1.jpg'),
                          // Ensure this image path exists
                        ),
                        const SizedBox(width: 15),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text(
                              'Janet',
                              style: TextStyle(
                                  fontSize: 22, fontWeight: FontWeight.bold),
                            ),
                            SizedBox(height: 5),
                            Text(
                              'Assistant',
                              style: TextStyle(
                                  fontSize: 18, color: Colors.black54),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    // Team Member 2
                    Row(
                      children: [
                        CircleAvatar(
                          radius: 40,
                          backgroundImage:
                              AssetImage('assets/images/team2.jpg'),
                          // Ensure this image path exists
                        ),
                        const SizedBox(width: 15),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text(
                              'Jane Smith',
                              style: TextStyle(
                                  fontSize: 22, fontWeight: FontWeight.bold),
                            ),
                            SizedBox(height: 5),
                            Text(
                              'Chief Technology Officer',
                              style: TextStyle(
                                  fontSize: 18, color: Colors.black54),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 30),

                // Call to Action Section
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: const Color(0xFF0C2939),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: TextButton(
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                            content: Text('Thank you for your interest!')),
                      );
                    },
                    child: const Text(
                      'Get in Touch with Us!',
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                const SizedBox(height: 40),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// Method to show the About Us page as a dialog
void showAboutUsDialog(BuildContext context) {
  showDialog(
    context: context,
    barrierDismissible: true, // Allows dismiss by tapping outside
    builder: (BuildContext context) {
      return Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        child: const AboutUsPage(),
      );
    },
  );
}
