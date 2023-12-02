// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mob_x.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$NextScreenStore on _NextScreenStore, Store {
  late final _$informationAtom =
      Atom(name: '_NextScreenStore.information', context: context);

  @override
  String get information {
    _$informationAtom.reportRead();
    return super.information;
  }

  @override
  set information(String value) {
    _$informationAtom.reportWrite(value, super.information, () {
      super.information = value;
    });
  }

  late final _$_NextScreenStoreActionController =
      ActionController(name: '_NextScreenStore', context: context);

  @override
  void setInformation(String value) {
    final _$actionInfo = _$_NextScreenStoreActionController.startAction(
        name: '_NextScreenStore.setInformation');
    try {
      return super.setInformation(value);
    } finally {
      _$_NextScreenStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
information: ${information}
    ''';
  }
}
