import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('RE — La bibliothèque à partager', style: textTheme.headlineLarge),
          const SizedBox(height: 12),
          Text(
            'Discover RE, a dark neon experience. This website presents the mobile app, the team, and how to get in touch.',
            style: textTheme.bodyLarge,
          ),
          const SizedBox(height: 24),
          Wrap(
            spacing: 12,
            runSpacing: 12,
            children: [
              ElevatedButton(
                onPressed: () => Navigator.pushNamed(context, '/subscribe'),
                child: const Text('Get Started'),
              ),
              OutlinedButton(
                onPressed: () => Navigator.pushNamed(context, '/authors'),
                child: const Text('Meet the Team'),
              ),
            ],
          ),
          const SizedBox(height: 40),
          _CardSection(
            title: 'Vision',
            description:
                'RE focuses on simplicity and bold visuals. The mobile app is the core; this site presents it.',
          ),
          const SizedBox(height: 16),
          _CardSection(
            title: 'Features',
            description:
                'Clean UI, dark neon theme, and a focused experience. More details coming soon.',
          ),
        ],
      ),
    );
  }
}

class _CardSection extends StatelessWidget {
  const _CardSection({required this.title, required this.description});
  final String title;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: Theme.of(context).textTheme.titleLarge),
            const SizedBox(height: 8),
            Text(description, style: Theme.of(context).textTheme.bodyLarge),
          ],
        ),
      ),
    );
  }
}
