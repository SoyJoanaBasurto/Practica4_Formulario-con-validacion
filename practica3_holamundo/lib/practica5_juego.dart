import 'dart:math';
import 'package:flutter/material.dart';
import 'practica1_holamundo.dart';
import 'practica2_holamundoboton.dart';
import 'practica4_formsvalidacion.dart';

class Practica5Juego extends StatefulWidget {
  const Practica5Juego({super.key});

  @override
  State<Practica5Juego> createState() => _Practica5JuegoState();
}

class _Practica5JuegoState extends State<Practica5Juego> {
  final List<String> opciones = ["Piedra", "Papel", "Tijera"];
  String eleccionUsuario = "";
  String eleccionApp = "";
  String resultado = "";
  int puntosUsuario = 0;
  int puntosApp = 0;

  void jugar(String opcion) {
    final random = Random();
    String appChoice = opciones[random.nextInt(3)];

    setState(() {
      eleccionUsuario = opcion;
      eleccionApp = appChoice;

      if (opcion == appChoice) {
        resultado = "¡Empate!";
      } else if ((opcion == "Piedra" && appChoice == "Tijera") ||
          (opcion == "Papel" && appChoice == "Piedra") ||
          (opcion == "Tijera" && appChoice == "Papel")) {
        resultado = "¡Ganaste!";
        puntosUsuario++;
      } else {
        resultado = "Perdiste...";
        puntosApp++;
      }
    });
  }

  void reiniciar() {
    setState(() {
      puntosUsuario = 0;
      puntosApp = 0;
      eleccionUsuario = "";
      eleccionApp = "";
      resultado = "";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Práctica 5: Piedra, Papel o Tijera")),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(color: Colors.deepPurple),
              child: Text("Menú de Prácticas",
                  style: TextStyle(color: Colors.white, fontSize: 20)),
            ),
            ListTile(
              title: const Text("Práctica 1: Hola Mundo"),
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const Practica1()),
                );
              },
            ),
            ListTile(
              title: const Text("Práctica 2: Hola Mundo con Botón"),
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const Practica2()),
                );
              },
            ),
            ListTile(
              title: const Text("Práctica 4: Formulario con Validación"),
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const Practica4()),
                );
              },
            ),
            ListTile(
              title: const Text("Práctica 5: Juego Piedra, Papel o Tijera"),
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const Practica5Juego()),
                );
              },
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Elige tu jugada:",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red, padding: const EdgeInsets.all(15)),
                  onPressed: () => jugar("Piedra"),
                  icon: const Icon(Icons.sports_mma),
                  label: const Text("Piedra"),
                ),
                ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green, padding: const EdgeInsets.all(15)),
                  onPressed: () => jugar("Papel"),
                  icon: const Icon(Icons.description),
                  label: const Text("Papel"),
                ),
                ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue, padding: const EdgeInsets.all(15)),
                  onPressed: () => jugar("Tijera"),
                  icon: const Icon(Icons.content_cut),
                  label: const Text("Tijera"),
                ),
              ],
            ),
            const SizedBox(height: 30),
            Card(
              elevation: 5,
              margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15)),
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    Text("Tu elección: $eleccionUsuario",
                        style: const TextStyle(fontSize: 18)),
                    Text("App eligió: $eleccionApp",
                        style: const TextStyle(fontSize: 18)),
                    const SizedBox(height: 10),
                    Text(resultado,
                        style: const TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.black)),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 30),
            Card(
              color: Colors.yellow[100],
              elevation: 5,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15)),
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    const Text("Marcador",
                        style: TextStyle(
                            fontSize: 22, fontWeight: FontWeight.bold)),
                    const SizedBox(height: 10),
                    Text("Usuario: $puntosUsuario - App: $puntosApp",
                        style: const TextStyle(fontSize: 18)),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.purple, padding: const EdgeInsets.all(15)),
              onPressed: reiniciar,
              icon: const Icon(Icons.refresh),
              label: const Text("Reiniciar Marcador"),
            )
          ],
        ),
      ),
    );
  }
}
