import 'dart:convert';
import 'package:countries_app/data/respositories/countries_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:countries_app/data/models/country.dart';
import 'package:http/http.dart' as http;

class CountriesResponse {
  final int status;
  final List<Country>? countries;

  CountriesResponse({required this.status, this.countries});
}

class CountriesCubit extends Cubit<CountriesResponse> {
  final CountriesRepository _countriesRepository;
  CountriesCubit(this._countriesRepository) : super(CountriesResponse(status: 0, countries: []));

  index() async {
    try {
      final http.Response response = await _countriesRepository.index();
      if (response.statusCode == 200) {
        final List<dynamic> jsonData = jsonDecode(response.body);
        final List<Country> countries = jsonData.map((data) => Country.fromJson(data)).toList();
        emit(CountriesResponse(status: response.statusCode, countries: countries));
      } else {
        emit(CountriesResponse(status: response.statusCode, countries: []));
      }
    } catch (e) {
      emit(CountriesResponse(status: 500, countries: []));
    }
  }
}
