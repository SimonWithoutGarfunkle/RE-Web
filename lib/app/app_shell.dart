import 'package:flutter/material.dart';

class AppShell extends StatelessWidget {
  const AppShell({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Logo à gauche du titre
            Image.network(
              '/logo_re_detour_strict.png',
              height: 46,
              fit: BoxFit.contain,
            ),
            const SizedBox(width: 8),
            const Text('RE'),
          ],
        ),
        elevation: 0,
        // Neon gradient sheen across the app bar for a more vibrant look
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Theme.of(context).colorScheme.primary.withValues(alpha: 0.12),
                Theme.of(context).colorScheme.secondary.withValues(alpha: 0.12),
              ],
            ),
          ),
        ),
        // Right-aligned burger to open the navigation panel from the right
        actions: [
          Builder(
            builder: (context) => IconButton(
              tooltip: 'Menu',
              icon: const Icon(Icons.menu),
              color: Theme.of(context).colorScheme.primary,
              onPressed: () => Scaffold.of(context).openEndDrawer(),
            ),
          ),
        ],
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(1),
          child: Container(
            height: 1,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Theme.of(context).colorScheme.secondary.withValues(alpha: 0.6),
                  Theme.of(context).colorScheme.primary.withValues(alpha: 0.6),
                ],
              ),
            ),
          ),
        ),
      ),
      endDrawer: const _NavDrawer(),
      body: child,
    );
  }
}

class _NavDrawer extends StatelessWidget {
  const _NavDrawer({super.key});
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = theme.colorScheme;
    final textStyle = theme.textTheme.titleMedium;
    return Drawer(
      child: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.centerRight,
              end: Alignment.centerLeft,
              colors: [
                colors.surface.withValues(alpha: 0.9),
                colors.surface.withValues(alpha: 0.9),
              ],
            ),
          ),
          child: Stack(
            children: [
              ListView(
                padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
                children: [
                  // Drawer header with neon accent line
                  Padding(
                    padding: const EdgeInsets.only(left: 4, right: 4, bottom: 12, top: 4),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('RE', style: theme.textTheme.titleLarge?.copyWith(color: colors.primary, fontWeight: FontWeight.w800)),
                        const SizedBox(height: 8),
                        Container(
                          height: 2,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [colors.primary, colors.secondary],
                            ),
                            borderRadius: BorderRadius.circular(2),
                          ),
                        ),
                      ],
                    ),
                  ),
                  _NavTile(label: 'Accueil', route: '/', textStyle: textStyle),
                  _NavTile(label: 'Autheurs', route: '/authors', textStyle: textStyle),
                  _NavTile(label: 'Contact', route: '/contact', textStyle: textStyle),
                  const SizedBox(height: 8),
                  Divider(color: colors.secondary.withValues(alpha: 0.4)),
                  const SizedBox(height: 8),
                  _NavTile(label: 'Se connecter', route: '/login', textStyle: textStyle),
                  _NavTile(label: "S'inscrire", route: '/subscribe', textStyle: textStyle),
                ],
              ),
              Positioned(
                top: 4,
                right: 4,
                child: Builder(
                  builder: (context) => IconButton(
                    tooltip: 'Fermer',
                    icon: const Icon(Icons.menu),
                    color: colors.primary,
                    onPressed: () => Navigator.of(context).pop(),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _NavTile extends StatelessWidget {
  const _NavTile({required this.label, required this.route, this.textStyle});

  final String label;
  final String route;
  final TextStyle? textStyle;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: ListTile(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        title: Text(label, style: textStyle),
        trailing: Icon(Icons.chevron_right, color: colors.secondary),
        hoverColor: colors.primary.withValues(alpha: 0.08),
        onTap: () {
          Navigator.of(context).pop();
          if (ModalRoute.of(context)?.settings.name != route) {
            Navigator.of(context).pushNamed(route);
          }
        },
      ),
    );
  }
}
