import 'package:flutter/material.dart';
import 'package:re_web/widgets/sections/section_block.dart';

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
          const SizedBox(height: 40),
          // Section 1 — RE, la bibliothèque à partager (image right)
          SectionBlock(
            title: 'RE, la bibliothèque à partager',
            paragraphs: const [
              'RE est une bibliothèque culturelle partagée, pensée pour garder une trace des œuvres qui comptent vraiment et les faire vivre.',
              'Films, séries, livres… ici, on ne consomme pas, on se souvient, on recommande, on échange.',
            ],
            icon: Icons.local_library_rounded,
            imageOnLeft: false,
          ),
          const SizedBox(height: 24),

          // Section 2 — Pourquoi RE (image left)
          const SectionBlock(
            title: 'Pourquoi RE',
            paragraphs: [
              'On te propose tellement de contenu que tu ne sais plus quoi choisir ? Alors tu es au bon endroit!',
              'Avec RE, ce sont les œuvres que tu as vues, aimées ou détestées qui ont le plus de valeur — surtout quand elles sont partagées avec les bonnes personnes.',
              'RE n’est pas là pour proposer les top tendances ou avis de masses, mais pour mettre en commun des avis sincères avec tes proches.',
            ],
            icon: Icons.question_answer_rounded,
            imageOnLeft: true,
          ),
          const SizedBox(height: 24),

          // Section 3 — Une culture qui se vit (image right)
          const SectionBlock(
            title: 'Une culture qui se vit',
            paragraphs: [
              'Chaque œuvre devient un point de départ pour échanger, comparer des ressentis, et découvrir autrement.',
              'Quiz culturels, défis rapides entre proches, jeux légers autour du cinéma, des séries ou des livres : tout pour faire vivre les échanges autour des œuvres.',
            ],
            icon: Icons.emoji_events_rounded,
            imageOnLeft: false,
          ),
          const SizedBox(height: 24),

          // Section 4 — Le social positif (image left)
          const SectionBlock(
            title: 'Le social positif',
            paragraphs: [
              'Ici, le social est pensé comme une proximité : voir ce que tes proches regardent, lisent ou conseillent, et partager naturellement ton point de vue.',
              'Pas d’algorithme envahissant, pas de classement artificiel.',
              'Juste des recommandations humaines.',
            ],
            icon: Icons.people_alt_rounded,
            imageOnLeft: true,
          ),
          const SizedBox(height: 24),

          // Section 5 — Commencer simplement (image right)
          const SectionBlock(
            title: 'Commencer simplement',
            paragraphs: [
              'RE est encore en évolution.',
              'L’objectif est clair : proposer un espace calme et durable pour parler culture, loin du flux et du bruit.',
              'Si l’idée te parle, tu peux créer un compte gratuitement et nous partager tes retours et envies sur l\'application.',
            ],
            icon: Icons.rocket_launch_rounded,
            imageOnLeft: false,
          ),
          const SizedBox(height: 24,
          )
        ],
      ),
    );
  }
}
