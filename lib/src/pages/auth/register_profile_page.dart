import 'package:flutter/material.dart';
import 'package:homehealth/src/bloc/register_profile_bloc.dart';
import 'package:homehealth/src/providers/country_provider.dart';
import 'package:homehealth/src/providers/provider.dart';
import 'package:homehealth/src/widgets/background.dart';

class RegisterProfilePage extends StatefulWidget {

  @override
  _RegisterProfilePageState createState() => _RegisterProfilePageState();
}

class _RegisterProfilePageState extends State<RegisterProfilePage> {
  final countryProvider = new CountryProvider();

  List countries;

  @override
  void initState() {
    super.initState();
    countryProvider.getCountriesAndCities()
    .then((result){
      print("result ---> $result");
      this.countries = result.data;
    })
    .catchError((error){
      print(error);
      
    })
    ;
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final bloc = Provider.registerProfile(context);
    return Scaffold(
      body: Background(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: size.width * 0.2,
                margin: EdgeInsets.only(
                  left: size.width * 0.5, 
                  bottom: size.height * 0.03
                ),
                child: Image(
                  image: AssetImage('assets/icons/logo.png'),
                )
              ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: size.width * 0.05),
              child: Text(
                "Ingrese la siguiente información para completar el registro del perfil de usuario",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18.0,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(
              height: size.height * 0.01,
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 10),
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
              width: size.width * 0.8,
              decoration: BoxDecoration(
                  color: Colors.grey.shade100,
                  borderRadius: BorderRadius.circular(29)),
              child: StreamBuilder(
                stream: bloc.nameStream,
                builder: (context, snapshot) {
                  return TextField(
                    onChanged: (value) => bloc.changeName(value),
                    keyboardType: TextInputType.name,
                    decoration: InputDecoration(
                      icon: Icon(Icons.person_outline_sharp, color: Colors.black12),
                      hintText: "Nombre",
                      border: InputBorder.none,
                      counterText: snapshot.data,
                      errorText: snapshot.error
                    ),
                  );
                }
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 10),
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
              width: size.width * 0.8,
              decoration: BoxDecoration(
                color: Colors.grey.shade100,
                borderRadius: BorderRadius.circular(29)),
              child: StreamBuilder(
                stream: bloc.lastNameStream,
                builder: (context, snapshot) {
                  return TextField(
                    onChanged: (value) => bloc.changeLastName,
                    keyboardType: TextInputType.name,
                    decoration: InputDecoration(
                      icon: Icon(Icons.person_outline_sharp, color: Colors.black12),
                      hintText: "Apellido",
                      border: InputBorder.none,
                      errorText: snapshot.error
                    ),
                  );
                }
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 10),
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
              width: size.width * 0.8,
              decoration: BoxDecoration(
                color: Colors.grey.shade100,
                borderRadius: BorderRadius.circular(29)),
              child: StreamBuilder(
                stream: bloc.documentNumberStream,
                builder: (context, snapshot) {
                  return TextField(
                    onChanged: (value) => bloc.changeDocumentNumber(value),
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      icon: Icon(Icons.credit_card, color: Colors.black12),
                      hintText: "Número de Identificación",
                      border: InputBorder.none,
                      errorText: snapshot.error,
                    ),
                  );
                }
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 10),
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
              width: size.width * 0.8,
              decoration: BoxDecoration(
                color: Colors.grey.shade100,
                borderRadius: BorderRadius.circular(29)),
              child: StreamBuilder(
                stream: bloc.phoneStream,
                builder: (context, snapshot) {
                  return TextField(
                    onChanged: (value) => bloc.changePhone,
                    keyboardType: TextInputType.phone,
                    decoration: InputDecoration(
                      icon: Icon(Icons.phone, color: Colors.black12),
                      hintText: "Número de Telefono",
                      border: InputBorder.none,
                      errorText: snapshot.error,
                    ),
                  );
                }
              ),
            ),
            Container(
                margin: EdgeInsets.symmetric(vertical: 10),
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                width: size.width * 0.8,
                decoration: BoxDecoration(
                  color: Colors.grey.shade100,
                  borderRadius: BorderRadius.circular(29)),
                child: StreamBuilder(
                  stream: bloc.birthdateStream,
                  builder: (context, snapshot) {
                    return TextField(  
                      onChanged: (value) => {},
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        icon: Icon(Icons.calendar_today, color: Colors.black12),
                        hintText: "Fecha de Nacimiento",
                        border: InputBorder.none,
                        counterText: snapshot.data
                      ),
                      onTap: () {
                        FocusScope.of(context).requestFocus(new FocusNode());
                        _selectDate(context,bloc);
                      },
                    );
                  }
                )),
            SizedBox(height: size.height * 0.02),
            StreamBuilder<Object>(
              stream: bloc.formValidStream,
              builder: (context, snapshot) {
                return ElevatedButton(
                  onPressed: snapshot.hasData ? () => {} : null,
                  child: Container(
                    child: Text(
                      'Guardar',
                      style: TextStyle(fontSize: 18.0),
                    ),
                    padding: EdgeInsets.symmetric(vertical: 19, horizontal: 100),
                  ),
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(29)),
                    elevation: 0.0,
                    primary: Colors.deepPurple,
                    onPrimary: Colors.white
                  )
                );
              }
            ),
            ElevatedButton(
              onPressed: () => verPaises(), 
              child: Text("Ver Paises")
            )
          ],
        )),
      ),
    );
  }

  void _selectDate(BuildContext context,RegisterProfileBloc bloc) async {
    DateTime picked = await showDatePicker(
        context: context,
        initialDate: new DateTime.now(),
        firstDate: new DateTime(1900),
        lastDate: new DateTime(2025),
        locale: Locale('es', 'ES'));
    if (picked != null) {
      bloc.changeBirthdate(picked.toString());
    }
  }

  verPaises() {
    countryProvider.getCountriesAndCities();

  }
}
