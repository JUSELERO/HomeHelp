import 'package:flutter/material.dart';
import 'package:homehealth/src/pages/activities/activities_page.dart';
import 'package:homehealth/src/pages/activities/manage_activity_page.dart';
import 'package:homehealth/src/pages/main_page.dart';

import 'package:homehealth/src/pages/home_page.dart';
import 'package:homehealth/src/pages/auth/login_page.dart';
import 'package:homehealth/src/pages/auth/register_page.dart';
import 'package:homehealth/src/pages/auth/register_profile_page.dart';
import 'package:homehealth/src/pages/activities/my_activities_page.dart';
import 'package:homehealth/src/preferencias_usuario/preferencias_usuario.dart';
import 'package:homehealth/src/providers/provider.dart';
import 'package:homehealth/src/utils/constants.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = new PreferenciasUsuario();
  await prefs.initPrefs();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final prefs = new PreferenciasUsuario();
    print(prefs.token);
    return Provider(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'HomeHelp App',
        initialRoute: 'login',
        theme: ThemeData(
            primaryColor: primaryColor, scaffoldBackgroundColor: Colors.white),
        routes: {
          'login': (BuildContext context) => LoginPage(),
          'home': (BuildContext context) => HomePage(), ////deprecado
          'registro': (BuildContext context) => RegisterPage(),
          'register-profile': (BuildContext context) => RegisterProfilePage(),
          'main': (BuildContext context) => MainPage(),
          'my-activites': (BuildContext context) => MyActivitiesPage(),
          'activities': (BuildContext context) => ActivitiesPage(),
          "manage-activity": (BuildContext context) => ManageActivityPage()
        },
        localizationsDelegates: [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: [
          const Locale('en', 'US'),
          const Locale('es', 'ES'),
        ],
      ),
    );
  }
}
