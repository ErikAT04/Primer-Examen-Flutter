import 'dart:ui';
import 'dart:math';
import 'package:flutter/material.dart';

class RegisterScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return RegisterState();
  }
}

class RegisterState extends State<RegisterScreen> {
  final passController = TextEditingController(); //Controlador de texto de la contraseña
  RegExp validacionEmail =
      RegExp(r"^[a-zA-z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-z-A-Z]+"); //Expresión regular
  final _formkey = GlobalKey<FormState>(); //Key del formulario
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container( //Todo está metido en un contenedor de altura y anchura fit-content (al no especificarlo se pone de forma automática)
          margin: EdgeInsets.all(50),
          padding: EdgeInsets.all(10),
          child: SingleChildScrollView( //Si la pantalla se hace pequeña, permite scrollear
            child: Column(
              children: [
                Form( //Formulario
                    key: _formkey,
                    child: Column(
                      children: [
                        TextFormField(
                          decoration: InputDecoration(
                              labelText: "Nombre",
                              border: OutlineInputBorder()),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "El nombre no puede estar vacío";
                            } else {
                              return null;
                            }
                          },
                        ),
                        Padding(padding: EdgeInsets.all(10)),
                        TextFormField(
                          decoration: InputDecoration(
                              labelText: "Apellidos",
                              border: OutlineInputBorder()),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Los apellidos no pueden estar vacíos";
                            } else {
                              return null;
                            }
                          },
                        ),
                        Padding(padding: EdgeInsets.all(10)),
                        TextFormField(
                          decoration: InputDecoration(
                              labelText: "Email", border: OutlineInputBorder()),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Escribe un email";
                            } else if (validacionEmail.hasMatch(value)) {
                              return null;
                            } else {
                              return "El email no cumple los requisitos";
                            }
                          },
                        ),
                        Padding(padding: EdgeInsets.all(10)),
                        TextFormField(
                          obscureText: true, //Los puntos en vez del texto
                          controller: passController,
                          decoration: InputDecoration(
                              labelText: "Contraseña",
                              border: OutlineInputBorder()),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Escriba una contraseña";
                            } else if (value.length >= 6) {
                              return null;
                            } else {
                              return "La contraseña debe tener un mínimo de 6 caracteres";
                            }
                          },
                        ),
                        Padding(padding: EdgeInsets.all(10)),
                        TextFormField(
                          obscureText: true, //Los puntos en vez del texto
                          decoration: InputDecoration(
                              labelText: "Confirmar Contraseña",
                              border: OutlineInputBorder()),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Debe confirmar la contraseña";
                            } else if (value == passController.text) {
                              return null;
                            } else {
                              return "Las contraseñas no coinciden";
                            }
                          },
                        )
                      ],
                    )),
                Padding(padding: EdgeInsets.all(10)),
                ElevatedButton(
                    onPressed: () {
                      _formkey.currentState!.validate(); //Simplemente hace la validación del formulario.
                    },
                    child: Text("Registrarse"))
              ],
            ),
          )),
    );
  }
}
