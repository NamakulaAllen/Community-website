import 'package:flutter/material.dart';
import 'package:community_website/screens/login-screen.dart'; // Corrected import path
import 'package:community_website/screens/achievements_page.dart'; // Import the AchievementsPage
import 'package:community_website/screens/events_page.dart'; // Import the EventsPage
import 'package:community_website/screens/gallery_page.dart'; // Import the GalleryPage
import 'package:community_website/screens/about_us_page.dart'; // Import the AboutUsPage
import 'package:community_website/screens/contact_us_page.dart'; // Import the ContactUsPage

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title; // Removed the unnecessary String s parameter

  const CustomAppBar(String s,
      {super.key,
      required this.title,
      required Null Function() onBackPressed}); // Constructor fixed

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AppBar(
          backgroundColor: const Color(0xFF0C2939), // AppBar background color
          title: Image.asset(
            'assets/images/afric.png', // Replace with your logo's path
            height: 150, // Adjust logo size
          ),
        ),
        Container(
          color: Colors.white, // Background color for the navigation bar
          padding: const EdgeInsets.symmetric(
              vertical: 10), // Reduced padding for less height
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.center, // Center the buttons
            children: [
              NavBarButton(text: "HOME"),
              NavBarButton(text: "EVENTS"), // Button for events page
              NavBarButton(text: "ABOUT US"),
              NavBarButton(
                  text: "ACHIEVEMENTS"), // Button for achievements page
              NavBarButton(text: "GALLERY"),
              NavBarButton(text: "CONTACT US"), // Button for contact us page
              NavBarButton(text: "LOGIN"),
            ],
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(
      kToolbarHeight + 55); // Adjusted for balanced height
}

class NavBarButton extends StatelessWidget {
  final String text;

  const NavBarButton({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          const EdgeInsets.symmetric(horizontal: 8), // Spacing between buttons
      child: TextButton(
        onPressed: () {
          // Navigate to different screens based on button text
          if (text == "LOGIN") {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => LoginScreen()),
            );
          } else if (text == "ACHIEVEMENTS") {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const AchievementsPage()),
            );
          } else if (text == "EVENTS") {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const EventsPage()),
            );
          } else if (text == "GALLERY") {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const GalleryPage()),
            );
          } else if (text == "ABOUT US") {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const AboutUsPage()),
            );
          } else if (text == "CONTACT US") {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      const ContactUsPage()), // Navigate to ContactUsPage
            );
          }
        },
        child: Text(
          text,
          style: const TextStyle(
            color: Color(0xFFEA8C24), // Updated orange color
            fontSize: 16, // Font size for better visibility
            fontWeight: FontWeight.bold, // Bold text
          ),
        ),
      ),
    );
  }
}
