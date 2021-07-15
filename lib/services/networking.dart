import 'package:http/http.dart' as http;
import 'dart:convert';

class NetworkHelper {
  Future<String> getData() async {
    var response = await http.get(Uri.parse(
        'https://newsapi.org/v2/everything?q=keyword&apiKey=f75f221b3c964df6b5ef8c6845ed2333#'));

    if (response.statusCode == 200) {
      String data = response.body;
      return jsonDecode(data);
    } else {
      return 'null';
    }
  }
}
