import 'package:flutter/material.dart';

class Pagina2 extends StatefulWidget {
  const Pagina2({super.key});

  @override
  State<Pagina2> createState() => _Pagina2State();
}

class _Pagina2State extends State<Pagina2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Contactos de la App de Juegos"),
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image:
                AssetImage('assets/fondo_soporte.jpg'), // Fondo de videojuegos
            fit: BoxFit.cover,
          ),
        ),
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Título de la reseña
            const Text(
              "Contactos para soporte de la App de Videojuegos",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            // Descripción de la reseña
            const Text(
              "Si tienes algún problema o necesitas asistencia con la aplicación, "
              "puedes ponerte en contacto con nuestro equipo de soporte a través de los siguientes medios:",
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 16),
            // Características
            const Text(
              "Contactos:",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const Text(
              "Alexander Chamba",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const Text(
              "• Correo electrónico: alexchamba@gmail.com\n"
              "• Teléfono: +593 95 993 2552\n"
              "• WhatsApp: +593 95 993 2552\n"
              "• Horario de atención: Lunes a Viernes, 9:00 AM - 18:00 PM\n",
              style: TextStyle(fontSize: 16),
            ),
            const Text(
              "Steven Huertas",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const Text(
              "• Correo electrónico: stevenhuertas@gmail.com\n"
              "• Teléfono: +593 99 446 4004\n"
              "• WhatsApp: +593 99 446 4004\n"
              "• Horario de atención: Lunes a Viernes, 9:00 AM - 18:00 PM",
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 16),
            // Imagen o logo (opcional)
            Center(
              child: Image.asset(
                'assets/soporte.jpg', // Reemplaza con el nombre de tu archivo
                width: 150, // Ancho de 16 píxeles
                height: 100, // Alto de 16 píxeles
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () =>
            Navigator.pop(context), // Corregido: no necesitas llaves aquí
        child: const Icon(Icons.arrow_back),
      ),
    );
  }
}
