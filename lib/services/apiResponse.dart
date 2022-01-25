import 'package:crypto_app/models/apiModel.dart';
import 'package:http/http.dart' as http;

class ApiData {
  static Future<List<CoinApiModel>> apiModel() async {
    var client = http.Client();
    const String uri =
        "https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&order=market_cap_desc&per_page=6000&page=1&sparkline=false";

    try {
      final channaelResponse = await client.get(Uri.parse(uri));
      // print(channaelResponse.body);

      return coinApiModelFromMap(channaelResponse.body);
    } catch (e) {
      print(e);
      return [];
    }
  }
}
