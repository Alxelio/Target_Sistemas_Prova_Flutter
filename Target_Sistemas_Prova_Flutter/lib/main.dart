import 'package:flutter/material.dart';

void main(){
  runApp(MyApp(),);
}

class MockAPI{
  static Future<bool> validate_Credentials(String usuario, String senha) async {
    await Future.delayed(Duration(milliseconds: 300),);

    if( usuario == "Target" && senha == "Sistemas") return true;
    else return false;
  }
}

class NextScreen extends StatefulWidget {
  @override
  State<NextScreen> createState() => _NextScreenState();
}

class _NextScreenState extends State<NextScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("New Page"),
        ),
      ),
    );
  }
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
  TextEditingController usuarioController = TextEditingController(text: '',);
  TextEditingController senhaController = TextEditingController(text: '',);

  void loginPressed(BuildContext context) async {
    if( usuarioController.text.endsWith(" ") ){
      userFinalSpace(context);
      return;
    }

    if( senhaController.text.endsWith(" ") ){
      passwordFinalSpaces(context);
      return;
    }

    if( usuarioController.text.isEmpty ){
      alertUserIsEmpty(context);
      return;
    }

    if( senhaController.text.isEmpty ){
      alertPasswordIsEmpty(context);
      return;
    }

    if( senhaController.text.length < 2 || senhaController.text.length > 20){
      passwordCheckLength(context);
      return;
    }

    if( usuarioController.text.length > 20){
      userCheckLength(context);
      return;
    }

    if( !RegExp(r'^[a-zA-Z0-9]+$').hasMatch(senhaController.text ) ){
      alertSpecialPassword(context);
      return;
    }

    bool return200 = await MockAPI.validate_Credentials(usuarioController.text, senhaController.text);

    if( return200 == true ){
      Navigator.push(context, MaterialPageRoute(builder: (context) => NextScreen(),),);
    } else {
      newPageFailed(context);
      return;
    }

  }

  void alertSpecialPassword(BuildContext context){
    showDialog(context: context, builder: (context) => AlertDialog(
      title: Text("Erro de Validação !"),
      content: Text("Caracteres especiais não são aceitos na senha !"),
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
  }

  void alertUserIsEmpty(BuildContext context){
      showDialog(context: context, builder: (context) => AlertDialog(
        title: Text("Erro de Validação !"),
        content: Text("Campo do usuário está vazio, por favor preencha-o !"),
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
  }

  void alertPasswordIsEmpty(context){
      showDialog(context: context, builder: (context) => AlertDialog(
        title: Text("Erro de Validação !"),
        content: Text("Campo da senha está vazio, por favor preencha-o !"),
        actions: [
          TextButton(onPressed: (){
            Navigator.pop(context);
          },
          child: Text("Entendido"),
          ),
        ],
      ),
      );
      return;
    }

    void passwordCheckLength(BuildContext context){
      showDialog(context: context, builder: (context) => AlertDialog(
        title: Text("Erro de Validação !"),
        content: Text("O número de caracteres no campo senha deve ser maior ou igual a 2 e menor ou igual a 20 !"),
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
    }

    void userCheckLength(context){
      showDialog(context: context, builder: (context) => AlertDialog(
        title: Text("Erro de Validação !"),
        content: Text("O número de caracteres no campo usuário deve ser menor ou igual a 20 !"),
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
    }

    void userFinalSpace(BuildContext context){
      showDialog(context: context, builder: (content) => AlertDialog(
        title: Text("Erro de validação !"),
        content: Text("O campo usuário não pode terminar com espaços vazios ! Retire por favor o espaço vazio do final."),
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
    }

    void passwordFinalSpaces(BuildContext context){
      showDialog(context: context, builder: (context) => AlertDialog(
        title: Text("Erro de Validação !"),
        content: Text("O campo senha não pode terminar com espaços vazios ! Retire por favor o espaço vazio do final."),
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
    }

  void newPageFailed(context){
    showDialog(context: context, builder: (context) => AlertDialog(
      title: Text("Erro de Validação !"),
      content: Text("Ops! Usuário ou senha não conferem. Por favor insira as informações corretas !"),
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
                                    loginPressed(context);
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

