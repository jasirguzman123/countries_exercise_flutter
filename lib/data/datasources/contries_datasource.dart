import 'package:countries_app/data/respositories/countries_repository.dart';
import 'package:http/http.dart' as http;


class CountriesApi implements CountriesRepository {
  @override
  Future<http.Response> index() async {
    final response = await http.get(Uri.parse('https://restcountries.com/v3.1/all'));

    if (response.statusCode == 200) {
      return response;
    } else {
      throw Exception('Failed to load countries');
    }
  }
}