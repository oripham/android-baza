import 'package:flutter/material.dart';

import '../models/account.dart';

class BaseUserBloc with ChangeNotifier{
  late Account _account;

  Future<Account> login(String userName, String password) async {
    _account=Account(
        fullName: 'Nguyễn Văn A',
        email: 'nta@gmail.com',
        password: 'Abcd@1234',
        phoneNumber: '0123456789',
        token: 'vkhadjkghagoagoadifjgoiadf'
    );
    return _account;
  }

  Future<Account> getUserInfo() async {
    _account= Account(
        fullName: 'Nguyễn Văn A',
        email: 'nta@gmail.com',
        password: 'Abcd@1234',
        phoneNumber: '0123456789',
        token: 'vkhadjkghagoagoadifjgoiadf'
    );
    return _account;
  }

  Future<bool> tokenValidation(String token) async {
    return true;
  }
}