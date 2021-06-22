import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gym_rats/modules/login/view/login_page.dart';
import 'package:gym_rats/modules/routes/routes.dart';
import 'package:http/http.dart' as http;

class SignUpService {
  signUp(String email, String password, BuildContext context) async {
    http.Response response = await http.post(
      Routes.signUp,
      body: json.encode(
        {"email": email, "password": password, "returnSecureToken": true},
      ),
    );
    print(response.statusCode);

    if (response.statusCode == 200) {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => LoginPage(
                    hintTextField: '',
                    iconTextField: null,
                  )));
    }
  }
}
