import 'dart:collection';
import 'package:homehealth/src/models/activity_model.dart';
import 'package:homehealth/src/preferencias_usuario/preferencias_usuario.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
export 'package:homehealth/src/models/activity_model.dart';


class ActivityProvider{

  final String _url = 'https://homehelp-7ac26-default-rtdb.firebaseio.com//activities.json';
  final _prefs = new PreferenciasUsuario();
  List<ActivityModel> myActivities = [];
  List<ActivityModel> activities = [];

  Future<bool> createActivity(ActivityModel activity) async{
    activity.postedBy = _prefs.uid;
    final url = '$_url';
    final resp = await http.post(
      Uri.parse(url),
      body:activityModelToJson(activity)
    );
    Map<String, dynamic> decodedResp = json.decode(resp.body);
    print("decodeResp ---> $decodedResp");
    if (decodedResp.containsKey('name')) {
      return true;
    } else {
      return false;
    }
  }

  updateActivity(ActivityModel activity) async{

  }


  deleteActivity(ActivityModel activity) async{

  }

  Future<List<ActivityModel>> getMyActivities() async {
    myActivities = [];
    final url = '$_url';
    final resp = await http.get(
      Uri.parse(url),
    );
    Map<String, dynamic> decodedResp = json.decode(resp.body);
    if(decodedResp == null ) return [];
    decodedResp.forEach((id,actividad) { 
      if(actividad["posted_by"] == _prefs.uid) {
        final actividadTemp = ActivityModel.fromJson(actividad);
        actividadTemp.id = id;
        myActivities.add(actividadTemp);
      }
    });
    for (var item in myActivities) {
      item.namePosted = await this.getNamePostedBy(item.postedBy);
    }
    return myActivities;
  }

  Future<List<ActivityModel>> getActivities() async {
    activities = [];
    final url = '$_url';
    final resp = await http.get(
      Uri.parse(url),
    );
    Map<String, dynamic> decodedResp = json.decode(resp.body);
    if(decodedResp == null ) return [];

    decodedResp.forEach((id,actividad) { 
      if(actividad["posted_by"] != _prefs.uid) {
        final actividadTemp = ActivityModel.fromJson(actividad);
        actividadTemp.id = id;
        activities.add(actividadTemp);
      }
    });

    for (var item in activities) {
      item.namePosted = await this.getNamePostedBy(item.postedBy);
    }
    return activities;
  }

  Future<String> getNamePostedBy(String idProfile) async {
    print("idProfile ----> $idProfile");
    String firstname = "";
    final url = 'https://homehelp-7ac26-default-rtdb.firebaseio.com/profiles/.json';
    final resp = await http.get(
      Uri.parse(url),
    );
    Map<String, dynamic> decodedResp = json.decode(resp.body);
    decodedResp.forEach((key, value) {
      if(key == idProfile){
        Map<String,dynamic> profile = HashMap.from(value);
        firstname = profile.values.first['firstname'];
      }
    });
    return firstname;
  }

}