import 'package:flutter/material.dart';

class AppShell extends StatefulWidget {
  const AppShell({super.key, required this.child});

  final Widget child;

  @override
  State<AppShell> createState() => _AppShellState();
}

class _AppShellState extends State<AppShell> {
  ScrollController? _primaryScrollController;
  bool _isAtBottom = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _attachToPrimaryScrollController();
  }

  void _attachToPrimaryScrollController() {
    final controller = PrimaryScrollController.of(context);
    if (_primaryScrollController == controller) return;
    if (_primaryScrollController != null) {
      _primaryScrollController!.removeListener(_onScroll);
    }
    _primaryScrollController = controller;
    _primaryScrollController?.addListener(_onScroll);
    _computeIsAtBottom();
  }

  void _onScroll() => _computeIsAtBottom();

  void _computeIsAtBottom() {
    final c = _primaryScrollController;
    bool atBottom = false;
    if (c != null && c.hasClients) {
      final pos = c.position;
      atBottom = pos.pixels >= pos.maxScrollExtent;
    } else {
      // Pas de contrôleur => page non scrollable, on considère qu'on est en bas
      atBottom = true;
    }
    if (atBottom != _isAtBottom) {
      setState(() => _isAtBottom = atBottom);
    }
  }

  @override
  void dispose() {
    _primaryScrollController?.removeListener(_onScroll);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.sizeOf(context).width < 560;
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: InkWell(
          mouseCursor: SystemMouseCursors.click,
          splashFactory: InkSplash.splashFactory,
          borderRadius: BorderRadius.circular(6),
          onTap: () {
            if (ModalRoute.of(context)?.settings.name != '/') {
              Navigator.of(context).pushNamed('/');
            }
          },
          child: Row(
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
      // Center horizontally only; keep content aligned to the top vertically
      // to avoid vertical centering on short pages.
      body: Align(
        alignment: Alignment.topCenter,
        child: ConstrainedBox(
          // Adjust maxWidth to control how wide the content column can grow on desktop
          constraints: const BoxConstraints(maxWidth: 840),
          // Keep a small horizontal padding so content doesn't touch the edges on mobile
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: widget.child,
          ),
        ),
      ),
      // Footer:
      // - Desktop/Tablette: affiché en permanence (pinned) via bottomNavigationBar
      // - Mobile (<560px): affiché uniquement quand on est en bas de page
      bottomNavigationBar: isMobile ? (_isAtBottom ? _FooterBar() : null) : _FooterBar(),
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
                  _NavTile(label: 'Présentation', route: '/', textStyle: textStyle),
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

class _FooterBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = theme.colorScheme;
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            colors.primary.withValues(alpha: 0.12),
            colors.secondary.withValues(alpha: 0.12),
          ],
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Ligne de séparation en dégradé (comme en bas de l'app bar)
          Container(
            height: 1,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  colors.secondary.withValues(alpha: 0.6),
                  colors.primary.withValues(alpha: 0.6),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            child: Align(
              alignment: Alignment.center,
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 840),
                child: _FooterContent(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _FooterContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = theme.colorScheme;

    Widget colTitle(String text) => Padding(
          padding: const EdgeInsets.only(bottom: 8),
          child: Text(text, style: theme.textTheme.titleMedium?.copyWith(color: colors.primary)),
        );

    TextStyle? linkStyle = theme.textTheme.bodyMedium;

    Widget link(String label, String route) => InkWell(
          borderRadius: BorderRadius.circular(6),
          mouseCursor: SystemMouseCursors.click,
          onTap: () {
            if (ModalRoute.of(context)?.settings.name != route) {
              Navigator.of(context).pushNamed(route);
            }
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 6),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.chevron_right, size: 18, color: colors.secondary),
                const SizedBox(width: 6),
                Text(label, style: linkStyle),
              ],
            ),
          ),
        );

    return LayoutBuilder(
      builder: (context, constraints) {
        final isNarrow = constraints.maxWidth < 560;
        final children = <Widget>[
          // Colonne 1 — Fait avec coeur en 2025
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text('Fait avec', style: theme.textTheme.bodyMedium),
                  const SizedBox(width: 6),
                  Icon(Icons.favorite, color: colors.primary, size: 18),
                  const SizedBox(width: 6),
                  Text('en 2025', style: theme.textTheme.bodyMedium),
                ],
              ),
            ],
          ),
          // Colonne 2 — Navigation principale
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              colTitle('Plan'),
              link('Présentation', '/'),
              link('Auteurs', '/authors'),
              link('Contact', '/contact'),
            ],
          ),
          // Colonne 3 — Légal
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              colTitle('Légal'),
              link('Mentions légales', '/mentions'),
              link("Conditions d'utilisation", '/conditions'),
            ],
          ),
        ];

        if (isNarrow) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ...children.map((w) => Padding(padding: const EdgeInsets.only(bottom: 16), child: w)),
            ],
          );
        }

        return Row(
          // Centre verticalement les colonnes afin que la 1ère colonne soit
          // alignée au milieu de la hauteur du footer en affichage large.
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(child: children[0]),
            const SizedBox(width: 24),
            Expanded(child: children[1]),
            const SizedBox(width: 24),
            Expanded(child: children[2]),
          ],
        );
      },
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
