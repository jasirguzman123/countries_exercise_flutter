import 'package:countries_app/data/cubits/countries_cubit.dart';
import 'package:countries_app/data/datasources/contries_datasource.dart';
import 'package:countries_app/data/respositories/countries_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Dependencies {
  static List<RepositoryProvider> mainRepositories() {
    return [
      RepositoryProvider<CountriesRepository>(create: (_) => CountriesLocal()),
      RepositoryProvider<CountriesCubit>(
        create: (context) => CountriesCubit(
          context.read<CountriesRepository>(),
        ),
      ),
    ];
  }
}
