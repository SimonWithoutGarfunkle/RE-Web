import 'package:flutter/material.dart';

class ConditionsUtilisationPage extends StatelessWidget {
  const ConditionsUtilisationPage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Conditions d'utilisation", style: theme.textTheme.headlineMedium),
          const SizedBox(height: 16),
          const Text(
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer nec odio. Praesent libero. Sed cursus ante dapibus diam. '
            'Sed nisi. Nulla quis sem at nibh elementum imperdiet. Duis sagittis ipsum. Praesent mauris. '
            'Fusce nec tellus sed augue semper porta. Mauris massa. Vestibulum lacinia arcu eget nulla.',
          ),
          const SizedBox(height: 16),
          const Text(
            'Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. '
            'Curabitur sodales ligula in libero. Sed dignissim lacinia nunc. Curabitur tortor. '
            'Pellentesque nibh. Aenean quam. In scelerisque sem at dolor. Maecenas mattis.',
          ),
        ],
      ),
    );
  }
}
