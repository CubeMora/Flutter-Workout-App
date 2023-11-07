import 'package:flutter/material.dart';

class Statistics extends StatefulWidget {
  const Statistics({Key? key}) : super(key: key);

  @override
  State<Statistics> createState() => _StatisticsState();
}

ValueNotifier kj = ValueNotifier(0);

class _StatisticsState extends State<Statistics> {
  @override
  Widget build(BuildContext context) {
    return SliverList(
          delegate: SliverChildBuilderDelegate(
            (context, index) {
              if (index < 50) {
                // Limitamos la lista a 50 elementos
                return Container(
                  color: Color.fromRGBO(35, 36, 37, 1),
                  child: ListTile(
                    contentPadding: EdgeInsets.symmetric(
                        horizontal: 16), // Espaciado horizontal
                    title: Row(
                      children: [
                        Text(
                          '${index + 1}', // Agregamos 1 para que los índices comiencen en 1 en lugar de 0
                          style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.w600,
                            color: Colors.grey,
                          ),
                        ),
                        SizedBox(
                            width:
                                8), // Espacio entre el ID y la imagen de usuario
                        CircleAvatar(
                          // Imagen de usuario rendeada
                          radius:
                              20, // Tamaño del círculo de la imagen de usuario
                          backgroundColor:
                              Colors.white, // Color de fondo del círculo
                          foregroundColor: Colors
                              .black, // Color del icono (puedes personalizarlo)
                          child: Icon(Icons
                              .person), // Icono de usuario (puedes reemplazarlo)
                        ),
                        SizedBox(
                            width:
                                8), // Espacio entre la imagen de usuario y el texto
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Usuario',
                              style: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.w600,
                                color: Colors.white,
                              ),
                            ),
                            Text(
                              'tras today',
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    trailing: Text(
                      '55',
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 19,
                        color: Colors.greenAccent[400],
                      ),
                    ),
                    subtitle: Divider(
                      // Barra separadora
                      height: 1,
                      color: Colors.black, // Color de la barra separadora
                    ),
                  ),
                );
              } else {
                return null; // Devolvemos null para evitar generar más elementos
              }
            },
          ),
        )      ;
  }

  
}
