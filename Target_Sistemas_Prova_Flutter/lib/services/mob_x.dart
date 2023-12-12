import 'package:mobx/mobx.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'mob_x.g.dart';

class NextScreenStore = _NextScreenStore with _$NextScreenStore;

abstract class _NextScreenStore with Store{
  @observable
  ObservableList<String> items = ObservableList<String>();

  @action
  void addCard(String text){
    items.add(text);
  }

  @action
  void removeCard(int index){
    items.removeAt(index);
  }

  @action
  void updateCard(int index, String textController1){
    if(textController1.isNotEmpty){
      items[index] = textController1;
    }
  }

}


