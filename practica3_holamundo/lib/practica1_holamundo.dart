import 'package:flutter/material.dart';

class Practica1 extends StatefulWidget {
  const Practica1({super.key});

  @override
  State<Practica1> createState() => _Practica1State();
}

class _Practica1State extends State<Practica1> {
  bool mostrar = false;

  void toggleMostrar() {
    setState(() {
      mostrar = !mostrar;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Práctica 1")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: toggleMostrar,
              child: Text(mostrar ? "Ocultar" : "Mostrar"),
            ),
            const SizedBox(height: 20),
            if (mostrar)
              Column(
                children: List.generate(
                  10,
                  (index) => const Text(
                    "Hola Mundo",
                    style: TextStyle(fontSize: 24),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
