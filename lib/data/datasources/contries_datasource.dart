import 'dart:convert';

import 'package:countries_app/data/respositories/countries_repository.dart';
import 'package:http/src/response.dart';

class CountriesLocal implements CountriesRepository {
  @override
  Future<Response> index() async {
    return Response(
      json.encode([
        {
          "name": "Colombia",
          "currency": "COP",
          "capital": "Bogotá",
          "flag": "https://flagcdn.com/w320/gd.png"
        },
        {
          "name": "Colombia",
          "currency": "COP",
          "capital": "Bogotá",
          "flag": "https://flagcdn.com/w320/gd.png"
        },
        {
          "name": "Colombia",
          "currency": "COP",
          "capital": "Bogotá",
          "flag": "https://flagcdn.com/w320/gd.png"
        },
      ]),
      200,
    );
  }
}

class CountriesApi implements CountriesRepository {
  @override
  Future<Response> index() async {
    // TODO: implement index
    throw UnimplementedError();
  }
}
