import 'dart:convert';
import 'package:countries_app/data/models/country.dart';
import 'package:countries_app/data/respositories/countries_repository.dart';
import 'package:http/http.dart' as http;


class CountriesApi implements CountriesRepository {
  @override
  Future<List<Country>> index() async {
    final response = await http.get(Uri.parse('https://restcountries.com/v3.1/all'));

    if (response.statusCode == 200) {
      final List<dynamic> jsonData = jsonDecode(response.body);
      final List<Country> countries = jsonData.map<Country>((data) => Country.fromJson(data)).toList();
      return countries;
    } else {
      throw Exception('Failed to load countries');
    }
  }
}