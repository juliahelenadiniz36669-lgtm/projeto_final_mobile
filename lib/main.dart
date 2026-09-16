import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(const MeuApp());
}


class MeuApp extends StatefulWidget {
  const MeuApp({super.key});

  @override
  State<MeuApp> createState() => _MeuAppState();
}

class _MeuAppState extends State<MeuApp> {
  Color corPrimaria = Colors.indigo;

  void mudarCor(Color novaCor) {
    setState(() {
      corPrimaria = novaCor;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Central de Apps',
      theme: ThemeData(
        colorSchemeSeed:  const Color.fromARGB(255, 132, 205, 254),
        useMaterial3: true,
      ),
      home: SplashScreen(mudarCor: mudarCor),
    );
  }
}


class AppInfo {
  final String nome;
  final String descricao;
  final IconData icone;

  const AppInfo({
    required this.nome,
    required this.descricao,
    required this.icone,
  });
}

final List<AppInfo> meusApps = [
  AppInfo(
    nome: 'Calculadora de Gasolina',
    descricao: 'Calcula litros e custo de uma viagem',
    icone: Icons.local_gas_station,
  ),
  AppInfo(
    nome: 'Calculadora de Churrasco',
    descricao: 'Calcula carne, bebida e carvão',
    icone: Icons.outdoor_grill,
  ),
  AppInfo(
    nome: 'Frases Motivacionais',
    descricao: 'Mostra frases aleatórias',
    icone: Icons.auto_awesome,
  ),
  AppInfo(
    nome: 'Lista de Tarefas',
    descricao: 'Organiza suas tarefas do dia a dia',
    icone: Icons.check_circle_outline,
  ),
  AppInfo(
    nome: 'Placar de Pontos',
    descricao: 'Acompanha a pontuação de jogadores',
    icone: Icons.emoji_events,
  ),
];


class SplashScreen extends StatefulWidget {
  final void Function(Color) mudarCor;

  const SplashScreen({super.key, required this.mudarCor});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => LoginScreen(mudarCor: widget.mudarCor),
        ),
      );
    }

  }
@override
Widget build(BuildContext context) {
  return Scaffold(
    backgroundColor: Theme.of(context).colorScheme.primary,
    body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            '../assets/images/Logo.png',
            width: 150,
            height: 150,
          ),

          const SizedBox(height: 16),
          const Text(
            'lêBrasil',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ],
      ),
    ),
  );
}
}
class HomeScreen extends StatelessWidget {
  final void Function(Color) mudarCor;

  const HomeScreen({super.key, required this.mudarCor});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("lêBrasil"),
      ),
      body: const Center(
        child: Text('Em construção ...'),
      ),
    );
  }
}