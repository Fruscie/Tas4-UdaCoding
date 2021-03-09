import 'dart:convert';
import 'package:http/http.dart' as http;

class Galeri {
  Future<List> getGaleri() async {
    final response = await http
        .get(Uri.http('192.168.0.14', '/flutter-server/get_galeri.php'));
    return json.decode(response.body);
  }
}
