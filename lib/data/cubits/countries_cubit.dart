import 'package:countries_app/data/models/country.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:countries_app/data/respositories/countries_repository.dart';

class Response {
  final int status;
  final List<Country>? countries;

  Response({required this.status, this.countries});
}

class CountriesCubit extends Cubit<List<Country>> {
  final CountriesRepository _countriesRepository;
  CountriesCubit(this._countriesRepository) : super([]);

  Future<void> index() async {
    try {
      final countries = await _countriesRepository.index();
      emit(countries);
    } catch (e) {
      emit([]);
    }
  }
}

