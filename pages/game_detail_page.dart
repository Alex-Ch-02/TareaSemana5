import 'package:flutter/material.dart';
import 'paginaCard.dart'; // Asegúrate de importar el modelo Game

class GameDetailPage extends StatelessWidget {
  final Game game;

  const GameDetailPage({super.key, required this.game});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(game.title),
        backgroundColor: game.backgroundColor, // Color de fondo personalizado
      ),
      body: Container(
        color: game.backgroundColor, // Fondo personalizado basado en el juego
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Hero(
              tag: game.title, // Tag del Hero para la animación fluida
              child: Center(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Image.asset(
                    game.imagePath,
                    width: 300,
                    height: 200,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Text(
              game.title,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.black, // Asegúrate de que el texto sea visible
              ),
            ),
            const SizedBox(height: 10),
            Text(
              game.description,
              style: const TextStyle(
                fontSize: 16,
                color: Colors.black, // Ajusta el color del texto según el fondo
              ),
            ),
          ],
        ),
      ),
    );
  }
}
