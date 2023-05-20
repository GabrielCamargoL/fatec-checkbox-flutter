import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'CheckBox',
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<String> colors = ['Preto', 'Azul', 'Rosa', 'Amarelo'];
  List<String> musicStyles = [
    'Rock',
    'Rap',
    'Hip Hop',
    'Metal',
    'Jazz',
    'Blues'
  ];
  List<String> selectedColors = [];
  List<String> selectedMusicStyles = [];

  void updateColors(String option, bool selected) {
    setState(() {
      if (selected) {
        selectedColors.add(option);
      } else {
        selectedColors.remove(option);
      }
    });
  }

  void updateMusicStyles(String option, bool selected) {
    setState(() {
      if (selected) {
        selectedMusicStyles.add(option);
      } else {
        selectedMusicStyles.remove(option);
      }
    });
  }

  void mostrarSelecoes() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Opções Selecionadas'),
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('Cores: ${selectedColors.join(", ")}'),
              Text('Estilos musicais: ${selectedMusicStyles.join(", ")}'),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Fechar'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Checkbox'),
      ),
      body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Quais cores você gosta?',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                Column(
                  children: colors.map((option) {
                    return CheckboxListTile(
                      controlAffinity: ListTileControlAffinity.leading,
                      title: Text(option),
                      value: selectedColors.contains(option),
                      onChanged: (bool? selected) {
                        updateColors(option, selected!);
                      },
                    );
                  }).toList(),
                ),
                const SizedBox(height: 32),
                const Text(
                  'Quais estilos músicais você costuma ouvir?',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                Column(
                  children: musicStyles.map((option) {
                    return CheckboxListTile(
                      controlAffinity: ListTileControlAffinity.leading,
                      title: Text(option),
                      value: selectedMusicStyles.contains(option),
                      onChanged: (bool? selected) {
                        updateMusicStyles(option, selected!);
                      },
                    );
                  }).toList(),
                ),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: mostrarSelecoes,
                  child: const Text('Mostrar Seleções'),
                ),
              ],
            ),
          )),
    );
  }
}
