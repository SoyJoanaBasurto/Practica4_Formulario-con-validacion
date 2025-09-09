import 'package:flutter/material.dart';
import 'practica2_holamundoboton.dart';
import 'practica4_formsvalidacion.dart';
import 'practica5_juego.dart';

// ✅ Drawer común
Drawer buildDrawer(BuildContext context) {
  return Drawer(
    child: ListView(
      padding: EdgeInsets.zero,
      children: [
        const DrawerHeader(
          decoration: BoxDecoration(
            color: Colors.blue,
          ),
          child: Text("Mis Prácticas",
              style: TextStyle(color: Colors.white, fontSize: 22)),
        ),
        ListTile(
          title: const Text("Práctica 1"),
          onTap: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const Practica1()),
            );
          },
        ),
        ListTile(
          title: const Text("Práctica 2"),
          onTap: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const Practica2()),
            );
          },
        ),
        ListTile(
          title: const Text("Práctica 4"),
          onTap: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const Practica4()),
            );
          },
        ),
        ListTile(
          title: const Text("Práctica 5: Juego"),
          onTap: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const Practica5Juego()),
            );
          },
        ),
      ],
    ),
  );
}

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
      drawer: buildDrawer(context), // ✅ ahora todas tienen menú hamburguesa
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
