import 'package:mobx/mobx.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'mob_x.g.dart';

class NextScreenStore = _NextScreenStore with _$NextScreenStore;

abstract class _NextScreenStore with Store{
  @observable
  ObservableList<String> items = ObservableList<String>();

  _NextScreenStore(){
    loadItemsSharedPreferences();
    autorun((_) => saveItemsSharedPreferences(),);
  }

  @action
  void addCard(String text){
    items.add(text);
    saveItemsSharedPreferences();
  }

  @action
  void removeCard(int index){
    items.removeAt(index);
    saveItemsSharedPreferences();
  }

  @action
  void updateCard(int index, String textController1){
    if(textController1.isNotEmpty){
      items[index] = textController1;
      saveItemsSharedPreferences();
    }
  }

  @action
  Future<void> loadItemsSharedPreferences() async {
    try{
      SharedPreferences prefs = await SharedPreferences.getInstance();
      items = ObservableList<String>.of(prefs.getStringList('items') ?? []);
    } catch (e) {
      print("Mensagem de log de não carregamento concluído $e");
    }
  }

  @action
  Future<void> saveItemsSharedPreferences() async{
    try{
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setStringList('items', items.toList(),);
    }
    catch (e) {
      print("Mensagem de log de não salvamento concluído $e");
    }
  }

}
