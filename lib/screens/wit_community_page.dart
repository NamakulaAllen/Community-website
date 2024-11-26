import 'package:flutter/material.dart';
import '../components/app_bar.dart';
import '../components/hero_section.dart';
// import '../components/image_grid_section.dart';
// import '../components/key_partner_section.dart';
import '../components/footer.dart';

class WITCommunityPage extends StatelessWidget {
  const WITCommunityPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        'Community',
        title: 'WIT Community',
        onBackPressed: () {},
      ), // Pass the required argument here
      body: const SingleChildScrollView(
        child: Column(
          children: [
            HeroSection(),
            SizedBox(height: 20),
            // ImageGridSection(),
            SizedBox(height: 20),
            // KeyPartnerSection(),
            SizedBox(height: 20),
            Footer(),
          ],
        ),
      ),
    );
  }
}
