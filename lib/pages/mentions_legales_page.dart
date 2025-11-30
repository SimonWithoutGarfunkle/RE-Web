import 'package:flutter/material.dart';

class MentionsLegalesPage extends StatelessWidget {
  const MentionsLegalesPage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Mentions légales', style: theme.textTheme.headlineMedium),
          const SizedBox(height: 16),
          const Text(
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed non risus. Suspendisse lectus tortor, dignissim sit amet, adipiscing nec, ultricies sed, dolor. '
            'Cras elementum ultrices diam. Maecenas ligula massa, varius a, semper congue, euismod non, mi. '
            'Proin porttitor, orci nec nonummy molestie, enim est eleifend mi, non fermentum diam nisl sit amet erat. '
            'Duis semper. Duis arcu massa, scelerisque vitae, consequat in, pretium a, enim. Pellentesque congue. '
            'Ut in risus volutpat libero pharetra tempor. Cras vestibulum bibendum augue. Praesent egestas leo in pede. '
            'Praesent blandit odio eu enim. Pellentesque sed dui ut augue blandit sodales. '
            'Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae; Aliquam nibh. '
            'Mauris ac mauris sed pede pellentesque fermentum. Maecenas adipiscing ante non diam sodales hendrerit.',
          ),
          const SizedBox(height: 16),
          const Text(
            'Ut velit mauris, egestas sed, gravida nec, ornare ut, mi. Aenean ut orci vel massa suscipit pulvinar. '
            'Nulla sollicitudin. Fusce varius, ligula non tempus aliquam, nunc turpis ullamcorper nibh, in tempus sapien eros vitae ligula. '
            'Pellentesque rhoncus nunc et augue. Integer id felis. Curabitur aliquet pellentesque diam. '
            'Integer quis metus vitae elit lobortis egestas. '
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
          ),
        ],
      ),
    );
  }
}
