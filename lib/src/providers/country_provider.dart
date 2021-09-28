import 'dart:convert';
import 'package:http/http.dart' as http;

class CountryProvider{
  final _url = "https://countriesnow.space/api/v0.1/countries";
  // listado de paises https://restcountries.com/v2/all
  // listado de ciudades https://countriesnow.space/api/v0.1/countries/cities
  Future<dynamic> getCountriesAndCities()async{
    final resp = await http.get(
      Uri.parse(_url)
    );
    final result = json.decode(resp.body);
    print("provider result --> $result");
    return result;
  }

}