import 'package:flutter/material.dart';

class AchievementsPage extends StatelessWidget {
  const AchievementsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Women in Tech Achievements'),
        backgroundColor: Colors.purple, // Color for Women in Tech theme
      ),
      body: const Padding(
        padding: EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Celebrate Your Achievements',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.purple, // Themed color
                ),
              ),
              SizedBox(height: 20),

              // Achievement Card 1: Tech Skill Mastery
              AchievementCard(
                title: 'Tech Skill Mastery',
                description: 'You completed a full-stack development course.',
                progress: 100,
                icon: Icons.computer,
                color: Colors.blueAccent,
                imagePath: 'assets/tech_skills.jpg', // Image for the card
              ),
              SizedBox(height: 16),

              // Achievement Card 2: Community Support
              AchievementCard(
                title: 'Community Support',
                description:
                    'You mentored 5 junior developers in the community.',
                progress: 80,
                icon: Icons.group,
                color: Colors.deepPurple,
                imagePath: 'assets/community_support.jpg', // Image for the card
              ),
              SizedBox(height: 16),

              // Achievement Card 3: Women in Tech Advocacy
              AchievementCard(
                title: 'Women in Tech Advocacy',
                description: 'You spoke at a Women in Tech event.',
                progress: 90,
                icon: Icons.public,
                color: Colors.teal,
                imagePath: 'assets/women_in_tech.jpg', // Image for the card
              ),
              SizedBox(height: 16),

              // Achievement Card 4: Project Completion
              AchievementCard(
                title: 'Project Completion',
                description:
                    'You built a mobile app to support women entrepreneurs.',
                progress: 100,
                icon: Icons.apps,
                color: Colors.green,
                imagePath:
                    'assets/project_completion.jpg', // Image for the card
              ),
              SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }
}

class AchievementCard extends StatelessWidget {
  final String title;
  final String description;
  final double progress;
  final IconData icon;
  final Color color;
  final String imagePath; // Added parameter for image

  const AchievementCard({
    super.key,
    required this.title,
    required this.description,
    required this.progress,
    required this.icon,
    required this.color,
    required this.imagePath, // Initialize the image parameter
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Image at the top of each card
            ClipRRect(
              borderRadius: BorderRadius.circular(12.0),
              child: Image.asset(
                imagePath, // Use the passed image path
                height: 180, // Height of the image
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 10),

            // Achievement content (Icon, title, description, progress)
            Row(
              children: [
                Icon(
                  icon,
                  size: 40,
                  color: color,
                ),
                const SizedBox(width: 20),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: color,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        description,
                        style: const TextStyle(
                          fontSize: 14,
                          color: Colors.black54,
                        ),
                      ),
                      const SizedBox(height: 12),
                      LinearProgressIndicator(
                        value: progress / 100,
                        backgroundColor: Colors.grey[300],
                        color: color,
                        minHeight: 6,
                      ),
                      const SizedBox(height: 8),
                      Text(
                        '${progress.toStringAsFixed(0)}% Complete',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color: color,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
