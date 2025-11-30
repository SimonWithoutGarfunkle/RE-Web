import 'package:flutter/material.dart';
import 'package:re_web/app/app_shell.dart';
import 'package:re_web/pages/authors_page.dart';
import 'package:re_web/pages/contact_page.dart';
import 'package:re_web/pages/home_page.dart';
import 'package:re_web/pages/login_page.dart';
import 'package:re_web/pages/subscribe_page.dart';
import 'package:re_web/pages/mentions_legales_page.dart';
import 'package:re_web/pages/conditions_utilisation_page.dart';
import 'package:re_web/theme/app_theme.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'RE — La bibliothèque à partager',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.theme,
      initialRoute: '/',
      routes: {
        '/': (context) => const AppShell(child: HomePage()),
        '/authors': (context) => const AppShell(child: AuthorsPage()),
        '/contact': (context) => const AppShell(child: ContactPage()),
        '/login': (context) => const AppShell(child: LoginPage()),
        '/subscribe': (context) => const AppShell(child: SubscribePage()),
        '/mentions': (context) => const AppShell(child: MentionsLegalesPage()),
        '/conditions': (context) => const AppShell(child: ConditionsUtilisationPage()),
      },
    );
  }
}
