import 'package:flutter/material.dart';
import 'package:countries_app/data/models/country.dart';
import 'package:go_router/go_router.dart';

class Country_Detail_Screen extends StatelessWidget {
  final Country country;

  const Country_Detail_Screen({Key? key, required this.country}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final languages = country.languages.join(', ');
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            context.pop();
          },
        ),
        title: Text(country.name),
        backgroundColor: Colors.black,
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.network(country.flagImageUrl),
              SizedBox(height: 16),
              Text(
                country.name,
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 16),
              Text('Capital: ${country.capital}'),
              Text('Región: ${country.region}'),
              Text('Población: ${country.population}'),
              Text('Moneda: ${country.currency} (${country.currencySymbol})'),
              Text('Idiomas: $languages'),
            ],
          ),
        ),
      ),
    );
  }
}
