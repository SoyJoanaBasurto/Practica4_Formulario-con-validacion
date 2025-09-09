import 'package:flutter/material.dart';
import 'practica1_holamundo.dart';
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

class Practica2 extends StatefulWidget {
  const Practica2({super.key});

  @override
  State<Practica2> createState() => _Practica2State();
}

class _Practica2State extends State<Practica2> {
  List<String> mensajes = [];

  void agregarMensaje() {
    setState(() {
      mensajes.add("Hola Mundo ${mensajes.length + 1}");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Práctica 2")),
      drawer: buildDrawer(context), // ✅ ahora tiene menú
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: mensajes
              .map((m) => Text(
                    m,
                    style: const TextStyle(fontSize: 18),
                  ))
              .toList(),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: agregarMensaje,
        child: const Icon(Icons.add),
      ),
    );
  }
}
