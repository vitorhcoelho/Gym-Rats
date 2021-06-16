import 'dart:convert';
import 'dart:js';
import 'package:flutter/material.dart';
import 'package:gym_rats/main.dart';
import 'package:gym_rats/modules/routes/routes.dart';
import 'package:http/http.dart' as http;

class LoginService {
  login(String email, String password) async {
    http.Response response = await http.post(
      Routes.login,
      body: json.encode(
        {"email": email, "password": password, "returnSecureToken": true},
      ),
    );
    print(response.statusCode);

    if (response.statusCode != 200) {}
  }
}
