import 'package:flutter/material.dart';

class Credentials {
  final TextEditingController usuarioController;
  final TextEditingController senhaController;
  final String message;

  Credentials(this.usuarioController, this.senhaController, this.message);
}

