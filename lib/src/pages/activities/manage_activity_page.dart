import 'package:flutter/material.dart';
import 'package:homehealth/src/widgets/background.dart';

class ManageActivityPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Text("Crear Actividad"),
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        centerTitle: true,
      ),
      body: Background(
        child: Container(
          margin: EdgeInsets.only(top: size.height * 0.15),
          child: Column(
            children: [
              TextField(
                decoration: InputDecoration(
                  hintText: "Nombre de la actividad"
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}