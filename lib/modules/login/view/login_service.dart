import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:gym_rats/modules/home/view/home_page.dart';
import 'package:gym_rats/modules/routes/routes.dart';
import 'package:http/http.dart' as http;

final snackBar = SnackBar(content: Text('Dados incorretos.'));

class LoginService {
  login(String email, String password, BuildContext context) async {
    http.Response response = await http.post(
      Routes.login,
      body: json.encode(
        {"email": email, "password": password, "returnSecureToken": true},
      ),
    );
    print(response.statusCode);

    if (response.statusCode == 200) {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => HomePage()));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }
}
