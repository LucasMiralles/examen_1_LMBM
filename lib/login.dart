import 'package:flutter/material.dart';
import 'package:examen_1_lmbm/constantes.dart' as cons;

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final screenHeight = size.height;

    return Scaffold(
      backgroundColor: cons.fondo,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _buildRowWithRectangles(screenHeight, cons.fondo2, cons.fondo, cons.fondo3),
          _buildRowWithRectangles(screenHeight, cons.fondo3, cons.fondo2, cons.fondo),
          _buildRowWithRectangles(screenHeight, cons.fondo, cons.fondo3, cons.fondo2),
        ],
      ),
    );
  }

  Widget _buildRowWithRectangles(double screenHeight, Color color1, Color color2, Color color3) {
    final rectangleHeight = screenHeight / 3;

    return Container(
      height: rectangleHeight,
      child: Row(
        children: [
          _buildRectangle(color1, screenHeight / 3),
          _buildRectangle(color2, screenHeight / 3),
          _buildRectangle(color3, screenHeight / 3),
        ],
      ),
    );
  }

  Widget _buildRectangle(Color color, double height) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(20), // Bords un peu ronds
        ),
        height: height,
      ),
    );
  }
}
