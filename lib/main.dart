import 'dart:ui';

import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final appTitle = 'Mi primera app en flutter';

    return MaterialApp(
      title: appTitle,
      home: Scaffold(
        appBar: AppBar(
          title: Text(appTitle),
        ),
        body: MiForm(),
      ),
    );
  }
}

//widget del form
class MiForm extends StatefulWidget {
  @override
  MiFormState createState() {
    return MiFormState();
  }
}

//esta clase contendra los datos relacionados al formulario
class MiFormState extends State<MiForm>{
  //clave identificación del widget, con esta validamos el form
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    //creamos el form usando el key que creamos antes
    return Form(
      key: _formKey,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'Nombre',
                hintText: 'Ingresa tu nombre',
                icon: Icon(Icons.person)
              ),
              validator: (value){
                if(value!.isEmpty)
                  return "Por favor ingresa algún texto";
              }
            ),
            Padding(            
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.blue,
                  onPrimary: Colors.white,
                  elevation: 8.0,
                  padding: EdgeInsets.symmetric(vertical: 15.0),                  
                ),
                onPressed: (){
                  //devuelve true si el formulario es valido
                  if(_formKey.currentState!.validate()){
                    ScaffoldMessenger.of(context)
                      .showSnackBar(SnackBar(content: Text("Formulario valido")));
                  }
                  else
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text("Algún campo esta vacío")));
                },
                child: Text("Enviar"),
              ),
            )
          ]        
        ),
      )
    );
  }
}