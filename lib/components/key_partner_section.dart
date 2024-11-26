import 'package:flutter/material.dart';

class KeyPartnerSection extends StatelessWidget {
  const KeyPartnerSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'KEY PARTNER',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.start, // To avoid overflow
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.asset(
                      'assets/at-logo.png',
                      width:
                          100, // Specify width and height to avoid layout issues
                      height: 50,
                    ),
                    const Text(
                      'Africa\'s Talking',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Text(
                      'Airtime, Sms, USSD, Voice, Mobile Data, and Chat API\'s Provider',
                      style: TextStyle(
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    _buildIcon('Airtime', 'assets/airtime.png', '\$'),
                    _buildIcon('SMS', 'assets/sms.png', 'Chat'),
                    _buildIcon('USSD', 'assets/ussd.png', '*483#'),
                    _buildIcon('Voice', 'assets/voice.png', 'Voice'),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildIcon(String title, String imagePath, String label) {
    return Column(
      children: [
        Image.asset(
          imagePath,
          width: 50, // Set a consistent size for the images
          height: 50,
        ),
        Text(label),
        Text(title, style: const TextStyle(fontSize: 10)),
      ],
    );
  }
}
