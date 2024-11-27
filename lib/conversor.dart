import 'package:flutter/material.dart';

class ConversorScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return ConversorState();
  }
}

class ConversorState extends State<ConversorScreen> {
  Map<String, Map<String, double>> mapaValores = { //Mapa de datos a convertir
    'USD': {'EUR': 0.85, 'JPY': 110.0, 'USD': 1.0},
    'EUR': {'EUR': 1.0, 'JPY': 129.0, 'USD': 1.18},
    'JPY': {'EUR': 0.0077, 'JPY': 1.0, 'USD': 0.0091},
  };
  String? errorTxt = null; //Texto de error en el conversor
  TextEditingController controller = TextEditingController(); //Controller
  String valorOrigen = "USD";
  String valorDestino = "USD";
  //Valores iniciales
  double cantidad = 0;
  var listaMonedas = [ //Lista de botones de monedas
    DropdownMenuItem(
      child: Text("USD"),
      value: "USD",
    ),
    DropdownMenuItem(
      child: Text("EUR"),
      value: "EUR",
    ),
    DropdownMenuItem(
      child: Text("JPY"),
      value: "JPY",
    )
  ];
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Container(
      margin: EdgeInsets.all(50),
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Card(
              child: Column(
                children: [
                  Text("Moneda de Origen"),
                  DropdownButton(
                    items: listaMonedas, //Usa la lista de monedas
                    onChanged: (value) {
                      setState(() { //Cambia el valor del String de valorOrigen al valor que se haya pulsado
                        valorOrigen = value.toString();
                      });
                    },
                    value: valorOrigen,
                  ),
                ],
              ),
            ),
            Padding(padding: EdgeInsets.all(10)),
            Card(
                child: Container(
              margin: EdgeInsets.all(10),
              child: Column(
                children: [
                  Text("Moneda de Destino:"),
                  DropdownButton(
                    items: listaMonedas, //Usa la lista de monedas
                    onChanged: (value) {
                      setState(() { //Cambia el valor del String de valorOrigen al valor que se haya pulsado
                        valorDestino = value.toString();
                      });
                    },
                    value: valorDestino,
                  ),
                ],
              ),
            )),
            Padding(padding: EdgeInsets.all(10)),
            Card(
                child: Container(
              margin: EdgeInsets.all(10),
              child: Column(
                children: [
                  Text(
                    "Ingresa la cantidad",
                    style: TextStyle(fontWeight: FontWeight.bold), //Texto en negrita
                  ),
                  TextField(
                    controller: controller, //Controller para sacar el texto
                    decoration: InputDecoration(
                        border: OutlineInputBorder(), //Borde del textfield
                        labelText: "Ingresa una cantidad",
                        errorText: errorTxt), //Texto si sale error
                  )
                ],
              ),
            )),
            Padding(padding: EdgeInsets.all(10)),
            Container(
              width: 200,
              child: ElevatedButton(
                onPressed: () {
                  try {
                    if (controller.text.isEmpty) { //Si el texto está vacío, marca un error de que no hay texto, y pone la cantidad en 0 para quitar la tarjeta de resultado
                      setState(() {
                        errorTxt = "Introduce un valor";
                        cantidad = 0;
                      });
                    } else if (double.parse(controller.text) <= 0) { //Si el texto como double es 0 o menos, dice que tiene que ser mayor a 0
                      setState(() {
                        errorTxt = "Tiene que ser un valor mayor a 0";
                        cantidad = 0;
                      });
                    } else { //Si pasa todos los controles:
                      Map<String, double> mapaOrigen =
                          mapaValores[valorOrigen]!; //Saco el mapa de la moneda origen (Porque el mapa principal es String, Mapa<String, Double>
                      double valorCambio = mapaOrigen[valorDestino]!; //Saco el valor en el destino
                      setState(() {
                        errorTxt = null; //No hay error de texto porque está todo bien
                        cantidad =
                            (double.parse(controller.text)) * valorCambio; //La cantidad es el número metido por el valor de cambio
                      });
                    }
                  } catch (e) { //Catch: Salta si el valor metido tiene letras
                    setState(() { //Cantidad = 0 y avisa que no puede haber letras
                      cantidad = 0;
                      errorTxt = "Solo puede haber números";
                    });
                  }
                },
                child:
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [Icon(Icons.swap_horiz), Text("Convertir")])),
            ), //Meto una imagen y un texto en el botón
            Padding(padding: EdgeInsets.all(10)),
            (cantidad != 0)
                ? Card(
                    child: Container(
                      child: Text("Resultado: $cantidad $valorDestino"),
                      margin: EdgeInsets.all(10),
                    ),
                  )
                : Padding(padding: EdgeInsets.all(0))
          ], //TERNARIO: Si la cantidad es 0, no hay nada. Si la cantidad tiene algún valor, aparece una Card con el resultado de la conversión
        ),
      ),
    ));
  }
}
