import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class HeroSection extends StatefulWidget {
  const HeroSection({super.key});

  @override
  _HeroSectionState createState() => _HeroSectionState();
}

class _HeroSectionState extends State<HeroSection>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _offsetAnimation;

  @override
  void initState() {
    super.initState();
    // Animation controller for controlling the slide-in effect
    _controller = AnimationController(
      duration: const Duration(seconds: 2), // Adjust duration as needed
      vsync: this,
    );

    // Offset animation for slide-in effect
    _offsetAnimation =
        Tween<Offset>(begin: const Offset(0, 1), end: Offset.zero)
            .animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeOut, // Choose your preferred curve
    ));

    // Start the animation when the widget is built
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Future<void> _joinWhatsAppGroup() async {
    final Uri whatsappUri = Uri.parse(
        'https://chat.whatsapp.com/BZqvnXZJufi4JIble43Dtl'); // WhatsApp group link
    if (await canLaunchUrl(whatsappUri)) {
      await launchUrl(whatsappUri, mode: LaunchMode.externalApplication);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Could not open WhatsApp')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          // Hero Section with Image and Text
          Stack(
            children: [
              Image.asset(
                'assets/images/PIC1.jpg', // Replace with your asset path
                height: 500,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                  color: const Color(0xFF109347)
                      .withOpacity(0.7), // Green color applied
                  child: const Text(
                    'Welcome to AT Women In Tech Community',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color(0xFFEA8C24),
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),

          // Green Section with Animated Paragraph Text
          Container(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 200),
            color:
                const Color(0xFF109347).withOpacity(0.7), // Green color applied
            child: Column(
              children: [
                const Text(
                  'Empowering Women to Lead in Technology and Innovation',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 12),
                // Animated sliding text
                SlideTransition(
                  position: _offsetAnimation,
                  child: const Text(
                    'At WIT Community strives to inspire and support women in technology '
                    'through mentorship, skills development, and collaboration. '
                    'Join us on this journey to build a brighter future in tech together.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: _joinWhatsAppGroup,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFEA8C24),
                    padding: const EdgeInsets.symmetric(
                        vertical: 12, horizontal: 20),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: const Text(
                    'JOIN COMMUNITY GROUP',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ),
              ],
            ),
          ),

          // Section with Rounded Images and Key Partners
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Images Section with Larger, Rounded Images
                Expanded(
                  flex: 3,
                  child: Wrap(
                    alignment: WrapAlignment.center,
                    spacing:
                        -40, // Negative space between images to overlap them
                    runSpacing: 16, // Space between rows
                    children: [
                      ClipOval(
                        child: Image.asset(
                          'assets/images/image1.jpg', // Replace with your asset path
                          height: 150,
                          width: 150,
                          fit: BoxFit.cover,
                        ),
                      ),
                      ClipOval(
                        child: Image.asset(
                          'assets/images/image2.jpg', // Replace with your asset path
                          height: 150,
                          width: 150,
                          fit: BoxFit.cover,
                        ),
                      ),
                      ClipOval(
                        child: Image.asset(
                          'assets/images/image3.jpg', // Replace with your asset path
                          height: 150,
                          width: 150,
                          fit: BoxFit.cover,
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.all(16.0),
                        child: Text(
                          'Women In Tech Inspiring Fellow Women In, Relation With The Advancing Technology',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            fontSize: 20,
                            color: Color(0xFF109347),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 8), // Reduced space here

                // Key Partner Section with Shadow Effect and White Background
                Expanded(
                  flex: 2,
                  child: Container(
                    padding:
                        const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey.shade300),
                      borderRadius: BorderRadius.circular(12),
                      color: Colors.white, // White background
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1), // Shadow color
                          blurRadius: 8, // Softness of the shadow
                          offset: const Offset(0, 4), // Position of the shadow
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Text(
                          'KEY PARTNER',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                            color: Color(0xFF109347),
                          ),
                        ),
                        Wrap(
                          alignment: WrapAlignment.center,
                          spacing: 16,
                          runSpacing: 16,
                          children: [
                            Row(
                              children: [
                                Image.asset(
                                  'assets/images/africa1.png',
                                  height: 120,
                                  width: 120,
                                  fit: BoxFit.contain,
                                ),
                                const SizedBox(width: 8),
                                const Expanded(
                                  child: Text(
                                    'Airtime, SMS, USSD, Voice, Mobile Data, and Chat API’s Provider.',
                                    style: TextStyle(
                                      fontSize: 18,
                                      color: Color(0xFFEA8C24),
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            ClipOval(
                              child: Image.asset(
                                'assets/images/sms1.png',
                                height: 50,
                                width: 50,
                                fit: BoxFit.cover,
                              ),
                            ),
                            ClipOval(
                              child: Image.asset(
                                'assets/images/airtime1.png',
                                height: 50,
                                width: 50,
                                fit: BoxFit.cover,
                              ),
                            ),
                            ClipOval(
                              child: Image.asset(
                                'assets/images/ussd1.png',
                                height: 50,
                                width: 50,
                                fit: BoxFit.cover,
                              ),
                            ),
                            ClipOval(
                              child: Image.asset(
                                'assets/images/voice1.png',
                                height: 50,
                                width: 50,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
