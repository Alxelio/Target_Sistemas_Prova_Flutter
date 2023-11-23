/* Presentation - Widgets - Message */
import 'package:flutter/material.dart';

void displayMessage(BuildContext context, message){
    showDialog(context: context, builder: (content) => AlertDialog(
      title: Text("Erro de validação !"),
      content: Text(message),
      actions: [
        TextButton(
          onPressed: (){
            Navigator.pop(context);
          },
          child: Text("Entendido"),
        ),
      ],
    ),
    );
    return;
  } /* Presentation - Widgets - Message */

