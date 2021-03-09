import 'dart:convert';
import 'package:http/http.dart' as http;

class User {
  String userName;
  String password;
  User({this.userName, this.password});
  Future<String> submitDataLogin(var nUsername, var nPassword) async {
    String apiURL = "192.168.0.14";
    final apiResult = await http.post(
        Uri.http(apiURL, 'flutter-server/login.php'),
        body: {"username": nUsername, "password": nPassword});

    final data = jsonDecode(apiResult.body);
    int value = data['value'];
    String pesan = data['message'];
    if (value == 1) {
      print('sukses');
    } else if (value == 2) {
      print(pesan);
    } else {
      print(pesan);
    }
  }
}
