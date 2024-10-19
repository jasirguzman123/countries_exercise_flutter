import 'package:countries_app/data/cubits/countries_cubit.dart';
import 'package:countries_app/data/models/country.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomeScreen();
  }
}

class _HomeScreen extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();

    context.read<CountriesCubit>().index();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<CountriesCubit, Response?>(
        builder: (context, response) {
          if (response == null) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          return Padding(
            padding: EdgeInsets.all(15),
            child: ListView(
              children: [
                for (Country country in response.countries!)
                  ListTile(
                    title: Text(country.name),
                    subtitle: Text(country.capital),
                    leading: Image.network(country.flagImageUrl),
                  )
              ],
            ),
          );
        },
      ),
    );
  }
}
