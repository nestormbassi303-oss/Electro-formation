import 'package:flutter/material.dart';

void main() {
  runApp(const ElectroFormationApp());
}

class ElectroFormationApp extends StatelessWidget {
  const ElectroFormationApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'ÉLECTRO FORMATION',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF123B70),
        ),
        useMaterial3: true,
      ),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  final List<Map<String, dynamic>> chapters = const [
    {
      'title': 'Introduction à l’électricité',
      'icon': Icons.bolt,
    },
    {
      'title': 'Les grandeurs électriques',
      'icon': Icons.electrical_services,
    },
    {
      'title': 'Les circuits électriques',
      'icon': Icons.cable,
    },
    {
      'title': 'Les outils de l’électricien',
      'icon': Icons.build,
    },
    {
      'title': 'Les conducteurs et les câbles',
      'icon': Icons.power,
    },
    {
      'title': 'Les appareils de protection',
      'icon': Icons.security,
    },
    {
      'title': 'La sécurité électrique',
      'icon': Icons.health_and_safety,
    },
    {
      'title': 'Les schémas électriques',
      'icon': Icons.schema,
    },
    {
      'title': 'Les installations domestiques',
      'icon': Icons.home,
    },
    {
      'title': 'Exercices et révisions',
      'icon': Icons.menu_book,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF3F6FA),
      appBar: AppBar(
        backgroundColor: const Color(0xFF123B70),
        foregroundColor: Colors.white,
        title: const Text(
          'ÉLECTRO FORMATION',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(22),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [
                    Color(0xFF123B70),
                    Color(0xFF2475B9),
                  ],
                ),
                borderRadius: BorderRadius.circular(20),
              ),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(
                    Icons.school,
                    color: Color(0xFFFFD43B),
                    size: 48,
                  ),
                  SizedBox(height: 15),
                  Text(
                    'Bienvenue dans votre formation !',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 23,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Apprenez l’électricité étape par étape.',
                    style: TextStyle(color: Colors.white70),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 25),
            const Text(
              'Votre espace de formation',
              style: TextStyle(
                fontSize: 21,
                fontWeight: FontWeight.bold,
                color: Color(0xFF123B70),
              ),
            ),
            const SizedBox(height: 15),
            Row(
              children: [
                Expanded(
                  child: _menuCard(
                    context,
                    'Cours',
                    Icons.menu_book,
                    const Color(0xFF2475B9),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: _menuCard(
                    context,
                    'Quiz',
                    Icons.quiz,
                    const Color(0xFFE5A900),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 25),
            const Text(
              'Les 10 chapitres de formation',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Color(0xFF123B70),
              ),
            ),
            const SizedBox(height: 12),
            ...chapters.asMap().entries.map((entry) {
              final index = entry.key;
              final chapter = entry.value;

              return Card(
                margin: const EdgeInsets.only(bottom: 10),
                child: ListTile(
                  leading: CircleAvatar(
                    backgroundColor: const Color(0xFFE4EFFB),
                    child: Icon(
                      chapter['icon'] as IconData,
                      color: const Color(0xFF123B70),
                    ),
                  ),
                  title: Text(
                    chapter['title'] as String,
                    style: const TextStyle(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  subtitle: Text('Chapitre ${index + 1}'),
                  trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => LessonScreen(
                          title: chapter['title'] as String,
                          number: index + 1,
                        ),
                      ),
                    );
                  },
                ),
              );
            }),
            const SizedBox(height: 20),
            const Center(
              child: Text(
                'ÉLECTRO FORMATION • Édition 2026',
                style: TextStyle(color: Colors.grey),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _menuCard(
    BuildContext context,
    String title,
    IconData icon,
    Color color,
  ) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(18),
        child: Column(
          children: [
            Icon(icon, color: color, size: 38),
            const SizedBox(height: 8),
            Text(
              title,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}

class LessonScreen extends StatelessWidget {
  final String title;
  final int number;

  const LessonScreen({
    super.key,
    required this.title,
    required this.number,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chapitre $number'),
        backgroundColor: const Color(0xFF123B70),
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Bienvenue dans ce chapitre de formation.',
              style: TextStyle(fontSize: 17),
            ),
            const SizedBox(height: 15),
            const Text(
              'Le contenu pédagogique détaillé de ce chapitre sera intégré dans la prochaine étape.',
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
