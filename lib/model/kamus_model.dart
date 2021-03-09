import 'dart:convert';
import 'package:http/http.dart' as http;

class Kamus {
  Future<List> getKamus() async {
    final response = await http
        .get(Uri.http('192.168.0.14', '/flutter-server/get_kamus.php'));
    return json.decode(response.body);
  }
}
