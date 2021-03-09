import 'dart:convert';
import 'package:http/http.dart' as http;

class User {
  var status;
  String userName;
  String password;
  User({this.userName, this.password});

  Future submitDataLogin(var nUsername, var nPassword) async {
    String apiURL = "192.168.0.14";
    final apiResult = await http.post(
        Uri.http(apiURL, 'flutter-server/login.php'),
        body: {"username": nUsername, "password": nPassword});

    final data = jsonDecode(apiResult.body);
    print(data);
    int value = data['value'];
    if (value == 1) {
      status = "signIn";
      return status;
    } else {
      status = "signOut";
      return status;
    }
  }

  Future submitDataRegister(
      dynamic name, dynamic email, dynamic nUsername, dynamic nPassword) async {
    String apiURL = "192.168.0.14";
    final apiResult =
        await http.post(Uri.http(apiURL, 'flutter-server/register.php'), body: {
      "username": nUsername,
      "email": email,
      "full_name": name,
      "password": nPassword,
    });

    final data = jsonDecode(apiResult.body);
    print(data);
    int value = data['value'];
    String message = data['message'];
    if (value == 1) {
      return message;
    } else {
      return message;
    }
  }
}
