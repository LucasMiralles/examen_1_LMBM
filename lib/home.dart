import 'package:flutter/material.dart';
import 'package:examen_1_lmbm/favorite.dart';
import 'package:examen_1_lmbm/constantes.dart' as cons;
import 'package:google_fonts/google_fonts.dart';

class Item {
  final int day;
  final String activity;
  final String comment;
  final int rating;
  final bool isEven;

  Item({
    required this.day,
    required this.activity,
    required this.comment,
    required this.rating,
    required this.isEven,
  });
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Item> itemList = [
    Item(
        day: 1,
        activity: 'Iniciar el examen, para poder ir a dormir tranquilo',
        comment: 'Subir el examen antes de las 9 am del viernes',
        rating: 3,
        isEven: false),
    Item(
        day: 2,
        activity: 'Terminar y enviar mi examen para no reprobar',
        comment: 'No quiero reprobar !',
        rating: 4,
        isEven: true),
    Item(
        day: 3,
        activity: 'Preparar una presentación para el trabajo final',
        comment: '¡La presentación debe ser impresionante!',
        rating: 5,
        isEven: false),
    Item(
        day: 4,
        activity: 'Comprar ingredientes para cocinar una cena especial',
        comment: '¡Voy a sorprender a mi pareja!',
        rating: 4,
        isEven: true),
    Item(
        day: 5,
        activity: 'Hacer ejercicio en el gimnasio',
        comment: '¡Necesito mantenerme en forma!',
        rating: 3,
        isEven: false),
    Item(
        day: 6,
        activity: 'Llamar a mis padres para saludarlos',
        comment: '¡Nunca está de más demostrarles amor!',
        rating: 1,
        isEven: true),
    Item(
        day: 7,
        activity: 'Organizar una reunión con amigos',
        comment: '¡Una noche de risas y buenos recuerdos!',
        rating: 2,
        isEven: false),
    Item(
        day: 8,
        activity: 'Aprender una nueva receta de cocina',
        comment: '¡Me encanta experimentar en la cocina!',
        rating: 5,
        isEven: true),
    Item(
        day: 9,
        activity: 'Ir al cine a ver la última película de estreno',
        comment: '¡Espero que sea tan buena como dicen!',
        rating: 4,
        isEven: false),
    Item(
        day: 10,
        activity: 'Visitar un museo de arte',
        comment: '¡Me inspira y me relaja!',
        rating: 0,
        isEven: true),
    Item(
        day: 11,
        activity: 'Hacer una caminata por la naturaleza',
        comment: '¡Nada como respirar aire fresco!',
        rating: 1,
        isEven: false),
    Item(
        day: 12,
        activity: 'Comprar un regalo para un ser querido',
        comment: '¡La felicidad está en dar!',
        rating: 5,
        isEven: true),
    Item(
        day: 13,
        activity: 'Tomar un día de relax en un spa',
        comment: '¡Merezco un poco de mimos!',
        rating: 3,
        isEven: false),
    Item(
        day: 14,
        activity: 'Leer un libro interesante en el parque',
        comment: '¡El placer de perderse en una buena lectura!',
        rating: 2,
        isEven: true),
    Item(
        day: 15,
        activity: 'Asistir a una clase de baile',
        comment: '¡A mover el esqueleto y divertirse!',
        rating: 0,
        isEven: false),
    Item(
        day: 16,
        activity: 'Planificar las próximas vacaciones',
        comment: '¡El mundo está lleno de lugares por descubrir!',
        rating: 5,
        isEven: true),
  ];

  bool isCachedPressed = false;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: isCachedPressed ? cons.green : cons.fondo,
      body: Stack(
        children: [
          Positioned(
            top: 20,
            left: 20,
            right: 20,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.8),
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              padding: EdgeInsets.symmetric(vertical: 10),
              child: Center(
                child: Opacity(
                  opacity: 0.8,
                  child: Text(
                    'Calendario de actividades',
                    style: GoogleFonts.getFont(
                      'Montserrat',
                      textStyle: TextStyle(
                        color: isCachedPressed ? cons.gold : cons.titulos,
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            left: 40,
            top: 85,
            child: Container(
              width: 20,
              height: 20,
              child: FloatingActionButton(
                onPressed: () {
                  setState(() {
                    isCachedPressed = !isCachedPressed;
                  });
                },
                backgroundColor: Colors.white,
                child: Icon(Icons.cached,
                    color: isCachedPressed ? cons.green : cons.fondo, size: 15),
              ),
            ),
          ),
          Positioned(
            right: 40,
            top: 85,
            child: Container(
              width: 20,
              height: 20,
              child: FloatingActionButton(
                onPressed: () {
                  setState(() {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const Favorite()));
                  });
                },
                backgroundColor: Colors.white,
                child: Icon(Icons.favorite,
                    color: isCachedPressed ? cons.green : cons.fondo, size: 15),
              ),
            ),
          ),
          Positioned(
            top: 110,
            left: 0,
            right: 0,
            bottom: 60,
            child: ListView.builder(
              itemCount: itemList.length,
              itemBuilder: (BuildContext context, int index) {
                Item item = itemList[index];

                if (!index.isEven) {
                  return Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 13),
                    child: Row(
                      children: [
                        Expanded(
                          child: Container(
                            width: size.width * 0.7,
                            decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.95),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            padding: EdgeInsets.all(15),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      '${item.day}',
                                      style: TextStyle(
                                        fontSize: 25,
                                        color: cons.fondo2,
                                      ),
                                    ),
                                    Icon(Icons.phone_iphone,
                                        color: isCachedPressed
                                            ? cons.gold
                                            : cons.fondo2,
                                        size: 30),
                                  ],
                                ),
                                SizedBox(height: 5),
                                Text(
                                  '${item.activity}',
                                  style: GoogleFonts.montserrat(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text('Nota : ${item.comment}',
                                    style: GoogleFonts.montserrat(
                                      fontSize: 13,
                                    )),
                                SizedBox(height: 5),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Expanded(
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          for (int i = 0; i < 5; i++)
                                            Icon(Icons.star,
                                                color: i < item.rating
                                                    ? Colors.amber
                                                    : Colors.grey,
                                                size: 15),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(width: 10),
                        Container(
                          width: size.width * 0.2,
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.95),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SizedBox(height: 12),
                              ElevatedButton.icon(
                                onPressed: () {},
                                icon: Icon(Icons.edit,
                                    color: Colors.white, size: 20),
                                label: Text('Editar',
                                    style: TextStyle(color: Colors.white)),
                                style: ElevatedButton.styleFrom(
                                    primary: isCachedPressed
                                        ? cons.gold
                                        : cons.botones),
                              ),
                              SizedBox(height: 15),
                              ElevatedButton.icon(
                                onPressed: () {},
                                icon: Icon(Icons.delete,
                                    color: Colors.white, size: 20),
                                label: Text('Borrar',
                                    style: TextStyle(color: Colors.white)),
                                style: ElevatedButton.styleFrom(
                                    primary: isCachedPressed
                                        ? cons.gold
                                        : cons.botones),
                              ),
                              SizedBox(height: 12),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                } else {
                  return Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 13),
                    child: Stack(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.95),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          padding: EdgeInsets.all(15),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    '${item.day}',
                                    style: TextStyle(
                                      fontSize: 25,
                                      color: cons.fondo2,
                                    ),
                                  ),
                                  Icon(Icons.phone_iphone,
                                      color: isCachedPressed
                                          ? cons.gold
                                          : cons.fondo2,
                                      size: 30),
                                ],
                              ),
                              SizedBox(height: 5),
                              Text(
                                '${item.activity}',
                                style: GoogleFonts.montserrat(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text('Nota : ${item.comment}',
                                  style: GoogleFonts.montserrat(
                                    fontSize: 13,
                                  )),
                              SizedBox(height: 5),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Expanded(
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        for (int i = 0; i < 5; i++)
                                          Icon(Icons.star,
                                              color: i < item.rating
                                                  ? Colors.amber
                                                  : Colors.grey,
                                              size: 15),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                }
              },
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              height: 50,
              color: isCachedPressed ? cons.green : cons.fondo,
              child: Center(
                child: Text(
                  'SEGUNDA VISTA : Lucas Miralles',
                  style: TextStyle(
                    color: isCachedPressed ? cons.gold : cons.titulos,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
