import 'package:flutter/material.dart';
import 'package:examen_erik/settings.dart';
import 'package:examen_erik/register.dart';
import 'package:examen_erik/conversor.dart';

class MainScreen extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return MainScreenState();
  }

}

class MainScreenState extends State<MainScreen> {
  int index = 0;

  var listaPantallas = [ConversorScreen(), RegisterScreen(), SettingsScreen()]; //Lista de pantallas
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child:Text("Conversor de Moneda")),
      ),
      bottomNavigationBar: BottomNavigationBar( //Menú de navegación inferior
        currentIndex: index, //Indice (Cambiar el botón que aparece pulsado en la barra)
        items: [ //Lista de botones
        BottomNavigationBarItem(icon: Icon(Icons.swap_horiz), label: "Conversión"),
        BottomNavigationBarItem(icon: Icon(Icons.app_registration), label: "Registro"),
        BottomNavigationBarItem(icon: Icon(Icons.settings), label: "Ajustes"),
        ],
        onTap: (value) {
          setState(() {
            index = value; //Cuando se pulsa un botón, se cambia el estado del indice a la posición del botón pulsada (0.Conversion, 1.Registro y 2.Ajustes)
          });
        },
      ),
      body: listaPantallas[index] //Muestra una pantalla de la lista dependiendo del valor del índice
    );
  }
}