import 'package:flutter/material.dart';
import 'package:homehealth/src/preferencias_usuario/preferencias_usuario.dart';

class ProfilePage extends StatelessWidget {

  final _prefs = PreferenciasUsuario();
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Text("Perfil del Usuario"),
          Text("${_prefs.uid}")
        ],
      ),
    );
  }
}