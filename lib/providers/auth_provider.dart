import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:todoey/services/auth_service.dart';

class AuthModel extends ChangeNotifier {
  final storage = const FlutterSecureStorage();
  String? _token;
  bool isAuthorized = false;

  init() async {
    _token = await storage.read(key: 'token');
     print("Initilaize auth");
    isAuthorized = _token != null;

    notifyListeners();
  }

  Future login(String accessToken) async {

    storage.write(key: 'token', value: accessToken);
    print("Initilaize login");
    _token = accessToken;
    isAuthorized = true;

    notifyListeners();
  }

  logout() {
    _token = null;
    isAuthorized = false;
    storage.delete(key: 'token');
    print("Initilaize logout");
    notifyListeners();
  }
}
