import 'package:http/http.dart' as http;
abstract class CountriesRepository {
  Future<http.Response> index();
  }