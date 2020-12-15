import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

import './http_exception.dart';

class Auth with ChangeNotifier {
  String _token;
  DateTime _expireDate;
  String _userId;

  String get token {
    if (_expireDate != null &&
        _expireDate.isAfter(DateTime.now()) &&
        _token != null) {
      return _token;
    }
    return null;
  }

  bool get isAuth {
    return token != null;
  }

  Future<void> auth(String email, String password, String urlSegment) async {
    final url =
        'https://identitytoolkit.googleapis.com/v1/accounts:$urlSegment?key=AIzaSyCyiWwtJTDYKx28yAsoJndnkx_2u6Mhfg4';
    try {
      var response = await http.post(
        url,
        body: jsonEncode(
          {
            'email': email,
            'password': password,
            'returnSecureToken': true,
          },
        ),
      );
      print(response.body);
      var responseData = jsonDecode(response.body);
      if (responseData['error'] != null) {
        throw HttpException(responseData['error']['message']);
      }
      _token = responseData['idToken'];
      _userId = responseData['localId'];
      _expireDate =
          DateTime.now().add(Duration(seconds: responseData['expiresIn']));
      notifyListeners();
    } catch (e) {
      throw e;
    }
    notifyListeners();
  }

  Future<void> signUp(String email, String password) async {
    return auth(email, password, 'signUp');
  }

  Future<void> signIn(String email, String password) async {
    return auth(email, password, 'signInWithPassword');
  }
}
