import 'package:countries_app/data/cubits/countries_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:countries_app/ui/screens/search_widget.dart';
import 'package:countries_app/ui/grid_contries.dart';
import 'package:countries_app/data/models/country.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomeScreen();
  }
}

class _HomeScreen extends State<HomeScreen> {
  final TextEditingController _searchController = TextEditingController();
  List<Country> _allCountries = [];
  List<Country> _filteredCountries = [];

  @override
  void initState() {
    super.initState();
    context.read<CountriesCubit>().index();
    _searchController.addListener(_onSearchChanged);
  }

  @override
  void dispose() {
    _searchController.removeListener(_onSearchChanged);
    _searchController.dispose();
    super.dispose();
  }

  void _onSearchChanged() {
    setState(() {
      _filteredCountries = _allCountries
          .where((country) => country.name.toLowerCase().contains(_searchController.text.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 118, 114, 114),
      body: Column(
        children: [
          SearchWidget(controller: _searchController),
          Expanded(
            child: BlocBuilder<CountriesCubit, List<Country>>(
              builder: (context, countries) {
                if (countries.isEmpty) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }

                _allCountries = countries;
                _filteredCountries = _searchController.text.isEmpty ? _allCountries : _filteredCountries;

                return Padding(
                  padding: EdgeInsets.all(15),
                  child: CountryGrid(
                    countries: _filteredCountries,
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
