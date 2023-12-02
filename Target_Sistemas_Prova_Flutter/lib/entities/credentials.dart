import 'package:flutter/material.dart';

class Credentials {
  final TextEditingController userController;
  final TextEditingController passwordController;
  final String message;

  Credentials(this.userController, this.passwordController, this.message);
}

