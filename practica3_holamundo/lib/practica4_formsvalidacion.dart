import 'package:flutter/material.dart';
import 'practica1_holamundo.dart';
import 'practica2_holamundoboton.dart';
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

class Practica4 extends StatefulWidget {
  const Practica4({super.key});

  @override
  State<Practica4> createState() => _Practica4State();
}

class _Practica4State extends State<Practica4> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _nombreController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passController = TextEditingController();
  final TextEditingController _confirmPassController = TextEditingController();

  bool _ocultarPassword = true;
  bool _ocultarConfirmar = true;
  bool _aceptoTerminos = false;

  @override
  void dispose() {
    _nombreController.dispose();
    _emailController.dispose();
    _passController.dispose();
    _confirmPassController.dispose();
    super.dispose();
  }

  // Validaciones
  String? _validarNombre(String? value) {
    if (value == null || value.isEmpty) return 'El nombre es obligatorio';
    if (value.length < 3) return 'Mínimo 3 caracteres';
    return null;
  }

  String? _validarEmail(String? value) {
    if (value == null || value.isEmpty) return 'El correo es obligatorio';
    final regex = RegExp(r'^[\w\.-]+@[\w\.-]+\.\w+$');
    if (!regex.hasMatch(value)) return 'Formato de correo inválido';
    return null;
  }

  String? _validarPassword(String? value) {
    if (value == null || value.isEmpty) return 'La contraseña es obligatoria';
    if (value.length < 6) return 'Mínimo 6 caracteres';
    return null;
  }

  String? _validarConfirmar(String? value) {
    if (value == null || value.isEmpty) return 'Confirma tu contraseña';
    if (value != _passController.text) return 'Las contraseñas no coinciden';
    return null;
  }

  void _enviarFormulario() {
    if (_formKey.currentState!.validate()) {
      if (!_aceptoTerminos) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Debes aceptar los términos')),
        );
        return;
      }
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
              'Registrado: ${_nombreController.text} (${_emailController.text})'),
        ),
      );
    }
  }

  void _limpiarFormulario() {
    _formKey.currentState!.reset();
    _nombreController.clear();
    _emailController.clear();
    _passController.clear();
    _confirmPassController.clear();
    setState(() {
      _aceptoTerminos = false;
      _ocultarPassword = true;
      _ocultarConfirmar = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Práctica 4 - Formulario')),
      drawer: buildDrawer(context), 
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              // Nombre
              TextFormField(
                controller: _nombreController,
                decoration: const InputDecoration(
                  labelText: 'Nombre',
                  prefixIcon: Icon(Icons.person),
                  border: OutlineInputBorder(),
                ),
                validator: _validarNombre,
                textInputAction: TextInputAction.next,
              ),
              const SizedBox(height: 12),

              // Email
              TextFormField(
                controller: _emailController,
                decoration: const InputDecoration(
                  labelText: 'Correo electrónico',
                  prefixIcon: Icon(Icons.email),
                  border: OutlineInputBorder(),
                ),
                validator: _validarEmail,
                keyboardType: TextInputType.emailAddress,
                textCapitalization: TextCapitalization.none,
                textInputAction: TextInputAction.next,
              ),
              const SizedBox(height: 12),

              // Contraseña
              TextFormField(
                controller: _passController,
                obscureText: _ocultarPassword,
                decoration: InputDecoration(
                  labelText: 'Contraseña',
                  prefixIcon: const Icon(Icons.lock),
                  border: const OutlineInputBorder(),
                  suffixIcon: IconButton(
                    icon: Icon(_ocultarPassword
                        ? Icons.visibility
                        : Icons.visibility_off),
                    onPressed: () {
                      setState(() {
                        _ocultarPassword = !_ocultarPassword;
                      });
                    },
                  ),
                ),
                validator: _validarPassword,
                textInputAction: TextInputAction.next,
              ),
              const SizedBox(height: 12),

              // Confirmar contraseña
              TextFormField(
                controller: _confirmPassController,
                obscureText: _ocultarConfirmar,
                decoration: InputDecoration(
                  labelText: 'Confirmar contraseña',
                  prefixIcon: const Icon(Icons.lock_outline),
                  border: const OutlineInputBorder(),
                  suffixIcon: IconButton(
                    icon: Icon(_ocultarConfirmar
                        ? Icons.visibility
                        : Icons.visibility_off),
                    onPressed: () {
                      setState(() {
                        _ocultarConfirmar = !_ocultarConfirmar;
                      });
                    },
                  ),
                ),
                validator: _validarConfirmar,
              ),
              const SizedBox(height: 12),

              // Checkbox términos
              CheckboxListTile(
                title: const Text('Acepto términos y condiciones'),
                value: _aceptoTerminos,
                onChanged: (value) {
                  setState(() {
                    _aceptoTerminos = value ?? false;
                  });
                },
              ),
              const SizedBox(height: 20),

              // Botones
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: _enviarFormulario,
                    child: const Text('Enviar'),
                  ),
                  OutlinedButton(
                    onPressed: _limpiarFormulario,
                    child: const Text('Limpiar'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
