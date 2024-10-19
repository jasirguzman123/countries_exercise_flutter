import 'package:http/http.dart';

abstract class CountriesRepository {
  Future<Response> index();
}
