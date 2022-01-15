import 'package:http/http.dart' as http;

class NetworkHelper {
  static Future getData(String url) async {
    print('getData location: ');
    http.Response response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      String data = response.body;
      return data;
    } else {
      print(response.statusCode);
    }
  }
}
