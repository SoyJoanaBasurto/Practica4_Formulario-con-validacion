
import 'package:flutter/material.dart';
import 'practica1_holamundo.dart';
import 'practica2_holamundoboton.dart';
import 'practica4_formsvalidacion.dart';
import 'practica5_juego.dart';

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
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.blue, Colors.lightBlueAccent],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Icon(Icons.school, size: 60, color: Colors.white),
                  SizedBox(height: 10),
                  Text(
                    "Mis Prácticas",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            ListTile(
              leading: const Icon(Icons.looks_one, color: Colors.blue),
              title: const Text("Práctica 1: Hola Mundo"),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const Practica1()));
              },
            ),
            ListTile(
              leading: const Icon(Icons.looks_two, color: Colors.green),
              title: const Text("Práctica 2: Hola Mundo con Botón"),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const Practica2()));
              },
            ),
            ListTile(
              leading: const Icon(Icons.looks_4, color: Colors.orange),
              title: const Text("Práctica 4: Formulario con Validación"),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const Practica4()));
              },
            ),
            const Divider(),
            ListTile(
              leading: const Icon(Icons.sports_esports, color: Colors.red),
              title: const Text("Práctica 5: Juego Piedra, Papel o Tijera"),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const Practica5Juego()));
              },
            ),
          ],
        ),
      ),
      body: const Center(
        child: Text(
          "Selecciona una opción desde el menú hamburguesa",
          style: TextStyle(fontSize: 18),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
