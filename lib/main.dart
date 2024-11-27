import 'package:flutter/material.dart';
import 'package:examen_erik/mainscreen.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});
  
  @override
  State<StatefulWidget> createState() {
    return MainAppState();
  }
}

class MainAppState extends State<MainApp>{
  bool modoClaro = true; //Controla el tema
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: (modoClaro)?ThemeData.light():ThemeData.dark(),
      home: MainScreen() //Accede a la aplicación principal
    );
  }
  void cambiarModo(bool){ //Función de cambio de tema
    setState(() { //Cambia el estado del booleano y cambia de tema en el MaterialApp
      modoClaro = bool; 
    });
  }
}
