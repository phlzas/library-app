import 'package:flutter/material.dart';
import 'package:libarary/models/Auth_model.dart';
import 'package:libarary/services/Auth_service.dart';

class AuthProvider extends ChangeNotifier {
  AuthModel ?authModel;
  Future<void> signin ({
    required String name,
    required String email,
    required String password,
    required String phoneNumber,
  })async {
  authModel =await AuthService().sigin(name: name, email: email, password: password, phoneNumber: phoneNumber);
  }
  Future<void> login({
    required String email,
    required String password,
  }) async {
  authModel = await AuthService().login(email: email, password: password);
  
  }
}