import 'package:flutter/material.dart';

void main(){
  runApp(MyApp(),);
}

class MyApp extends StatelessWidget {
  //const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginPage(),
    );
  }
}


class LoginPage extends StatelessWidget {
  //const LoginPage({super.key});
  TextEditingController usuarioController = TextEditingController(text: '',);
  TextEditingController senhaController = TextEditingController(text: '',);

  void loginPressedSenha(BuildContext context){
    if( !RegExp(r'^[a-zA-Z0-9]+$').hasMatch(senhaController.text ) ){
      alertSenhaEspecial(context);
      return;
    }
  }

  void alertSenhaEspecial(BuildContext context){
    showDialog(context: context, builder: (context) => AlertDialog(
      title: Text("Erro de Validação !"),
      content: Text("Caracteres Especiais não são aceitos na senha !"),
      actions: [
        TextButton(
          onPressed: (){
            Navigator.pop(context);
          },
          child: Text("Entendido"),
        ),
      ],
    ),);
  }



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
                    //color: Colors.green,
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
                              controller: usuarioController,
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
                              controller: senhaController,
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
                                    loginPressedSenha(context);
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
                    //color: Colors.deepOrange,
                    height: 110,
                    width: double.infinity,
                    child: Column(
                      children: const [
                        SizedBox(height: 40,),
                        Text("Política de Privacidade", style: TextStyle(fontWeight: FontWeight.normal, fontSize: 15, color: Colors.white),),
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
}
