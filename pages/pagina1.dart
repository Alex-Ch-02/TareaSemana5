import 'package:flutter/material.dart';

class Pagina1 extends StatefulWidget {
  const Pagina1({super.key});

  @override
  State<Pagina1> createState() => _Pagina1State();
}

class _Pagina1State extends State<Pagina1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Reseña de la App de Juegos"),
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image:
                AssetImage('assets/fondo_nosotros.jpg'), // Fondo de videojuegos
            fit: BoxFit.cover,
          ),
        ),
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Título de la reseña
            const Text(
              "Bienvenido a la App de Videojuegos",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            // Descripción de la reseña
            const Text(
              "Esta aplicación te ofrece una experiencia increíble en el mundo de los videojuegos. "
              "Podrás explorar una amplia variedad de juegos de diferentes géneros, "
              "desde aventuras épicas hasta emocionantes juegos de estrategia. ¡Con gráficos increíbles y jugabilidad fluida, "
              "esta app es perfecta para los amantes de los videojuegos!",
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 16),
            // Características
            const Text(
              "Características destacadas:",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const Text(
              "• Variedad de géneros de juegos\n"
              "• Gráficos de alta calidad\n"
              "• Interfaz amigable y fácil de usar\n"
              "• Actualizaciones frecuentes con nuevos contenidos\n",
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 16),
            // Imagen o logo (opcional)
            Center(
              child: Image.asset(
                'assets/games.jpg', // Reemplaza con el nombre de tu archivo
                width: 350,
                height: 200,
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.pop(context),
        child: const Icon(Icons.arrow_back),
      ),
    );
  }
}
