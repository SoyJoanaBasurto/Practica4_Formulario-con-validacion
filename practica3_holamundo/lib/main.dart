
import 'package:flutter/material.dart';
import 'practica1_holamundo.dart';
import 'practica2_holamundoboton.dart';
import 'practica4_formsvalidacion.dart';
void main() {
  runApp(const MyApp());
} 

class MyApp extends StatelessWidget {
  const MyApp({super.key});

 @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Menú Principal")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Practica1()),
                );
              },
              child: const Text("Práctica 1: Hola Mundo"),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Practica2()),
                );
              },
              child: const Text("Práctica 2: Hola Mundo con Botón"),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Practica4()),
                );
              },
              child: const Text("Práctica 4: Formulario con Validación"),
            ),
          ],
        ),
      ),
    );
  }
}
