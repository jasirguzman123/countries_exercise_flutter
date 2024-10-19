import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:countries_app/data/models/country.dart';
import 'package:countries_app/data/respositories/countries_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Response {
  int status;
  List<Country>? countries;

  Response({required this.status, this.countries});
}

class CountriesCubit extends Cubit<Response?> {
  final CountriesRepository _countriesRepository;

  CountriesCubit(this._countriesRepository) : super(null);

  index() async {
    http.Response response = await _countriesRepository.index();

    if (response.statusCode == 200) {
      emit(
        Response(
          status: 200,
          countries: jsonDecode(response.body)
              .map<Country>(
                (data) => Country.fromJson(data),
              )
              .toList(),
        ),
      );
    }
  }
}
