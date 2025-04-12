import 'package:bazar/core/blocs/base_user_bloc.dart';
import 'package:flutter/material.dart';

class WelcomeBloc extends BaseUserBloc{
  Future<bool> checkLogin() async {
    var accountInfo = await getUserInfo();
    return true;
  }
}