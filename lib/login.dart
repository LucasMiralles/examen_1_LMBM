import 'package:flutter/material.dart';
import 'package:examen_1_lmbm/constantes.dart' as cons;
import 'home.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool bandera = false;
  bool campo = false;
  final user = TextEditingController();
  final pass = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final screenHeight = size.height;

    return Scaffold(
      backgroundColor: cons.fondo,
      body: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              _buildRowWithRectangles(screenHeight, cons.fondo2, cons.fondo, cons.fondo3),
              _buildRowWithRectangles(screenHeight, cons.fondo3, cons.fondo2, cons.fondo),
              _buildRowWithRectangles(screenHeight, cons.fondo, cons.fondo3, cons.fondo2),
            ],
          ),
          Center(
            child: Container(
              width: size.width * 0.8,
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.7),
                borderRadius: BorderRadius.circular(25),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    child: Text(
                      'Bienvenido a tu primer EXAMEN',
                      style: TextStyle(
                        color: cons.titulos,
                        fontSize: 21,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  TextFormField(
                    controller: user,
                    decoration: InputDecoration(
                      hintText: 'Correo/Usuario',
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide(color: Colors.grey),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: Colors.grey),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  TextFormField(
                    controller: pass,
                    obscureText: true,
                    decoration: InputDecoration(
                      hintText: 'Contraseña',
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide(color: Colors.grey),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: Colors.grey),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        campo = false;
                        bandera = false;

                        if (user.text.isEmpty || pass.text.isEmpty) {
                          // Vérifie si l'un des champs est vide
                          campo = true;
                        } else if (user.text == 'admin' && pass.text == '123456') {
                          // Si les identifiants et les mots de passe correspondent, naviguer vers une autre page
                          Navigator.of(context).push(MaterialPageRoute(builder: (context) => const Home()));
                        } else {
                          // Si les identifiants et les mots de passe ne correspondent pas, définir une variable "bandera" sur true
                          bandera = true;
                        }
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      primary: cons.botones,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                      fixedSize: Size(size.width * 0.6, 40),
                    ),
                    child: Text(
                      'Iniciar Sesión',
                      style: TextStyle(color: Colors.white, fontSize: 16,),
                    ),
                  ),
                  const SizedBox(height: 15),
                  bandera
                      ? const Text(
                    'Usuario o contraseña incorrectos',
                    style: TextStyle(color: cons.efectos),
                    textAlign: TextAlign.center,
                  )
                      : const SizedBox(),
                  campo
                      ? const Text(
                    'Por favor, rellene todos los campos',
                    style: TextStyle(color: cons.efectos),
                    textAlign: TextAlign.center,
                  )
                      : const SizedBox(),
                  SizedBox(height: 10),
                  Text(
                    'Mi primer examen, ¿estará sencillo?',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 13,
                    ),
                  ),
                  SizedBox(height: 5),
                ],
              ),
            ),
          ),
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
          borderRadius: BorderRadius.circular(20),
        ),
        height: height,
      ),
    );
  }
}
