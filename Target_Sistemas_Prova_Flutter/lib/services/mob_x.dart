import 'package:mobx/mobx.dart';

part 'mob_x.g.dart';

class NextScreenStore = _NextScreenStore with _$NextScreenStore;

abstract class _NextScreenStore with Store {

  _NextScreenStore(){
    autorun(
      (_) {
        print(information);
      }
    );
  }

  @observable
  String information = '';

  @action
  void setInformation(String value) {
    information = value;
  }
}


