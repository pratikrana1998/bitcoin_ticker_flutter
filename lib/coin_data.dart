import 'package:http/http.dart' as http;
import 'dart:convert';

const List<String> currenciesList = [
  'AUD',
  'BRL',
  'CAD',
  'CNY',
  'EUR',
  'GBP',
  'HKD',
  'IDR',
  'ILS',
  'INR',
  'JPY',
  'MXN',
  'NOK',
  'NZD',
  'PLN',
  'RON',
  'RUB',
  'SEK',
  'SGD',
  'USD',
  'ZAR'
];

const List<String> cryptoList = [
  'BTC',
  'ETH',
  'LTC',
];

const coinAPIURL = 'https://rest.coinapi.io/v1/exchangerate';
const apiKey = '724BE766-F368-455E-9E4F-3AE8F296E0DB';

class CoinData {
  Future getCoinData() async {
    String url = '$coinAPIURL/BTC/USD?apikey=$apiKey';
    http.Response response = await http.get(url);
    if(response.statusCode == 200) {
      var decodedData = jsonDecode(response.body);
      var price = decodedData['rate'];
      return price;
    } else {
      print(response.statusCode);
      throw 'Error: Unable to fetch data from API';
    }
  }
}
