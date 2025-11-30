import 'package:flutter/material.dart';

/// Simple neon-styled placeholder for illustrations using Material icons.
class IconIllustration extends StatelessWidget {
  const IconIllustration({
    super.key,
    required this.icon,
    this.size = 120,
  });

  final IconData icon;
  final double size;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return Container
        (
      decoration: BoxDecoration(
        color: colors.surface,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: colors.secondary, width: 2),
        boxShadow: [
          BoxShadow(
            color: colors.primary.withOpacity(0.25),
            blurRadius: 20,
            spreadRadius: 2,
          ),
        ],
      ),
      padding: const EdgeInsets.all(24),
      child: Icon(icon, size: size, color: colors.primary),
    );
  }
}
