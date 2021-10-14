import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:homehealth/src/models/profile_model.dart';
import 'package:homehealth/src/preferencias_usuario/preferencias_usuario.dart';
import 'package:homehealth/src/providers/usuario_provider.dart';

class ProfilePage extends StatelessWidget {

  final _prefs = PreferenciasUsuario();
  final UsuarioProvider _usuarioProvider = new UsuarioProvider();
  final skills = [
    {
      "title": "Cocinar",
      "imagen": "https://imagenes.elpais.com/resizer/k5jZt-d0--28zFVftXWguAvMFA0=/414x0/cloudfront-eu-central-1.images.arcpublishing.com/prisa/S2J53UUBUBBPAMPN4RSWRGN52Y.jpg",
      "score": "340"
    },
    {
      "title": "Lavar Baños",
      "imagen": "https://www.wikihow.com/images/0/0c/Use-A-Toilet-Brush-Step-1.jpg",
      "score": "120"
    },
      {
      "title": "Planchas Ropa",
      "imagen": "https://st4.depositphotos.com/13193658/19884/i/600/depositphotos_198846740-stock-photo-cropped-view-of-girl-ironing.jpg",
      "score": "230"
    },
  ];
  final _pageController = new PageController(
    viewportFraction: 0.3,
  );
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      child: FutureBuilder(
        future: _usuarioProvider.getProfileUser(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          final infoProfile = snapshot.data;
          if(snapshot.hasData){
            return SingleChildScrollView(
              child: Container(
                margin: EdgeInsets.only(
                  top: size.height * 0.12,
                ),
                child: Column(
                  children: [
                    Container(
                      height: size.height * 0.2,
                      margin: EdgeInsets.symmetric(
                        horizontal: size.width * 0.03
                      ),
                      child:
                        ClipRRect(
                          borderRadius: BorderRadius.circular(10.0),
                          child: Card(      
                            elevation: 10.0,
                            shadowColor: Colors.black,
                            child: Column(
                              children:[
                                Row(
                                  children: [
                                    Container(
                                      margin: EdgeInsets.only(
                                        top: size.height * 0.05,
                                        left: size.width * 0.02
                                      ),
                                      child: CircleAvatar(
                                        radius: 45.0,
                                        backgroundImage: AssetImage("assets/images/user.jpg"),
                                      ),
                                    ),
                                    SizedBox(width: size.width * 0.02),
                                    Container(
                                      margin: EdgeInsets.only(top: size.height * 0.04),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "${infoProfile["firstname"]} ${infoProfile["lastname"]}",
                                            style: TextStyle(
                                              fontSize: 23.0,
                                              fontWeight: FontWeight.bold
                                            )
                                          ),
                                          SizedBox(height: size.height * 0.003),
                                          Text(
                                            '${infoProfile["address"]} Bucaramanga/Santander',
                                          ),
                                          SizedBox(height: size.height * 0.003),
                                          Text(
                                            '${infoProfile["phone"]}'
                                          ),
                                          SizedBox(height: size.height * 0.003),
                                          Text(
                                            '${infoProfile["user"]}'
                                          )
                                        ],
                                      ),
                                    ),
                                    SizedBox(width: size.height * 0.01)
                                  ],
                                )
                              ]
                            ),
                          ),
                        )
                    ),
                    Container(
                      margin: EdgeInsets.only(
                        top: size.height * 0.03,
                        left: size.width * 0.03,
                      ),
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Skills",
                        style: TextStyle(
                          fontSize: 26.0,
                          fontWeight: FontWeight.bold
                        ),
                      ),
                    ),
                    Container(
                      height: size.height * 0.3,
                      child: PageView.builder(
                        itemBuilder: (context, i) => _crearTarjetaSkill(context, skills[i]),
                        pageSnapping: false,
                        controller: _pageController,
                        itemCount: skills.length,
                      ),
                    )
                  ],
                ),
              ),
            );
          } else {
            return Center(
              child: CircularProgressIndicator() ,
            );
          }
        },
      ),
    );
  }

  _crearTarjetaSkill(BuildContext context, dynamic skill) {
    return Container(
      margin: EdgeInsets.only(right: 15.0),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20.0),
            child: FadeInImage(
              placeholder: AssetImage('assets/images/no-image.jpg'),
              image: NetworkImage(skill["imagen"]),
              fit: BoxFit.cover,
              height: 150.0,
            ),
          ),
          SizedBox(
            height: 5.0,
          ),
          Text(
            "${skill["title"]} -- ${skill["score"]} puntos",
            overflow: TextOverflow.ellipsis,
            style: Theme.of(context).textTheme.caption,
          )
        ],
      ),
    );
  }
}