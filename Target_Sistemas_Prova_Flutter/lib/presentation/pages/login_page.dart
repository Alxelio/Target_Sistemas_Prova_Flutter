import 'package:flutter/material.dart';
import 'package:projeto_flutter_target_sistemas/services/navigation_services.dart';
import 'package:projeto_flutter_target_sistemas/services/validation_services.dart';
import 'package:projeto_flutter_target_sistemas/entities/credentials.dart';

class LoginPage extends StatelessWidget {
  final Credentials credentials;
  LoginPage(this.credentials);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color(0xFF1F5466), //rgba(31,84,102,255)
                Color(0xFF2D958E)
              ], // rgba(45,149,142,255)
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: ListView(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    height: 110,
                  ),
                  Container(
                    //color: Colors.yellow,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 60.0, vertical: 60.0),
                      child: Form(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(height: 30,),
                            const Text("  Usuário", style: TextStyle(fontWeight: FontWeight.normal, fontSize: 18, color: Colors.white),),
                            const SizedBox(height: 10,),
                            TextFormField(
                              controller: credentials.userController,
                              decoration: InputDecoration(
                                fillColor: Colors.white,
                                filled: true,
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                  borderSide: const BorderSide(
                                    color: Colors.white,
                                    width: 1.0,
                                  ),
                                ),
                                prefixIcon: const Icon(
                                  Icons.person,
                                  color: Color(0xFF21283A), //rgba(33,40,58,255)
                                ),
                              ),
                            ),
                            const SizedBox(height: 20,),
                            const Text("  Senha", style: TextStyle(fontWeight: FontWeight.normal, fontSize: 18, color: Colors.white),),
                            const SizedBox(height: 10,),
                            TextFormField(
                              controller: credentials.passwordController,
                              decoration: InputDecoration(
                                fillColor: Colors.white,
                                filled: true,
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                  borderSide: const BorderSide(
                                    color: Colors.white,
                                    width: 1.0,
                                  ),
                                ),
                                prefixIcon: const Icon(
                                  Icons.lock,
                                  color: Color(0xFF21283A), //rgba(33,40,58,255)
                                ),
                              ),
                            ),
                            const SizedBox(height: 40,),
                            Center(
                              child: SizedBox(
                                height: 60,
                                width: 180,
                                child: TextButton(
                                  style: ButtonStyle(
                                    shape: MaterialStateProperty.all(
                                      RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(50),
                                      ),
                                    ),
                                    backgroundColor: MaterialStateProperty.all(
                                      const Color(0xFF44BD6E),       //rgba(68,189,110,255) verde
                                    ),
                                  ),
                                  onPressed: (){
                                    loginPressed(context, credentials.userController, credentials.passwordController, credentials.message);
                                  },
                                  child: const Text("Entrar", style: TextStyle(fontWeight: FontWeight.normal, fontSize: 18, color: Colors.white),),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Container(
                    height: 110,
                    width: double.infinity,
                    child: Column(
                      children: [
                        const SizedBox(height: 40,),
                        GestureDetector(
                          onTap: (){
                            urlLink("https://www.google.com.br");
                          },
                          child: const Text("Política de Privacidade", style: TextStyle(fontWeight: FontWeight.normal, fontSize: 15, color: Colors.white),),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
} /* Presentation - Pages - Login Page */

