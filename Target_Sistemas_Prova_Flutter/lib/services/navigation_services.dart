import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:projeto_flutter_target_sistemas/services/mob_x.dart';
import 'package:url_launcher/url_launcher_string.dart';

class NextScreen extends StatefulWidget {
  const NextScreen({super.key});

  @override
  State<NextScreen> createState() => _NextScreenState();
}

class _NextScreenState extends State<NextScreen> {
  final NextScreenStore store = NextScreenStore();
  final TextEditingController textController1 = TextEditingController();
  final FocusNode focus = FocusNode();

  @override
  void initState(){
    super.initState();
    store.loadItemsSharedPreferences();
  }

  Future<void> showEditConfirmDialog(index, text) async {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text("Digite um novo texto"),
            content: TextFormField(
              controller: textController1,
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.of(context).pop(),
                child: const Text("Cancelar"),
              ),
              TextButton(
                onPressed: () {
                  store.updateCard(index, textController1.text);
                  textController1.clear();
                  Navigator.of(context).pop();
                },
                child: const Text("Alterar"),
              ),
            ],
          );
        });
  }

  Future<void> showDeleteConfirmDialog(index) async {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text("Confirmar Exclusão"),
            content: const Text("Deletar"),
            actions: [
              TextButton(
                onPressed: () => Navigator.of(context).pop(),
                child: const Text("Cancelar"),
              ),
              TextButton(
                onPressed: () {
                  store.removeCard(index);
                  Navigator.of(context).pop();
                },
                child: const Text('Excluir'),
              ),
            ],
          );
        });
  }


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: GestureDetector(
          onTap: () {
            FocusScope.of(context).requestFocus(focus);
          },
          child: Container(
            //Geral
            height: double.infinity,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color(0xFF1F5466), //rgba(31,84,102,255)
                  Color(0xFF2D958E),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight, // rgba(45,149,142,255)])
              ),
            ),

            child: Column(
              children: [
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.fromLTRB(30, 30, 50, 40),
                    color: Colors.white,
                    child: Observer(builder: (context) {
                      return SizedBox(
                        height: 350,
                        child: ListView.builder(
                            shrinkWrap: true,
                            physics: const ClampingScrollPhysics(),
                            itemCount: store.items.length,
                            itemBuilder: (context, index) {
                              return CardItem(
                                text: store.items[index],
                                onDelete: () => showDeleteConfirmDialog(index),
                                onUpdate: () => showEditConfirmDialog(
                                    index, store.items[index]),
                              );
                            }),
                      );
                    }),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.fromLTRB(30, 0, 50, 0),
                  child: TextFormField(
                    controller: textController1,
                    focusNode: focus,
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                      fillColor: Colors.white,
                      filled: true,
                      contentPadding:
                          const EdgeInsets.symmetric(horizontal: 10.0),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide:
                            const BorderSide(color: Colors.white, width: 1.0),
                      ),
                      hintText: 'Digite seu texto',
                      hintStyle: const TextStyle(
                        color: Colors.black87,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    onFieldSubmitted: (text) {
                      if (text.isNotEmpty) {
                        store.addCard(text);
                        textController1.clear();
                      }
                    },
                  ),
                ),
                const SizedBox(
                  width: double.infinity,
                  height: 90,
                ),
                const SizedBox(
                  width: double.infinity,
                  height: 40,
                  child: Center(
                    child: Text(
                      'Política de Privacidade',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  width: double.infinity,
                  height: 20,
                ),
              ],
            ),
          ), //Geral
        ),
      ),
    );
  }
} //class


class CardItem extends StatelessWidget {
  const CardItem(
      {required this.text, required this.onDelete, required this.onUpdate});

  final String text;
  final VoidCallback onDelete;
  final VoidCallback onUpdate;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Card(
          color: Colors.white,
          margin: const EdgeInsets.symmetric(vertical: 8),
          child: Container(
            color: Colors.transparent,
            child: ListTile(
              tileColor: Colors.transparent,
              title: Center(
                child: Text(
                  text,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  InkWell(
                    onTap: () {
                      onUpdate();
                    },
                    child: const Icon(
                      Icons.edit,
                      size: 35,
                    ),
                  ),
                  const SizedBox(width: 8.0),
                  InkWell(
                    onTap: () {
                      onDelete();
                    },
                    child: const CircleAvatar(
                      backgroundColor: Colors.red,
                      radius: 15.0,
                      child: Icon(
                        Icons.close,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

Future<void> urlLink(String url) async {
  await canLaunchUrlString(url)
      ? await launchUrlString(url)
      : throw "It is now allowed to open $url";
}

