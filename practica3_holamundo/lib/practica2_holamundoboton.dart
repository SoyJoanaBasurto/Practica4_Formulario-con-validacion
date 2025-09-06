import 'package:flutter/material.dart';

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
