import 'package:flutter/material.dart';

class Footer extends StatelessWidget {
  const Footer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFFEA8C24),
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Row to display 'FIND US', 'LEGAL', 'RESOURCES' in the same line
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              // 'FIND US' Section
              Column(
                children: [
                  const Text(
                    'FIND US',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                        onPressed: () {}, // Instagram link action
                        icon: Image.asset(
                          'assets/images/INST.png', // Instagram image path
                          height: 30,
                          width: 30,
                        ),
                      ),
                      IconButton(
                        onPressed: () {}, // Twitter link action
                        icon: Image.asset(
                          'assets/images/RE.png', // Twitter image path
                          height: 30,
                          width: 30,
                        ),
                      ),
                      IconButton(
                        onPressed: () {}, // LinkedIn link action
                        icon: Image.asset(
                          'assets/images/LINKED.png', // LinkedIn image path
                          height: 30,
                          width: 30,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              // 'LEGAL' Section
              Column(
                children: [
                  const Text(
                    'LEGAL',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Column(
                    children: [
                      TextButton(
                        onPressed: () {}, // Terms and Service action
                        child: const Text(
                          'Terms and Service',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      TextButton(
                        onPressed: () {}, // Privacy and Policy action
                        child: const Text(
                          'Privacy and Policy',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      TextButton(
                        onPressed: () {}, // Code of Conduct action
                        child: const Text(
                          'Code of Conduct',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              // 'RESOURCES' Section
              Column(
                children: [
                  const Text(
                    'RESOURCES',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Column(
                    children: [
                      TextButton(
                        onPressed: () {}, // Developers link action
                        child: const Text(
                          'Developers',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      TextButton(
                        onPressed: () {}, // GitHub link action
                        child: const Text(
                          'GitHub',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      TextButton(
                        onPressed: () {}, // Support link action
                        child: const Text(
                          'Support',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 16),
          const Center(
            child: Text(
              'All Rights Reserved @ Africa\'s Talking, 2024',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
