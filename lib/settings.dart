import 'package:examen_erik/main.dart';
import 'package:flutter/material.dart';

class SettingsScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return SettingsState();
  }
}

class SettingsState extends State<SettingsScreen> {
  bool modoClaro = true;
  String idioma = "ESP";
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Container(
      margin: EdgeInsets.all(50),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Card(
            child: Row(
              children: [
                Icon(Icons.language),
                Text("Idioma", style: TextStyle(fontWeight: FontWeight.bold)),
                Expanded( //Expanded sirve para todo ese espacio en blanco que aparece entre el texto y el menú
                  child: SizedBox(),
                ),
                DropdownButton(
                  items: [
                    DropdownMenuItem(
                      child: Text("Español"),
                      value: "ESP",
                    ),
                    DropdownMenuItem(
                      child: Text("Inglés"),
                      value: "ENG",
                    ),
                    DropdownMenuItem(
                      child: Text("Alemán"),
                      value: "DEU",
                    ),
                    DropdownMenuItem(
                      child: Text("Francés"),
                      value: "FRA",
                    ),
                  ],
                  onChanged: (value) {
                    setState(() {
                      idioma = value!;
                    });
                  },
                  value: idioma,
                )
              ],
            ),
          ),
          Padding(padding: EdgeInsets.all(10)),
          Card(
            child: Row(
              children: [
                Icon(Icons.dark_mode),
                Text("Modo Oscuro",
                    style: TextStyle(fontWeight: FontWeight.bold)),
                Expanded(
                  child: SizedBox(),
                ),
                Switch(
                    value: !modoClaro,
                    onChanged: (value) {
                      setState(() {
                        modoClaro = !value;
                        MainAppState state =
                            (context.findAncestorStateOfType<MainAppState>()!);
                        state.cambiarModo(modoClaro);
                      });
                    })
              ],
            ),
          )
        ],
      ),
    ));
  }
}
