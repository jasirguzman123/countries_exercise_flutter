class Country {
  String name;
  String capital;
  String currency;
  String flagImageUrl;

  Country({
    required this.name,
    required this.capital,
    required this.currency,
    required this.flagImageUrl,
  });

  factory Country.fromJson(data) {
    return Country(
      name: data["name"],
      capital: data["capital"],
      currency: data["currency"],
      flagImageUrl: data["flag"],
    );
  }
}
