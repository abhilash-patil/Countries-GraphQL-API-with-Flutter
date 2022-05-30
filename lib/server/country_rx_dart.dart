import 'package:countries/model/Country.dart';
import 'package:countries/server/api_client.dart';
import 'package:rxdart/rxdart.dart';

class CountryRx {
  final country = PublishSubject<Country>();
  Stream<Country> get fetchCountry => country.stream;

  ApiClients apiClients = ApiClients();

  //Pass param to query country
  fetchCountryByCode(String code) {
    Future<Country> result = apiClients.getCountry(code);
    result.then((value) => country.sink.add(value));
  }

  dispose() {
    country.close();
  }
}

var countryRx = CountryRx();