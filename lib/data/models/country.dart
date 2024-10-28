class Country {
  String name;
  String capital;
  String currency;
  String currencySymbol;
  String flagImageUrl;
  String flagDescription;
  String region;
  int population;
  List<String> languages;

  Country({
    required this.name,
    required this.capital,
    required this.currency,
    required this.currencySymbol,
    required this.flagImageUrl,
    required this.flagDescription,
    required this.region,
    required this.population,
    required this.languages,
  });

  factory Country.fromJson(Map<String, dynamic> data) {
    String name = data["name"]?["common"] ?? "N/A";

    String capital = "N/A";
    if (data["capital"] != null && data["capital"].isNotEmpty) {
      capital = data["capital"][0];
    }
    String currency = "N/A";
    String currencySymbol = "N/A";
    if (data["currencies"] != null && data["currencies"].isNotEmpty) {
      var currencies = data["currencies"] as Map<String, dynamic>;
      var firstCurrencyKey = currencies.keys.first;
      currency = currencies[firstCurrencyKey]?["name"] ?? "N/A";
      currencySymbol = currencies[firstCurrencyKey]?["symbol"] ?? "N/A";
    }
    String flagImageUrl = data["flags"]?["png"] ?? "";
    String flagDescription = data["flags"]?["alt"] ?? "Sin descripción disponible.";
    String region = data["region"] ?? "N/A";
    int population = data["population"] ?? 0;
    List<String> languages = [];
    if (data["languages"] != null) {
      languages = (data["languages"] as Map<String, dynamic>).values.map((e) => e as String).toList();
    }

    return Country(
      name: name,
      capital: capital,
      currency: currency,
      currencySymbol: currencySymbol,
      flagImageUrl: flagImageUrl,
      flagDescription: flagDescription,
      region: region,
      population: population,
      languages: languages,
    );
  }
}
