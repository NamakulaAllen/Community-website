// import 'package:flutter/material.dart';
// import 'package:community_website/components/app_bar.dart';
// // import 'package:community_website/components/footer.dart';

// class MainLayout extends StatelessWidget {
//   final Widget child; // The content of each page will go here

//   const MainLayout({super.key, required this.child});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: const CustomAppBar(
//         'Community Website',
//         title: 'community website', onBackPressed: () {  },
//       ), // Add the AppBar here
//       body: SafeArea(
//         child: Column(
//           children: [
//             Expanded(
//               child: SingleChildScrollView(
//                 child: child, // The child widget will be the page content
//               ),
//             ),
//             // const Footer(), // Add the Footer here
//           ],
//         ),
//       ),
//     );
//   }
// }
