import 'package:homehealth/src/models/activity_model.dart';
import 'package:homehealth/src/preferencias_usuario/preferencias_usuario.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';


class ActivityProvider{

  final String _url = 'https://homehelp-7ac26-default-rtdb.firebaseio.com//activities.json?auth';
  final _prefs = new PreferenciasUsuario(); 

  saveActivity(ActivityModel activity) async{
    final url = '$_url=${ _prefs.token }';
    final resp = await http.post(
      Uri.parse(url),
      body:activityModelToJson(activity)
    );

    Map<String, dynamic> decodedResp = json.decode(resp.body);

    print("decodedResp ----> $decodedResp");

  }
}