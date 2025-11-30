import 'package:flutter/material.dart';
import 'package:re_web/widgets/ui/icon_illustration.dart';

/// Reusable content block with a title, multiple paragraphs and an illustration.
/// Alternates layout with [imageOnLeft]. Falls back to vertical layout on narrow widths.
class SectionBlock extends StatelessWidget {
  const SectionBlock({
    super.key,
    required this.title,
    required this.paragraphs,
    required this.icon,
    this.imageOnLeft = false,
  });

  final String title;
  final List<String> paragraphs;
  final IconData icon;
  final bool imageOnLeft;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = theme.colorScheme;
    return Container(
      decoration: BoxDecoration(
        color: colors.surface,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: colors.secondary),
      ),
      padding: const EdgeInsets.all(24),
      child: LayoutBuilder(
        builder: (context, constraints) {
          final isWide = constraints.maxWidth >= 800;
          final image = IconIllustration(icon: icon, size: isWide ? 140 : 100);

          // Base content (no Flexible) so it can be reused in narrow layout safely
          final textContent = Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: theme.textTheme.headlineMedium),
              const SizedBox(height: 12),
              ...paragraphs.map((p) => Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: Text(p, style: theme.textTheme.bodyLarge),
                  )),
            ],
          );

          // Wide (row) versions wrapped with Flexible
          final textWide = Flexible(
            flex: 3,
            child: textContent,
          );

          final imgWide = Flexible(
            flex: 2,
            child: Align(
              alignment: Alignment.center,
              child: image,
            ),
          );

          if (!isWide) {
            // Compact layout: keep a horizontal arrangement so the illustration
            // is consistently to the left or right of the text, instead of below.
            final children = <Widget>[
              if (imageOnLeft) Align(alignment: Alignment.center, child: image),
              if (imageOnLeft) const SizedBox(width: 16),
              Expanded(child: textContent),
              if (!imageOnLeft) const SizedBox(width: 16),
              if (!imageOnLeft) Align(alignment: Alignment.center, child: image),
            ];

            return Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: children,
            );
          }

          final children = <Widget>[
            if (imageOnLeft) imgWide,
            if (imageOnLeft) const SizedBox(width: 24),
            textWide,
            if (!imageOnLeft) const SizedBox(width: 24),
            if (!imageOnLeft) imgWide,
          ];

          return Row(crossAxisAlignment: CrossAxisAlignment.center, children: children);
        },
      ),
    );
  }
}
