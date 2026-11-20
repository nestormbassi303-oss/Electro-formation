import 'package:flutter/material.dart';

void main() => runApp(const ElectroFormationApp());

const navy = Color(0xFF173D67);
const yellow = Color(0xFFFFC928);

class ElectroFormationApp extends StatelessWidget {
  const ElectroFormationApp({super.key});
  @override
  Widget build(BuildContext context) => MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'ÉLECTRO FORMATION',
    theme: ThemeData(colorScheme: ColorScheme.fromSeed(seedColor: navy),
      scaffoldBackgroundColor: const Color(0xFFF5F7FA), useMaterial3: true),
    home: const HomePage(),
  );
}

const chapters = [
  'Découvrir l’électricité', 'Les grandeurs électriques',
  'Les circuits électriques', 'Outils et appareils de mesure',
  'Conducteurs et câbles', 'Appareils de commande et de protection',
  'Sécurité électrique', 'Lire un schéma électrique',
  'Exercices corrigés', 'Glossaire et progression'
];

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(backgroundColor: navy, foregroundColor: Colors.white,
      title: const Text('ÉLECTRO FORMATION'), actions: const [Padding(
        padding: EdgeInsets.all(12), child: Icon(Icons.electric_bolt, color: yellow))]),
    body: ListView(padding: const EdgeInsets.all(18), children: [
      Container(padding: const EdgeInsets.all(22), decoration: BoxDecoration(
        color: navy, borderRadius: BorderRadius.circular(22)),
        child: const Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Icon(Icons.school, color: yellow, size: 38),
          SizedBox(height: 12),
          Text('Apprendre l’électricité pas à pas',
            style: TextStyle(color: Colors.white, fontSize: 23, fontWeight: FontWeight.bold)),
          SizedBox(height: 8),
          Text('Cours, schémas et exercices pour débutants.',
            style: TextStyle(color: Colors.white70)),
        ])),
      const SizedBox(height: 18),
      _tile(context, Icons.menu_book, 'Mes cours', '10 chapitres',
        () => Navigator.push(context, MaterialPageRoute(builder: (_) => const ChaptersPage()))),
      _tile(context, Icons.quiz, 'Quiz', 'Tester ses connaissances',
        () => Navigator.push(context, MaterialPageRoute(builder: (_) => const QuizPage()))),
      _tile(context, Icons.trending_up, 'Ma progression', 'Suivre son apprentissage',
        () => Navigator.push(context, MaterialPageRoute(builder: (_) => const ProgressPage()))),
      const SizedBox(height: 18),
      const Text('Sécurité : ce support est théorique. Les travaux sur une installation électrique doivent être réalisés par une personne qualifiée, hors tension et selon les règles applicables.',
        style: TextStyle(color: Colors.redAccent, fontSize: 12)),
    ]),
  );
}

Widget _tile(BuildContext c, IconData icon, String title, String subtitle, VoidCallback tap) =>
  Card(child: ListTile(leading: Icon(icon, color: navy, size: 30),
    title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
    subtitle: Text(subtitle), trailing: const Icon(Icons.chevron_right), onTap: tap));

class ChaptersPage extends StatelessWidget {
  const ChaptersPage({super.key});
  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(title: const Text('Mes cours')),
    body: ListView.builder(itemCount: chapters.length, itemBuilder: (c, i) =>
      Card(child: ListTile(leading: CircleAvatar(backgroundColor: navy,
        child: Text('${i+1}', style: const TextStyle(color: Colors.white))),
        title: Text(chapters[i]), trailing: const Icon(Icons.chevron_right),
        onTap: () => Navigator.push(c, MaterialPageRoute(
          builder: (_) => LessonPage(number: i+1, title: chapters[i]))))),
  );
}

class LessonPage extends StatelessWidget {
  final int number; final String title;
  const LessonPage({super.key, required this.number, required this.title});
  @override
  Widget build(BuildContext context) => Scaffold(appBar: AppBar(title: Text('Chapitre $number')),
    body: Padding(padding: const EdgeInsets.all(20), child: ListView(children: [
      Text(title, style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: navy)),
      const SizedBox(height: 14),
      const Text('Leçon à compléter avec le contenu détaillé du manuel PDF.'),
      const SizedBox(height: 18),
      const Card(child: Padding(padding: EdgeInsets.all(16), child: Text(
        'À retenir\\nLis le cours, observe les schémas et réalise les exercices de compréhension.'))),
      const Text('Cette version est une base de démonstration : le contenu intégral du manuel et ses illustrations doivent encore être intégrés.')
    ])));
}

class QuizPage extends StatefulWidget {
  const QuizPage({super.key});
  @override State<QuizPage> createState() => _QuizPageState();
}
class _QuizPageState extends State<QuizPage> {
  String? answer;
  @override
  Widget build(BuildContext context) => Scaffold(appBar: AppBar(title: const Text('Quiz – Démonstration')),
    body: Padding(padding: const EdgeInsets.all(20), child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      const Text('Quelle est l’unité de mesure de la tension électrique ?', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
      for (final a in ['L’ampère (A)', 'Le volt (V)', 'L’ohm (Ω)'])
        RadioListTile<String>(value: a, groupValue: answer, title: Text(a),
          onChanged: (v) => setState(() => answer = v)),
      if (answer != null) Text(answer == 'Le volt (V)' ? 'Bonne réponse !' : 'Essaie encore.',
        style: const TextStyle(fontWeight: FontWeight.bold, color: navy))
    ])));
}

class ProgressPage extends StatelessWidget {
  const ProgressPage({super.key});
  @override
  Widget build(BuildContext context) => Scaffold(appBar: AppBar(title: const Text('Ma progression')),
    body: const Padding(padding: EdgeInsets.all(20), child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text('Début de formation', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
      SizedBox(height: 16), LinearProgressIndicator(value: 0),
      SizedBox(height: 8), Text('0 chapitre terminé sur 10'),
      SizedBox(height: 20), Text('La sauvegarde réelle de la progression sera ajoutée dans une prochaine version.')
    ])));
}
