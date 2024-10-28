import 'package:flutter/material.dart';
import 'package:countries_app/data/models/country.dart';
import 'package:go_router/go_router.dart'; // Importa GoRouter

class CountryDetailScreen extends StatelessWidget {
  final Country country;

  const CountryDetailScreen({Key? key, required this.country}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final languages = country.languages.join(', ');
    return Scaffold(
      appBar: AppBar(
        title: Text(country.name),
        backgroundColor: Colors.black,
        
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(16.0),
              child: Column(
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
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ElevatedButton(
              onPressed: () {
                context.pop(); 
              },
              child: Text('Volver'),
              style: ElevatedButton.styleFrom(
                minimumSize: Size(double.infinity, 50),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
