import 'package:countries_app/data/models/country.dart';
abstract class CountriesRepository {
  Future<List<Country>> index();
}
