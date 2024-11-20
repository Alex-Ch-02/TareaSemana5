import 'package:flutter/material.dart';
import 'pages/pagina1.dart'; // Pagina "Nosotros"
import 'pages/pagina2.dart'; // Pagina "Contactos"
import 'pages/paginaCard.dart'; // Página que muestra tarjetas de juegos
import 'pages/formulario.dart'; // Página con el formulario

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tienda de Videojuegos',
      initialRoute: "splash",
      routes: {
        "splash": (BuildContext context) => const SplashScreen(),
        "pagina1": (BuildContext context) => const Pagina1(),
        "pagina2": (BuildContext context) => const Pagina2(),
        "paginaCard": (BuildContext context) => PaginaCard(),
        "computadoras": (BuildContext context) => const Formulario(),
      },
    );
  }
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;
  late Animation<double> _opacityAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );

    // Animación de escala
    _scaleAnimation = Tween<double>(begin: 0.5, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeOutBack, // Efecto rebote
      ),
    );

    // Animación de opacidad
    _opacityAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeIn,
      ),
    );

    _controller.forward(); // Inicia la animación
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/back_main.jpg'),
            fit: BoxFit
                .cover, // Ajusta la imagen de fondo a la pantalla completa
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ScaleTransition(
                scale: _scaleAnimation,
                child: Opacity(
                  opacity: 1.0,
                  child: Image.asset(
                    'assets/Uisrael.jpg', // Asegúrate de que esta imagen también esté disponible en la carpeta de assets
                    width: 200,
                    height: 200,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              FadeTransition(
                opacity: _opacityAnimation,
                child: const Text(
                  "Bienvenido a Game Center",
                  style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    fontFamily: 'RobotoMono',
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(height: 40),

              // Botones mejorados con animaciones y estilos
              _buildAnimatedButton(
                context,
                "Nosotros",
                "pagina1",
                Colors.cyanAccent,
                Icons.info,
              ),
              const SizedBox(height: 20),
              _buildAnimatedButton(
                context,
                "Contactos",
                "pagina2",
                Colors.pinkAccent,
                Icons.contact_mail,
              ),
              const SizedBox(height: 20),
              _buildAnimatedButton(
                context,
                "Juegos",
                "paginaCard",
                Colors.lightGreenAccent,
                Icons.gamepad,
              ),
              const SizedBox(height: 20),
              _buildAnimatedButton(
                context,
                "Computadoras",
                "computadoras",
                Colors.amberAccent,
                Icons.computer,
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Función para crear botones con estilo y animación
  Widget _buildAnimatedButton(BuildContext context, String text, String route,
      Color color, IconData icon) {
    return ElevatedButton.icon(
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        foregroundColor: Colors.black,
        padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 16),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
        shadowColor: color.withOpacity(0.5),
        elevation: 8,
      ),
      icon: Icon(icon, size: 28),
      label: Text(
        text,
        style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      ),
      onPressed: () {
        Navigator.pushNamed(context, route);
      },
    );
  }
}
