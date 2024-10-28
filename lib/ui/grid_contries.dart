import 'package:countries_app/data/models/country.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CountryGrid extends StatelessWidget {
  final List<Country> countries;

  const CountryGrid({Key? key, required this.countries}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.all(8.0),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 4,
        mainAxisSpacing: 4,
        childAspectRatio: 1.7,
      ),
      itemCount: countries.length,
      itemBuilder: (context, index) {
        final country = countries[index];
        return GestureDetector(
          onTap: () {
            context.push('/country-detail', extra: country); // Usa context.push
          },
          child: Card(
            clipBehavior: Clip.antiAliasWithSaveLayer,
            color: Colors.black,
            elevation: 4,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            child: Stack(
              children: [
                Opacity(
                  opacity: 0.3,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.network(
                      country.flagImageUrl,
                      width: double.infinity,
                      height: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Align(
                  alignment: AlignmentDirectional(0, 0),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      country.name,
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        shadows: [
                          Shadow(
                            color: Colors.black,
                            offset: Offset(0.0, 0.0),
                            blurRadius: 4.0,
                          ),
                        ],
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
