class CountryModel {
  late String country;
  late List<String> subCountries;

  CountryModel({this.country = '', this.subCountries = const <String>[]});

  CountryModel.fromJson(Map<String, dynamic> json) {
    country = json['country'];
    if (json['subCountries'] != null) {
      subCountries = json['subCountries'].map((x) => x).toList().cast<String>();
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};

    data['country'] = country;
    data['subCountries'] = subCountries;

    return data;
  }
}
