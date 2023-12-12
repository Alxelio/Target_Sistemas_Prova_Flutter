// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mob_x.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$NextScreenStore on _NextScreenStore, Store {
  late final _$itemsAtom =
      Atom(name: '_NextScreenStore.items', context: context);

  @override
  ObservableList<String> get items {
    _$itemsAtom.reportRead();
    return super.items;
  }

  @override
  set items(ObservableList<String> value) {
    _$itemsAtom.reportWrite(value, super.items, () {
      super.items = value;
    });
  }

  late final _$_NextScreenStoreActionController =
      ActionController(name: '_NextScreenStore', context: context);

  @override
  void addCard(String text) {
    final _$actionInfo = _$_NextScreenStoreActionController.startAction(
        name: '_NextScreenStore.addCard');
    try {
      return super.addCard(text);
    } finally {
      _$_NextScreenStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
items: ${items}
    ''';
  }
}
